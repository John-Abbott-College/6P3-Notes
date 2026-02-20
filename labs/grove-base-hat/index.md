---
title: 'L4: External GPIO devices using the Grove Base Hat'
subtitle: Learn how to read external digital and analog sensors using the Grove Base Hat.
date: 2026-02-17
blogpost: true
location: Lab
author: 3%
language: 2026-02-23
---

:::{important}

These notes are currently an incomplete draft. The full instructions are still on Teams.

:::

## Overview

Last lab, we used system drivers installed on the reTerminal to control the chassis
buttons, LED, touchscreen, etc.

In this lab, we will connect our first external device: an analog joystick that comes with
a digital button-pressing mechanism.

We will use this joystick to control the mouse on our reTerminal -- we will find that it
works quite well to simulate motion and clicking!

### Objectives

- To differentiate between digital and analog signals
- To read simple digital signals using the Python ***GPIO Zero*** library.
- To use an analog to digital converter (ADC) using the ***seeed-grove*** library.
- To calibrate an electronic device (a joystick) that uses digital and analog signals

## Part 0: Setup

There are a few programs we need to install and practise using before we are ready to
program the joystick.

### reTerminal system dependencies

In order to control the mouse movement and clicks, we will install a program called
`ydotool` ("y do tool") on the reTerminal. This will let us control the mouse/keyboard
programmatically.

`ydotool` is not included in the debian package repository by default, so we will compile
it ourselves:

```bash
# Ensure your apt repos are up to date
sudo apt update
# Prerequisite dependencies to install
sudo apt install git cmake scdoc pkg-config
git clone https://github.com/ReimuNotMoe/ydotool.git
cd ydotool
mkdir build
cd build
cmake ..
time make -j "$(nproc)"
sudo make install
```

Add the following line to your `~/.bashrc` file on your reTerminal:

```bash
export YDOTOOL_SOCKET=/tmp/.ydotool_socket
make sure you source your ~/.bashrc for the change to take effect.
```

Then, you will need the `ydotoold` program running as a background process for `ydotool`
to work:

```
sudo ydotoold & disown
# press enter a couple times
# keep this terminal window open
```

:::\{important}

The `ydotoold` program MUST be running in the background for `ydotool` to work.

:::

Optionally, you can change the permissions of the `/tmp/.ydotool_socket` file so we can
use `ydotool` without `sudo`. For now we can simply change the permissions to 777 using
chmod: `sudo chmod 777 /tmp/.ydotool_socket`

Now we can try using `ydotool`:

- Try following the ydotool examples about moving the mouse:
  <https://github.com/ReimuNotMoe/ydotool?tab=readme-ov-file#examples>
- Try doing relative moves
- Try doing absolute moves (what's the difference between relative and absolute in this
  context?)
- Try clicking
- What are the boundaries for moving the mouse? (min/max x/y)
- What happens when you move the mouse outside the boundary?

Now that we have mouse movements working, we are ready to set up the Joystick interface.

### Grove Base Hat analog interface setup

A joystick's motion in the X and Y directions is an example of an
[analog signal](project:/lectures/signals/index.md): there are infinitely many different
positions that the Joystick could be. How are these positions converted to **digital**
values that can be understood by the reTerminal, and used for mouse movement?

The Grove Base Hat has an 
[Analog to Digital Converter
(ADC)](https://en.wikipedia.org/wiki/Analog-to-digital_converter) built in. How does it
work?

The following information is adapted from the [Grove Base Hat documentation](https://wiki.seeedstudio.com/Grove_Base_Hat_for_Raspberry_Pi/):


:::{figure} https://files.seeedstudio.com/wiki/Grove_Base_Hat_for_Raspberry_Pi/img/pin-out/5.jpg

The 4 Analog ports of the Grove Base Hat ADC are highlighted. These ports include different 8 channels (A0,
        A1, ... A6, A7) that we can read from.

:::



### Lab virtual environment

- Make sure your **coursework** repository is up to date with upstream
- All of the work for this lab will take place in the **lab-4** directory.
- cd into the **lab-4** directory and
  [create a virtual environment](https://john-abbott-college.github.io/6P3-Notes/notes/python-package-management/#using-pip-with-virtual-environments)
  for this lab.
- Create a branch called **lab-4** for the work you do in this lab.
