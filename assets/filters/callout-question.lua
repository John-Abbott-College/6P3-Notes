-- Adatped from:
-- https://github.com/quarto-dev/quarto-cli/issues/844
-- https://github.com/cambiotraining/quarto-course-template/blob/main/_extensions/courseformat/callout_question.lua

local number_questions = true
local hide_answers = false
local questions = {}  -- Table to store question IDs and titles
local question_counter = 0  -- Global counter for questions
local seen_ids = {}  -- Table to track seen IDs and check for duplicates

-- function to throw a yellow warning
function warn(message)
  local yellow = "\27[33m"
  local reset = "\27[0m"
  io.stderr:write(yellow .. "WARN: " .. message .. reset .. "\n")
end

-- Meta function to read yml metadata
function Meta(meta)
  if meta["questions"] and meta["questions"]["number"] == true then
    number_questions = true
  end

  if meta["questions"] and meta["questions"]["hide-answers"] == true then
    hide_answers = true
  end
end

-- Div function to process questions and answers
function Div(div)
  -- Process callout-question divs
  if div.classes:includes("callout-question") then
    question_counter = question_counter + 1
    local question_number = "Question " .. question_counter  -- Always generate the number

    -- Store question ID and title if it has an ID starting with "q-"
    if div.identifier and div.identifier:match("^q%-") then
      -- Check for duplicate IDs
      if seen_ids[div.identifier] then
        warn("Duplicate question ID found: #" .. div.identifier)
      end

      seen_ids[div.identifier] = true
      questions[div.identifier] = question_number
    end

    -- Process the header within the question
    if div.content[1] ~= nil and div.content[1].t == "Header" then
      local title = pandoc.utils.stringify(div.content[1])
      div.content:remove(1)  -- Remove the original header from content
      local final_title = number_questions and question_number .. " - " .. title or title
      return quarto.Callout({
        type = "question",
        content = { div },
        title = final_title,
        icon = false,
        collapse = false
      })
    else
      -- If no header, use just the question number (if numbering is on)
      local final_title = number_questions and question_number or nil
      return quarto.Callout({
        type = "question",
        content = { div },
        title = final_title,
        icon = false,
        collapse = false
      })
    end
  end

  -- Process callout-answer divs
  if div.classes:includes("callout-answer") then
    if (hide_answers and div.attributes["hide"] ~= "false") or div.attributes["hide"] == "true" then
      return pandoc.RawBlock('html', '<div hidden></div>')
    else
      return quarto.Callout({
        type = "answer",
        content = { div },
        title = "Answer",
        icon = false,
        collapse = true
      })
    end
  end

  -- Process callout-hint divs
  if div.classes:includes("callout-hint") then
    return quarto.Callout({
      type = "hint",
      content = { div },
      title = "Hint",
      icon = false,
      collapse = true
    })
  end
end

-- Replace cross-references in Pandoc elements
function Pandoc(doc)
  -- Walk through the document and replace any Str element that matches @q-*
  local function replace_xref(elem)
    if elem.t == "Str" and elem.text:match("^@q%-") then
      local id = elem.text:sub(2)  -- Remove the "@" prefix
      local question_title = questions[id]
      if question_title then
        -- Return the custom HTML link
        return pandoc.Link(
          question_title,
          '#' .. id,
          ''
        )
      else
        -- If the ID is not found, throw a warning
        warn("Undefined question cross-reference: @" .. id)
      end
    end
    return elem
  end

  -- Apply the replacement to all inline elements
  return doc:walk({
    Str = replace_xref
  })
end

-- Return the filter
return {
  { Meta = Meta },
  { Div = Div },
  { Pandoc = Pandoc }
}
