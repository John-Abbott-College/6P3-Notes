
#### `grep`

_This section was adapted from [@MasteringLinuxGrep2024]_

The Linux `grep` command is one of the most powerful and frequently used tools for text
search and data filtering. Whether you’re managing system logs, searching through files,
or debugging code, `grep` helps you find specific patterns within large sets of data quickly
and efficiently.

The basic syntax of `grep` is as follows:

`grep [OPTION...] PATTERNS [FILE...]`

- `[OPTION...]`: various options you can provide `grep` to modify the default behavior.
- `PATTERNS`: the string or
    [regular expression](https://en.wikipedia.org/wiki/Regular_expression) you want to
    search for.
- `[FILE...]`: the file(s) where you want to search.

##### Practical examples

Essentially, grep searches for a pattern and displays the matching lines. Here are a few common use-cases:

###### Example 1: Searching for a Word in a File

If you want to search for a specific word in a file, the most basic command would be:

`grep "word" filename.txt`

This will return all lines in filename.txt that contain the word “word.”

###### Example 2: Case-Insensitive Search

By default, grep is case-sensitive. If you want to ignore case distinctions, you can use the `-i` option:

`grep -i "word" filename.txt`

This command will return matches for both “Word” and “word” in `filename.txt`.

###### Example 3: Searching Across Multiple Files

To search for a pattern in multiple files at once, you can use wildcards `*`:

`grep "word" *.txt`

This will search for “word” in all `.txt` files in the current directory.

###### Example 4: Displaying Line Numbers

To see the line numbers where the matches occur, use the `-n` option:

`grep -n "word" filename.txt`

This command will display the line numbers along with the matching lines.

###### Example 5: Recursive Search in Directories

If you want to search for a pattern across all files in a directory and its subdirectories, use the `-r` (recursive) option:

`grep -r "word" /path/to/directory/`

This will search for “word” in all files within `/path/to/directory/`, including subdirectories.

###### Example 6: Inverting Search (Exclude a Pattern)

If you want to exclude lines that contain a specific pattern, you can use the `-v` option:

`grep -v "word" filename.txt`

This command will return all lines that do not contain “word”.

###### Example 7: Counting Matches

To count how many times a pattern appears in a file, use the `-c` option:

`grep -c "word" filename.txt`

This will output the number of lines that contain “word” in `filename.txt`.
