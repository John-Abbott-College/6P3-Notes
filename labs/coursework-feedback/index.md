---
title: "L5: Coursework Feedback"
subtitle: |
  Organizing the coursework repository.
date: 2026-03-16
blogpost: true
location: Lab
author: 3%
language: 2026-04-10
---

## Overview

In this lab, you will resolve a series of pull requests in your coursework repository.

Basically, each of the labs you have done have their own branch -- I will make a pull
request for each.

In this lab, you will apply the feedback I give you, and merge those pull requests into a
new `main` branch.

More instructions TBA very soon!

## Create a `main` branch

To begin, create a new `main` branch from the **very first commit on the `instructions`
branch** of your repository

You can either do so using the GitHub web interface or from the `git` command line tool:

- `git`: use `git switch -c <new-branch-name> <starting-commit-hash>`
    - see `git switch --help` for more information about this
- GitHub: <https://stackoverflow.com/a/18137009>

Make sure that the new `main` branch is pushed to your GitHub repository. It should just
have the initial `instructions` commit and nothing else.

## Create pull requests from each lab branch 

For each lab branch (and the assignment branch) you have created so far, **create a pull
request** that incorporates the changes *from* that branch *to* the new `main` branch.

**IMPORTANT: DO NOT MERGE THE PULL REQUEST**. I will be making comments on that pull
request.

## Review your own work

For each lab asssessment (and the assignment assessment), review the commits you made and
the final state of your lab.

Review also the original requirements from the assessment (see the course website).

Then, add a comment on your pull request with the following information:

- a score out of 5 assessing the quality of your work (main criteria: did you meet all the requirements?)
- a score out of 5 assessing your understanding of the material (main criteria: how well
do you remember what you did? Do all of the concepts still make sense? Did they make sense
at the time?)


