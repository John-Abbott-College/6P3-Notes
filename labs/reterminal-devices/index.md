---
title: "L3: Programming the ReTerminal"
subtitle:
  Learn how to control the devices built-in to the reTerminal chassis and the pi.
date: 2026-02-09
blogpost: true
location: Lab
author: 3%
language: 2026-02-13
---

## Overview

The reTerminal comes with a variety of built-in devices (the touchscreen, LEDs, a buzzer,
and more). In this lab we are going to practise interfacing with those devices using
`bash` and `python`.

### Objectives

- Control the built-in reTerminal devices:
  - turn on/off its LED
  - turn on/off its buzzer
  - control the backlight dim setting
- Read and write to `/sys/class` device files to manipulate reTerminal sensor and LED
  interfaces
- Script sensor and control manipulation in `bash` and `python`
- Install and manage 3rd-party python dependencies using `venv`
- Practise remote development workflow using VSCode, `ssh`, `scp`
- Prepare reTerminal for data collection and processing

## Part 0: Warm-up

Make sure you can connect to the reTerminal from your developer environment using `ssh`.
You can either use VSCode or a terminal environment (try both!). If you cannot do this,
ensure you have finished `lab-2`, particularly the `tailscale` setup.

Once you are connected to your reTerminal, read the
[course notes on reTerminal built-in devices](/lectures/reterminal-devices/index.md).

**Work through the examples provided in the course notes**. The lab instructions that follow assume you've done this.

Before completing this section, you should be able to:

- Turn on/off each of the LEDs using `bash`, both by editing the device file directly AND
  by using `cat` or a similar text-processing tool
