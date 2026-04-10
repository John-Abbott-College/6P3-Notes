---
title: "Milestone 2: Infrastructure"
description: |
  Setting up project monorepos for success.
date: 2026-02-27
blogpost: true
location: Project
author: 20%
language: 2026-04-13
---

In this milestone, you will set up your github monorepo
with appropriate CI/CD and documentation infrastructure.

## Wrapping up Milestone 1

- On your project repository, click "Sync Fork" to update your `instructions` branch.
- Follow the instructions in the `README.md` to merge your changes from brach `m1` into
a newly created `main` branch.

## File Structure

Overall repo structure:

```
README.md
docs/
├── <documentation code>
app/
├── <code for your App Dev III project work>
reterminal/
├── <subsystem1>
├── <subsystem2>
├── <subsystem3>
```

Each project subsystem:

```
subsystem/
├── controller
│   ├── pyproject.toml
│   ├── README.md
│   └── ...
├── dashboard
│   ├── package.json
│   ├── README.md
│   └── ...
```

If you're not sure how to **to start**, each team member should add their **assignment 1** code to a
`reterminal/subsystem/` directory. You will adapt your assignment 1 code to meet the
requirements of your project in assignment 2 and future milestones.

## Repository Management Tasks

In class on April 10, we collaboratively filled the following forms with project
management tasks for each team and each group member: <https://forms.office.com/r/HmcjW9ACKn>

## Requirements

- Participate in the discussion about what tasks are important for your group on April 10
- Complete the form above by Friday April 10
- Delegate tasks among team members
    - Use GitHub Issues for this, tag the group member(s) assigned to the task
- Each partner should have at least started their tasks by Monday April 13
