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

The tasks:

:::{list-table}

- - Task
  - Short description
  - Example skills/techniques
- - 1. Documentation
  - Creating documemtation that usefully summarizes your project and how to use it.
  - GitHub Readmes, static site generator, automated API documentation 
- - 2. Project Versioning
  - Keeping track of your projects history through an explicit versioning scheme
  - Semantic versioning, changelogs, integration with github/build process
- - 3. Project building / packaging
  - Making your project code easy to distribute to others, both from source code and from
    a package manager
  - Creating a usable CLI/API for building/running from source, making a python project available on `pypi.org`, automating with github actions,
  integrating with versioning scheme
- - 4. Project code quality 
  - Creating and enforcing project standards for formatting, linting, functionality
  - writing unit tests for python/typescript, configuring tools for formatting/linting, automating with GitHub Actions
- - 5. Project history management
  - how to write git commits and use branching, along with versioning, that makes reverting to previous changes / contributing to your project sane rather than stressful/annoying
  -
- - 6. Project task management
  - tracking work over time, and remaining work, using issue management. Ideally,
  associating pull requests with issues
  - GitHub Issues, Jira
- - 7. Other?
  - ?
  - ?

:::

## Requirements (due April 13)

- Participate in the discussion about what tasks are important for your group on April 10
- Participate in the discussion (after deeper reflection) about what tasks are important for your group on April 13
- Complete the [microsoft form
about your personal/team preferences for project management tasks](https://forms.office.com/r/HmcjW9ACKn) by Friday April 10
- Delegate tasks among team members
    - Create GitHub Issues for this, tag the group member(s) assigned to the task
- Each partner should have at least started their tasks by Monday April 13
- Each partner should have pushed their assignment 1 code to a `reterminal/subsystem`
directory (see the File Structure section above)