- Turn on/off the touchscreen using `bash`. **Note:** you will need to find the device
  filename for the touch-screen yourself! Use `bash` tools like `ls` and `find`, and/or
  explore at the [reterminal documentation](https://wiki.seeedstudio.com/reTerminal/).
- Read the amount of light flux detected by the backlight sensor (Hint: use your cellphone
  flashlight to subject your reTerminal to more light).

## (1%) Part 1: Bash Scripting

When we get tired of entering commands interactively, or when we want to re-use those
commands at-will, we create scripts!

We will create a quick script to demonstrate the idea in this part of the lab -- the
command and the behavior is relatively simple, but we can add some protective
input-sanitation, and even better, we can re-use this script in the future.

### Setup

- SSH into your Raspberry Pi, either over VSCode or a terminal (or both).
- **Clone your `coursework` repo onto the reTerminal**
  - The location is up to you -- I like to make a directory called `~/repositories/` and
    clone all of my repositories in there.
  - NOTE: make sure you are NOT logged in as `root` or are in a root shell when you create
    the directory!
  - The unix owner of your lab and ALL files in it should be your username, NOT root.
  - Hint: use `ls -l` to check the owner of a file/folder. See the course notes for
    [permissions](/lectures/bash-scripting/index.md#permissions).
- **Create a branch called `lab-3` in your coursework repository** to do all of your work for this lab.
- Create a directory `bash` in the `lab-3` directory of this repository
- Create a file using VSCode / your favourite editor called `backlight` (no file
  extension). Make sure that file is located in your `lab-3/bash` directory

### Requirements

In this part of the lab, we create a script that controls the backlight (screen dimness) of your reTerminal.

- Your script should take one [positional argument](/lectures/bash-scripting/index.md#positional-parameters) that is an integer between 0-255
- Your script should be able to be run directly from the terminal without a bash
  interpreter
- (i.e. `$ ./lab-3/bash/backlight 255` should just work)
- Your script should fail gracefully if bad input is provided (non integer/missing
  parameter/too big/too small)
- Your script should work without needing to call sudo nor be a root user. You will need
  to use sudo inside your script. The best way to do this is using the `sudo + tee`
  pattern. Revisit the previous part of this lab (Part 0: Warm-up) if you don’t know what this means -- get that to work
  interactively before writing the script.

For example:

```bash
$ backlight -1
# <does nothing or failure message>

$ backlight 256
# <does nothing or failure message>

$ backlight
# <does nothing or failure message>

$ backlight giraffe
# <does nothing or failure message>

$ backlight 255
# <sets backlight to full brightness -- no sudo necessary>

$ backlight 0
# <sets backlight to 0 brightness -- no sudo necessary>
```

Commands/bash concepts that will be useful:

- [Bash shebangs](/lectures/bash-scripting/index.md#shebangs)
- Compare integers, combine [conditional statements with AND/OR in Bash](/lectures/bash-scripting/index.md#conditionals)
- Use [positional arguments](/lectures/bash-scripting/index.md#positional-parameters) in bash scripts
- Make file executable with [`chmod`](/lectures/bash-scripting/index.md#permissions)

The course notes on
<project:/lectures/bash-scripting/index.md> explain all of the above concepts.

## (1%) Part 2: Wrap Bash in Python

Sometimes it is useful to call bash scripts from a more sophisticated programming
language. This can be a tedious/janky process in some languages. Python was written to
interact with shell scripts very naturally, as we will see in this section.

### Setup

- SSH into your Raspberry Pi, either over VSCode or a terminal (or both).
- Create a `lab-3/python/` directory
- Create a file using VSCode / your favourite editor called `lab-3/python/backlight.py`
  (with file extension).
- Read this
  [article on using the python `subprocess` module to run bash scripts](https://realpython.com/python-subprocess/#introduction-to-the-shell-and-text-based-programs-with-subprocess)
- Read this
  [article on using the python `argparse` module for adding CLI arguments to your Python script](https://realpython.com/command-line-interfaces-python-argparse/#creating-a-cli-with-argparse)

Here we will re-use the script you created in Part 2 to see how Python interacts with bash
scripts.

### Requirements

- Your script should take one positional argument that is a string.
  - There are three valid strings: `ON`, `OFF`, `DIM`
- Your script should be able to be run directly from the terminal without a bash
  interpreter
  - (i.e. `$ lab-3/python/backlight.py ON` should just work)
- **Your script must use the backlight script you wrote in Part 2 inside of a Python
  subprocess** -- the goal is to **re-use** the script you wrote that works already, NOT to
  re-write it.
  - NOTE: use a path *relative* to the python directory (e.g. `../bash/backlight`) to specify the location of the bash file.

For example:

```bash
$ backlight.py
# <does nothing or failure message>

$ backlight.py 255
# <does nothing or failure message -- the API is different than the Part 2 script>

$ backlight.py ON
# <sets backlight to full brightness>

$ backlight.py OFF
# <sets backlight to 0 brightness>

$ backlight.py DIM
# <sets backlight to 1 brightness>
```

Commands/python concepts that will be useful:

- [Python shebang](/lectures/bash-scripting/index.md#shebangs)
- Python
  [`subprocess`](https://realpython.com/python-subprocess/#introduction-to-the-shell-and-text-based-programs-with-subprocess)
  for calling bash from a python script
- Positional parameters in Python using
  [`argparse`](https://realpython.com/command-line-interfaces-python-argparse/#creating-a-cli-with-argparse)
- Make file executable with [`chmod`](/lectures/bash-scripting/index.md#permissions)

(reterminal-devices-lab-part-3)=
## (1%) Part 3: Python scripting with libraries and venv

In the previous part we saw how we can efficiently re-use working bash scripts in Python,
and even change the interface of those scripts in an elegant and safe manner (i.e. replace
`255` with `ON`, `0` with `OFF`, etc.)

Calling bash scripts from Python also allows us to use Python language features (like OOP,
functional programming, etc.) that aren’t in Bash. In addition, this allows us to easily
use 3rd-party python libraries to perform more complicated behavior than we could ever
write in bash.

In this part, we will control the reTerminal LEDs using the `seeed-python-rpi`
library written by the reTerminal team. These libraries are basically more-robust versions
of what we wrote in Part 3 -- you can see how they are implemented if you click the
[view the source code](https://github.com/Seeed-Studio/Seeed_Python_RPi) and navigate to the source folder.

### Setup

- SSH into your Raspberry Pi, either over VSCode or a terminal (or both).
- **Setup a `venv`** in the `lab-3/python/` directory.
  - See the
    [course notes on python environments](/lectures/python-package-management/index.md)
    for more information.
- **Activate the your python `venv`**.
- Install the packages `seeed-python-reterminal` and `RPi-GPIO` using pip.
  - This will install these dependencies in your venv.
  - See the
    [course notes on the Python library for reTerminal](/lectures/reterminal-devices/index.md#python-library-for-reterminal)
- Create a file using VSCode / your favourite editor called `lab-3/python/leds.py`

:::{note}
Make sure you do not commit your `.venv` folder to your lab repo! Use `.gitignore`.
:::

### Requirements

Write a short python script that, while running, repeatedly turns on your LEDS in the
following sequence:

- STA: Red Wait one second, turn off
- STA: Green Wait one second, turn off
- USR: Green Wait one second, turn off
- Repeat

Your script should use the `seeed-python-rpi` API:

```
import seeed_python_rpi.core as rt
import time

print("STA OFF, USR OFF")
rt.sta_led = True
rt.usr_led = False
time.sleep(1)

rt.sta_led = False
rt.usr_led = False
```

You can see more
examples at the [project github](https://github.com/Seeed-Studio/Seeed_Python_RPi) if
you’re not sure how to use the library.

### Hints

In order to edit the LED files, your script will need to run with root permissions.
However, your venv was setup with user permissions. If you run `python leds.py` your
permissions will be insufficient, but if you run `sudo python leds.py` your venv will not
be used. What to do?

Read the
[course notes (Pip python packaging: run app with root permission)](/lectures/python-package-management/index.md#using-packages-that-require-root-permissions)
about this problem. There are a few different ways to make sure you run the venv install
of python with sudo, but it’s not obvious at first. You may find the command which and
bash process substitution useful, or you may find knowing the actual path of the venv
install of python useful.

## Deliverables

You should have the following scripts on your `lab-3` branch:

- Part 1) `lab-3/bash/backlight`
- Part 2) `lab-3/python/backlight.py`
- Part 3) `lab-3/python/leds.py`
