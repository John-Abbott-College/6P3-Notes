---
title: "L1: Developer Environment Setup"
subtitle:
  Setting up the development stacks and hardware we will use throughout the semester.
date: 2026-01-19
blogpost: true
location: Lab
author: 1%
language: 2026-01-24
---

## Objectives

1. Set up and use lab software

    1. Understand how to use the classroom computers / your personal computers for classwork
    1. Create a WSL container on the classroom computer
    1. Install and update packages on the Debian operating system

1. Use git/GitHub for completing and submitting lab and assignment work

    1. Set up coursework repository we will use throughout the semester

1. Review Bash essentials

    1. Using bash and ssh on the command line
    1. Review bash commands / operations


## Overview<a name="overview"></a>

This lab walks through setting up the developer environment we will use throughout the semester, followed a short lab reviewing and developing `bash` skills.

### Context<a name="context"></a>

In this course, we will frequently run code and commands on a raspberry pi.

An efficient way to work on a remote computer like the pis is to setup a remote `bash` connection using `ssh`.

That way, you can *write* code on a preferred computer, while *running* code and other commands directly on the raspberry pi as you work.

Using `ssh` effectively requires getting comfortable with the CLI shell -- in this course, our shell will be `bash`.

Part of getting comfortable with `bash` is simply getting in the habit of *using* it for *useful* things.

## Setup

Complete each of the following tasks:

1. On Moodle, complete the Lab 1 [Hardware & stuff survey](https://moodle.johnabbott.qc.ca/course/section.php?id=12074)
2. Complete the [Developer environment prerequisites](/lectures/developer-environment/index)

    ```{note}
    If you will use a personal computer for this class, you need to do the developer environment set up on BOTH (1) a lab computer and (2) your personal computer(s).
    ```

3. Sign up for the {{ '[course repository on GitHub Classrooms]({})'.format(course_repository) }}
4. Clone the coursework repository onto your developer environment

## bash bandit

To get us warmed up with using `ssh` to connect to a remote computer, and using the various `bash` tools at our disposal, the [bash bandit] game is great practise.

For this lab, we will aim to complete all levels up to and including **Level 5->6**.

[![](./assets/bandit-screenshot.png)][bash bandit]
*Each level of the bandit game requires you use one or more bash commands to complete the level.*

### Getting started

- Open a terminal on your developer environment. All `ssh` commands for the game will be done here.
  - On Windows, use your WSL container
  - If working on OSX or Linux, use your default terminal
- Open `lab-1/bandit-instructions.txt` in VSCode
  - You will use this file to record your progress through the lab.
- The instructions for the lab are contained in the game itself.
  - **IMPORTANT** read the [Note for beginners][bash bandit]! It answers many of the questions you will no doubt have...
  - Then, proceed to Level 0
    - **IMPORTANT** read **Level Goal** and the **Commands you may need to solve this level** for each level. They're helpful!
    - **IMPORTANT** Use **man <command>** to see what the suggested command can do for you. Use `Ctrl + d` and `Ctrl + u` to scroll up and down the terminal efficiently, and `/` to search.


````{note}
if you are getting “hostname not resolved” issues in WSL, follow the steps below:

1. sudo vim /etc/wsl.conf , add the following lines:

    ```text
    [network]

    generateResolvConf = false
    ```

2. sudo vim /etc/resolv.conf , add the line:

    ```text
    nameserver 8.8.8.8
    ```

3. sudo chattr -f +i /etc/resolv.conf

For more detail, see [https://askubuntu.com/questions/1364984/dns-not-working-on-wsl](https://askubuntu.com/questions/1364984/dns-not-working-on-wsl)
````

### Documenting your progress<a name="documenting-your-progress"></a>

As you complete each level, write down in `lab-0/bandit-instructions.txt` the following:

- the password needed to start the next level
- the commands used to find the file
- comments explaining the commands
  - e.g. necessary paramaters/flags

```{note}
In each level, the password is a long string of random characters stored in a file on the server. You will need to copy and paste the password frequently -- from your `bandit-instructions.txt` and to your bandit game terminal.

Copy/paste is a bit different on terminals than you may be used to:

- Highlight the text holding `Left+click`
- Copy the text using `Ctrl+Shift+C`
- Paste the text using `Ctrl+Shift+V`
```

Follow the format in the `bandit-instructions.txt` file. Make sure you read and follow the instructions given in the comments (marked by `#`).

**Don't be shy**: you should be `committing` and `pushing` your progress to your branch regularly, even if it is not finished -- this will let you continue where you left off easily no matter what computer you are working on.

## In-class demo<a name="in-class-demo"></a>

During class on Monday/Friday, I will take note of your progress. Let me know if you finish early -- I will ask you a few questions about your work. If you do not finish by Friday, I'll ask you about what you have been able to do so far.

## Finished early?

Try to complete more of the bash bandit game! We will be returning to this in future labs, so your time won't be wasted.

## Rubric

1. [ ] Hardware & Stuff survey complete on Moodle
1. [ ] WSL set up on lab computer
1. [ ] Dev environment on personal computer (one of four options)
    - [ ] Windows: Same as lab computer
    - [ ] OS X: [OSX setup](/lectures/developer-environment/index) complete
    - [ ] Linux: [Linux setup](/lectures/developer-environment/index) complete
    - [ ] None of the above (if no personal computer will be used)
1. [ ] coursework repository cloned to your developer environment
1. [ ] bash bandit game started
1. [ ] progress made on `bandit-instructions.txt` has been committed and pushed to your coursework repository
1. [ ] On Friday Jan 24, you have showed your progress on all of the above to the instructor.

[bash bandit]: https://overthewire.org/wargames/bandit/
