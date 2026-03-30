---
title: "Milestone 2: Infrastructure"
description: |
  Setting up project monorepos for success.
date: 2026-02-27
blogpost: true
location: Project
author: 20%
language: 2026-04-10
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
├── <code for your App Dev II project work>
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

## Roadmap

Write 3-4 epic user stories that should be fulfilled by the end of the project,
which must be added as Github Issues within your Github repo.  

## Documentation


## CI/CD


### GitHub Actions

- <https://docs.expo.dev/build/building-on-ci>
- <https://docs.github.com/en/actions/tutorials/build-and-test-code/python>
- 

### Versioning
 
- <https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository>
- <https://devtoolhub.com/git-tags-releases-best-practices/>


