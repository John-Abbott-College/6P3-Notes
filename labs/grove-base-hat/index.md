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
(ADC)](https://en.wikipedia.org/wiki/Analog-to-digital_converter) built in, and 4 ports we
can plug in to use it:



:::{figure} https://files.seeedstudio.com/wiki/Grove_Base_Hat_for_Raspberry_Pi/img/pin-out/5.jpg

The 4 Analog ports of the Grove Base Hat ADC are highlighted. These ports include different 8 channels (A0,
        A1, ... A6, A7) that we can read from.

:::

From the [Grove Base Hat documentation](https://wiki.seeedstudio.com/Grove_Base_Hat_for_Raspberry_Pi/):

> ... there is no ADC in the Raspberry Pi, so it can not work with analog sensors directly.
> The Grove Base Hat works as an external 12-bit ADC, which means you can use analog sensor with your Raspberry Pi.
>
> Devices connected to the Grove Base Hat analog ports sensor inputs the analog voltage into the 12-bit ADC. 
> After the ADC converts the analog data to digital data, it inputs the digital data to the Raspberry Pi through **the I2C interface.**

This process of converting an analog signal to a digital input using an n-bit interface is called [encoding](project:/lectures/signals/index.md#encoding-bit-resolution).

In order to use it on our devices, we need to enable the I2C Interface on our raspberry
pi.

#### Enable I2C Interface

Follow these instructions: <https://www.raspberrypi-spy.co.uk/2014/11/enabling-the-i2c-interface-on-the-raspberry-pi/>
 
 
Once complete, you should be able to run `i2cdetect` on I2C bus #1 (command shown below):
 
```text
$ i2cdetect -y 1
 
0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- UU -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- UU -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- UU -- -- -- -- -- -- --
40: -- -- -- -- -- UU -- -- -- -- -- -- -- -- -- --
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- --
```


### Lab virtual environment

- Make sure your **coursework** repository is up to date with upstream **instructions**
branch (sync fork)
- All of the work for this lab will take place in the **lab-4** directory.
- cd into the **lab-4** directory and
  [create a virtual environment](https://john-abbott-college.github.io/6P3-Notes/notes/python-package-management/#using-pip-with-virtual-environments)
  for this lab.
- Create a branch called **lab-4** for the work you do in this lab.
- activate the venv using source `.venv/bin/activate`
- install the dependencies in `requirements.txt` using `pip install -r requirements.txt`

## Joystick program

In this lab you will write and demo a program called `joystick.py`, using the libraries we
installed in `requirements.txt`

- use `grove.adc` to read the analog voltage <https://seeed-studio.github.io/grove.py/grove.adc.html>
- use `gpiozero` to read the SEL/SW "button" on the joystick: <https://gpiozero.readthedocs.io/en/stable/recipes.html>
 
Your `joystick.py` file should include the following boilerplate:
 
```python
from grove.adc import ADC
from gpiozero import Button
import subprocess
# Any constants/functions you define should go here

if __name__ == "__main__":
    # the code that uses your functions should go down here
```
 
### Requirements

- The joystick moves the mouse of the graphical desktop session in the x and y directions.
- The speed of the mouse depends on the voltage sent by the joystick.
    - There must be at least two speeds: slow and regular.
    - Eg.: the higher the banking angle of the joystick, the faster the mouse will move.
- A click of the joystick SEL/SW triggers a left-click of the mouse

NOTES:

- you will need to use the subprocess module to call the `ydotool` like we did in Lab 3 with the bash commands

TROUBLESHOOTING:

- if you're having "EDGE DETECTION" issues, try installing the following programs on your
reterminal:reTerminal


```
sudo apt install swig liblgpio-dev build-essential
sudo apt install python3-lgpio
```

And make sure the following program is included in your `requirements.txt`:

```
lgpio
```

(you will need to run `pip install -r requirements.txt` again)


