---
title: 'L1 Part 2: Bash Better'
description: |
  Polish developer environment setup
  Review bash fundamentals by completing the bandit game.
  Review bash scripting/function re-use
date: 2026-01-26
blogpost: true
location: Lab
author: 1%
language: 2026-01-31
---

## Deliverables<a name="deliverables"></a>

For each deliverable, click the hyperlink to navigate to the complete instruction set.

- [0% Configure VSCode](#configure-vscode)
  - Deadline: Monday Jan 31 (beginning of class)
- [0.2% Using git](#using-git)
  - Goal: Authenticate `git` commands in dev env terminal without VS Code.
  - Deadline: Monday Jan 31 (end of class)
- [0.8% Better bash bandit](#better-bash-bandit)
  - Goal: Complete `lab-1/bandit-instructions.txt` up to Level 11-12
  - Goal: Complete the `functions.bashrc` file
  - Deadline: Monday Jan 31 (11:59pm)

## Overview<a name="overview"></a>

It is very natural, when taking on a new project, to discover new needs only after beginning work on that project.

Documenting our progress on the [bandit](https://overthewire.org/wargames/bandit/) game has revealed a few areas we could improve our workflow:

- Ensure VSCode is configured to use your developer environment.
    1. Install necessary VSCode extensions
- Keeping your `git` repo confidently in sync across many machines and in the face of changing upstream
    1. Set up a [personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens) for using `git` outside of VSCode
    1. Use [`pass`](https://www.passwordstore.org/) to securely store and access your GitHub personal access token
    1. Use `git` on the command line to manage your repository branches
- Taking advantage of bash **text-processing** utilities to create beautiful and useful scripts.
    1. Solve a few more levels of bandit
    1. Review/write bash scripts for reusing useful text-processing command patterns
    1. Understand the difference between *interactive* and *scripted* bash usage.

This lab will address each of these needs in turn with a few instructions and exercises.

## Configure VSCode

- Install the WSL Extension on VSCode
- From now on, ensure all of your projects are done in your developer environment
- A few more clarifications to come shortly, but it's pretty straightforward.

## Using git<a name="using-git"></a>

For this deliverable, you'll need to show me that:

- You have `pass` set up with your personal GitHub Access token
- You can use `git` to keep your repository up to date when the remote `instructions` branch changes.

The following paragraphs show you how.

Many `git` operations require authentication to get permission. Some
examples:

- Pushing to a repository
- Pulling from a private repository
- Using [*GitHub CLI*](https://cli.github.com/)

Since July 2021, [*GitHub no longer accepts account
passwords*](https://github.blog/2020-12-15-token-authentication-requirements-for-git-operations/#what-you-need-to-do-today)
to authenticate git operations. You have probably run into this error many times when trying to push changes or clone your private repositories on a new machine.

The only reason VSCode works out of the box is because VSCode and GitHub are integrated by default, both being owned by Microsoft.

The following tasks gives us more flexible and useful ways to authenticate `git` commands with GitHub.

### Part 1: Set up `pass`<a name="part-1-set-up-pass"></a>

We will use [*pass*](https://www.passwordstore.org/) to securely manage our personal access tokens on our developer environment.

First, ensure `pass` and some useful related dependencies are installed:

```bash
# On WSL / Linux
sudo apt install pass pass-extension-otp zbar-tools

# On macOS
brew install pass pass-otp zbar
```

You probably already did this in the previous lab.

You'll need to generated a `gpg` key-pair in order to use `pass`. Follow the instructions below:

> [!NOTE]
> The GitHub instructions mention using `git bash` -- ignore them, you have a developer environment to use instead.
>
> In general, when I link to external instructions, you will need to pay attention to what parts of them may be different
> in our class. This is a good skill in general for making effective use of resources posted online when learning a new skill.

1. Create the gpg key-pair following the instructions on GitHub: [*Generating a new GPG key*](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key)
1. run `gpg --full-generate-key` to get started.
1. Recommended: You can accept the default key type (RSA)
1. Recommended: Choose 4096 bits for the keysize.
1. Recommended: You can accept the default "does not expire" option.
1. Enter user ID information. This information should match what you have provided to GitHub already (username/email address)
1. You have to choose a password for GPG keys. Choose something strong that you can remember.
1. Add the public key to your GitHub account following the instructions: [*Adding a GPG Key to your GitHub account*](https://docs.github.com/en/authentication/managing-commit-signature-verification/adding-a-gpg-key-to-your-github-account).

The name of the key on GitHub does not matter (Personal GPG Key is fine)

The command: `gpg --armor --export` prints your key to the console, you can copy/paste this output for GitHub

Even better: use a pipe to `clip.exe` to put the key in your clipboard automatically with `gpg --armor --export | clip.exe`

- on macOS: use `pbcopy` instead of `clip.exe`
- on Linux: use `xclip` or `wl-copy` instead of `clip.exe`

Once you've created the `gpg` key-pair, we can now set up `pass`:

```bash
pass init <the-email-you-used-for-gpg-key>
```

In the next step, we're going to create a GitHub Personal Access Token and store it in your `pass` store for easy and secure access.

### Part 2: Getting a personal access token and storing it in `pass`<a name="part-2-getting-a-personal-access-token-and-storing-it-in-pass"></a>

Read [*"Managing your personal access tokens"*](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens)
on Github, and create a **classic** (not fine-grained) **personal access
token**.

At the very least, select the **repo** scope -- this will give your
token the ability to authenticate using git on the CLI. You can select
all other scopes as well if you like.

Once you're finished, you'll see your token is a string of the following form:

```
ghp_<long string of letters and numbers
```

Copy this string to your clipboard. Then, open your developer terminal:

```bash
$ pass insert github/token
Enter password for github/token: # paste your token here, then press enter
```

Once you've done this, you should be able to access your token using `pass github/token`, or `pass github/token | clip.exe` to place it on your clipboard directly.

## Better Bash Bandit<a name="better-bash-bandit"></a>

For this deliverable, your grade will be based on:

- The completeness of `lab-1/bandit-instructions.txt`
  - Full marks for completing **Level 0-1 through Level 11-12**, part marks for some missing or incorrect commands
- Finishing `functions.bashrc`
  - Full marks for completed `grepcmd` and `banditsolve` functions

See the instructions below for requirements to complete each part.

### Part 0: Step-by-step to quickly solving bandit levels<a name="part-0-step-by-step-to-quickly-solving-bandit-levels"></a>

There are a few concepts that will be useful to know for finishing these tasks:

- Running commands over `ssh`
- Combining bash commands using pipes and redirects
- Reusing bash commands by writing them in a script or library

I've provided some video demonstrations below, **try them out on your own terminal and see if you can replicate them!**

#### Running a command over ssh:<a name="running-a-command-over-ssh"></a>

Here's the syntax for running a command directly over `ssh`:

```bash
# General syntax
ssh [-l login_name] [-p port] DESTINATION [command [argument...]

# Example: `tac` the readme (tac is reverse of cat)
ssh -p 2220 bandit0@bandit.labs.overthewire.org tac readme
```

Here's a demonstration of what it should look like -- first running `ssh` without any extra arguments, and then running it with `ls`, `cat`, and `tac`. This shows how you can solve bandit levels without without launching an interactive `ssh` shell:

![](./assets/ssh-eg.gif)
*Demonstration of using the optional `command [argument...]` when invoking ssh.*

#### Combining bash commands using pipes<a name="combining-bash-commands-using-pipes"></a>

We can go further than this -- let's try cutting the output from our `ssh` command to JUST the password. How? We can use `|` to combine various bash commands.

Here's an example of a first step you might take. There's a few blank lines in the output, by default.

How can we get rid of blank lines using bash? There's [at least three different tools, each with a few different options](https://stackoverflow.com/a/39139322), that can get the job done.

The simplest to reason about is probably `grep -v`. What does the `-v` argument do? Run `man grep` and use `/` to search for `-v`!

Here's the syntax for how you might do it:

```bash
# General syntax: pipe stdout of command1 to command2
command1 | command2

# Example: only grab the first two lines of previous command
ssh -p 2220 bandit0@bandit.labs.overthewire.org tac readme | grep -v '^$'
```

And here's a demo of it in action:

![](./assets/pipe-eg.gif)
*Demonstration of combining bash commands with `|`, in this case piping the result into `grep -v` to remove blank lines.*

What happened here? `grep -v <pattern>` means *remove* any lines from `stdin` that match the pattern. In this case, the pattern was `^$` -- `^` matches the beginning of the line, and `$` the end of the line, so this can only match with lines that *have no content in them* -- blank lines.

Once we have that, there's nothing stopping us from chaining together more bash commands with `|`! Try these commands out yourself to get the hang of it -- the nice thing is you get immediate feedback.

![](./assets/building-blocks-eg.gif)
*Iterating on bash combinations to build complex behavior using pipes.*

#### Using the CLI clipboard to store commands & results<a name="using-the-cli-clipboard-to-store-commands--results"></a>

The nice part about running commands over `ssh` like this is that we can quickly put the results in our clipboard using `| clip.exe`:

- Note: use `| pbcopy` on macOS\`

![](./assets/clipboard-eg.gif)
*Using `| clip.exe` (`| pbcopy` on macOS) to store password results, and commands, in our clipboard for convenient pasting into `bandit-instructions.txt`*

### Part 1: Better bandit-instructions.txt<a name="part-1-better-bandit-instructionstxt"></a>

The demonstrations above show how I got the solution for `Level 0-1` of the lab.

Your job will be to do the same thing for all following levels, up to `Level 11-12`.

#### Requirements<a name="requirements"></a>

- Except for `Level 0`, all levels should use the format `Level N-N+1`.

- For each `Level N-N+1`, the `Password:` field should be the password for getting into `Level N`

  - e.g., the password for `Level 0-1` is `bandit0` for logging into `bandit0`; the provided command gets the password for the next level (`bandit1`).

- For each level, the `Command:` field should with **just one line**.

  - On some levels (`Level 1-2` and `Level 2-3` for example) that can done easily with just one command.
  - On other levels (like `Level 0-1`), you will need to chain together a few commands in a series of pipes

- The result of running the command for each level should prints *only the password* to stdout, and no other extra text.

- For each level, you are also required to explain your work! There are many ways to solve all of these problems so no one's solutions should be exactly the same -- particularly not your comments, which should explain each command in the pipe chain.

Here is an example of what all of your levels should look like when you are finished:

```
Level 0-1
  - Password: bandit0
  - Commands:
    - `tac readme | sed '/./,$!d' | head -n 1 | cut -d ':' -f2 | tr -d '[:blank:]'`
  - Comments:
    - `tac readme`: read the readme backwards with tac
    - `sed '/./,$!d'`: <your explanation goes here>
    - `head -n 1`: <your explanation goes here>
    - `cut -d : -f 2`: <your explanation goes here>
    - `tr -d '[:blank:]'`: <your explanation goes here>
```

You will need to do the same thing for each level up to `Level 11-12`.



Keep commiting your progress on `bandit-instructions.txt` to the `lab-1` branch of your repository.

**HINT**: some commands you will find useful. Check the `man` page for each.

```bash
sort
uniq
tr
strings
base64
```

### Part 3: Defining and re-using bash functions

In this part of the lab, we're learning how to generalize useful bash snippets we write into re-usable functions.

We will do this by writing our functions in a file that we can later `source`. In a sense, we are creating a library, rather than a single script.

#### Getting started

There are a couple functions already written for you in `functions.bashrc`: `greppwd` and
`banditstart`.

Try using these functions by running `source` on the `functions.bashrc` file:

```bash
# NOTE: make sure you are in the `lab-2` directory when you run these commands!
$ greppwd "Level 0-1"
-bash: greppwd: command not found

$ source functions.bashrc

$ greppwd "Level 0-1"
bandit0
```

### Useful course notes

Here are parts of the course notes that will be particularly useful for this lab:

- [bash `source`](https://john-abbott-college.github.io/6P3-Notes/notes/bash-scripting/#source)
- [bash variables](https://john-abbott-college.github.io/6P3-Notes/notes/bash-scripting/#variables)
- [bash conditionals](https://john-abbott-college.github.io/6P3-Notes/notes/bash-scripting/#conditionals)
- [bash exit codes](https://john-abbott-college.github.io/6P3-Notes/notes/bash-scripting/#exit-codes)
- [bash functions](https://john-abbott-college.github.io/6P3-Notes/notes/bash-scripting/#functions)
- [bash redirects](https://john-abbott-college.github.io/6P3-Notes/notes/bash-essentials/#redirection-and-pipes)

### Tasks

Complete the following tasks to finish this lab.

Note: many of these tasks are explained further in the comments included in
`functions.bashrc`.

#### Set `DOMAIN` and `PORT` values from `bandit-instructions.txt`

Currently the `DOMAIN` and `PORT` are hard-coded in `functions.bashrc`. These should
instead be dynamically loaded from `bandit-instructions.txt`.

There are further hints included in `functions.bashrc` comments already.

##### Requirements

- `DOMAIN` and `PORT` variables use the values specified in `bandit-instructions.txt`
  instead of hard-coded values.

#### Implement the `grepcmd` function

Similar to the `greppwd` function, create a `grepcmd` function that returns the *command*
from `bandit-instructions.txt` that solves the given level.

Sample usage:

```bash
$ grepcmd "Level 0-1"
tac readme | sed '/./,$!d' | head -n 1 | cut -d ':' -f2 | tr -d '[:blank:]'

$ grepcmd
Error: no level argument provided. Usage: grepcmd "Level 0-1"

# if INSTRUCTIONS_FILE is not defined (e.g. when run outside of the `lab-2` directory)
$ grepcmd
Error: ./bandit-instructions.txt is not defined. Are you sure you are in the right directory?
```

##### Requirements

- Prints an error to `stderr` if the `INSTRUCTIONS_FILE` variable does not exist, or is
  not a file, and exits with error code 1
- Prints an error to `stderr` if no positional argument is provided and exits with error
  code 1
- Otherwise, gets the command for solving a specific level in the instructions file and
  prints it to `stdout`.

See the samples above. Your error messages do not have to match these suggestions exactly,
but your `stdout` MUST give the same command as what you have defined in
`bandit-instructions.txt`.

See the (#useful-course-notes) section for course notes that will be useful to solving
these requirements.

#### Implement the `banditsolve` function

Somewhat similar to the `banditstart` function, create a `banditsolve` function that
returns the result of *running the command* from `bandit-instructions.txt` that solves the
given level. You should reuse the `greppwd` and grepcmd\` functions to complete this
function.

Sample usage:

```bash
$ banditsolve "Level 0-1"

                         _                     _ _ _
                        | |__   __ _ _ __   __| (_) |_
                        | '_ \ / _` | '_ \ / _` | | __|
                        | |_) | (_| | | | | (_| | | |_
                        |_.__/ \__,_|_| |_|\__,_|_|\__|


                      This is an OverTheWire game server.
            More information on http://www.overthewire.org/wargames

bandit0@bandit.labs.overthewire.org password:
ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If

$ banditsolve
Error: no level argument provided. Usage: banditsolve "Level 0-1"

# if INSTRUCTIONS_FILE is not defined (e.g. when run outside of the `lab-2` directory)
$ banditsolve
Error: ./bandit-instructions.txt is not defined. Are you sure you are in the right directory?
```

##### Requirements

- Prints an error to `stderr` if the `INSTRUCTIONS_FILE` variable does not exist, or is
  not a file, and exits with error code 1
- Prints an error to `stderr` if no positional argument is provided and exits with error
  code 1
- Otherwise, solves the provided bandit level by running the command for that level using
  your `bandit-instructions.txt` file as a source of the command, and prints the resulting
  password to `stdout`.
  - Also, you must put the password you defined in `bandit-instructions.txt` into the
    clipboard to make logging into the server easier.

See the (#useful-course-notes) section for course notes that will be useful to solving
these requirements.

#### Improve `greppwd`

This task should be easy once you've completed `grepcmd`. We are simply going to apply the
same error-handling required for `grepcmd` in `greppwd`.

Sample usage after this improvement:

```bash
$ greppwd
Error: no level argument provided. Usage: grepcmd "Level 0-1"

# if INSTRUCTIONS_FILE is not defined (e.g. when run outside of the `lab-2` directory)
$ greppwd "Level 0-1"
Error: ./bandit-instructions.txt is not defined. Are you sure you are in the right directory?
```

##### Requirements

- Prints an error to `stderr` if the `INSTRUCTIONS_FILE` variable does not exist, or is
  not a file, and exits with error code 1
- Prints an error to `stderr` if no positional argument is provided and exits with error
  code 1

#### Improve `banditstart`

This task should be easy once you've completed `banditsolve`. We are simply going to apply
the same error-handling required for `banditsolve` in `banditstart`.

Sample usage after this improvement:

```bash
$ banditstart
Error: no level argument provided. Usage: grepcmd "Level 0-1"

# if INSTRUCTIONS_FILE is not defined (e.g. when run outside of the `lab-2` directory)
$ banditstart "Level 0-1"
Error: ./bandit-instructions.txt is not defined. Are you sure you are in the right directory?
```

##### Requirements

- Prints an error to `stderr` if the `INSTRUCTIONS_FILE` variable does not exist, or is
  not a file, and exits with error code 1
- Prints an error to `stderr` if no positional argument is provided and exits with error
  code 1

