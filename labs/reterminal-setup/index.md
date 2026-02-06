---
title: "L2: Reterminal setup"
description: |
  Guide to setting up reterminal for the first time.
date: 2026-02-01
blogpost: true
location: Lab
author: 1%
language: 2026-02-09
---

## Overview

This lab documents the general steps needed to perform an initial set up, or reset, of
the [reTerminal](https://wiki.seeedstudio.com/reTerminal/#for-linux) device that we will be using throughout the class.

The general steps are:

1. Install necessary dependencies for reimaging a Pi on a host computer
1. Reimage and configure the reTerminal’s operating system.
1. Connect to the reTerminal remotely and ensure the remote connection services are
    working.

To complete this lab, complete **all of the steps below**. Make sure you read **every instruction carefully**.

At the end of the lab, there are two other deliverables:

- reTerminal kit sign out sheet (given in class)
- [Moodle reTerminal metadata][moodle_lab_2]

## Prerequisites

You can perform this lab on any computer that you are able to run applications with "elevated permissions".

- on the Lab computers, you will need to use the "run with elevated permissions" mode at a
    few steps. This will be explained in class.
- on a personal Windows machine, you can follow all of these instructions normally, using
    "admin" mode when prompted for elevated permissions.
- if you are using a personal macOS or Linux machine, I have not written the instructions
    with you in mind -- you can do this lab, but make sure to adjust the instructions to
    your OS accordingly

### Hardware required

You need to prepare the following hardware before getting started with
reTerminal:

- Ethernet cable or Wi-Fi connection
- USB Type-C cable
- Micro HDMI to HDMI converter
- reTerminal kit case, containing
    - small screw driver (black handle)
    - reTerminal power adapter

### Software required

There are two tools required for this lab:

1. Raspberry Pi (RPi) USB Device Boot daemon
1. Raspberry Pi Imager

**These programs are already installed on the Lab computers**. In case you need to perform these steps at home, [see instructions in the Appendix section below](#appendix)

## Verify the equipment in your reTerminal kit

See the [reTerminal Kit](/lectures/reterminal-kit/index.md) lecture notes, and the ReTerminal Kit signout form given in class.

Make sure that all of the pieces on the sign-out form are in your kit. Refer to the [reTerminal Kit](/lectures/reterminal-kit/index.md) lecture notes.


## Reimage the reTerminal

Below is a brief overview of the **three step process** for reimaging the reTerminal:

1. Disassemble the back cover and flip the eMMC switch to enable *flash* mode.
1. Re-image and configure the OS using the Raspberry Pi Imager software.
1. Return the memory selector switch to the original position and reassemble.

### reTerminal Disassembly

1. Watch the video below to understand the disassembly process (2 mins).

    :::{youtube} hAfdb603emw
    :align: center

    ![](https://www.youtube.com/watch?v=hAfdb603emw)

    :::

    :::{important}

    The goal is to remove the heatsink in order to access the memory switch. **Do *not***
    fully disassemble the reTerminal like they do in the video -- **stop** once you have
    removed the heatsink.

    :::


1. Follow **Steps 1, 2, & 3** in the
    [reTerminal documentation](https://wiki.seeedstudio.com/reTerminal/#flash-raspberry-pi-os-64-bit-ubuntu-os-or-other-os-to-emmc) to remove the heatsink.
    Use the following hardware from your reTerminal kit:

      - small screw driver (black handle)
      - kit case (store the plastic nubs and removed screws in your case. Don’t lose the screws!)

:::{figure-md}

![](https://files.seeedstudio.com/wiki/ReTerminal/wiki1/boot-switch-2.jpg)

Memory select switch behind the reTerminal’s heatsink in the "down" position.

:::

After the following the above steps, you will have:

- removed the heatsink
- toggled the eMMc memory switch

Your reTerminal is now ready for a firmware flash.


### New OS image & Configuration

To re-image the reTerminal, follow the steps below on the **lab computer**.

#### Launch `rpiboot`

There is a program called `rpiboot` used to mount the reTerminal for OS flashing.

Launch the `C:\Program Files (x86)\Raspberry Pi\rpiboot`[^rpiboot-executable] executable file with [elevated permissions](#elevated-permissions)

::: {admonition} Elevated Permissions
:class: important
:name: elevated-permissions

We will sometimes need **elevated permissions** in order to install or operate software.

- On the Lab Computers, you can achieve elevated permissions by **right-clicking on the
    executable** and selecting the option: **"Run with elevated access"**.
    - You will be asked for your college username and password.
        - **Click on the password field to get focus**
            (the program doesn't focus on the password by default, which is very annoying)
    - You will then be asked for a reason for elevating permissions. Copy-paste: "420-6P3 Raspberry Pi Setup"
- On your personal computers, the options will depend on your OS:
    - Windows: The same as the Lab Computers, but use "Run as administrator" instead.
    - macOS/Linux: use your terminal environment to run the executable and `sudo` to elevate
        your permissions

:::


[^rpiboot-executable]: if running on macOS/Linux: this will be `rpiboot.sh` in the directory where the program was installed.

After launching, you should see a terminal window with something like the following dialog appear:

```bash
RPIBOOT: build-date Jan 22 2023 version 20221215-105525 864863bc
Waiting for BCM2835/6/7/2711...
```

The `rpiboot` program creates a **daemon** (a dedicated background process) that will
detect when a reTerminal device is connected in *flash mode*.


#### Connect the reTerminal to the USB port of your machine.

- Find a USB-C to USB 3.0 Cable and plug it into a 3.0 port on your computer.
    - USB-C to USB-C is also fine.
- Plug the other end of the cable into your reTerminal
    - NOTE: if the screen of the reTerminal turns on when you plug in the USB cable,
        [you have missed a step in the disassembly process](#reimage-the-reterminal). In
        this case, stop, unplug the device, and read the previous instructions more
        carefully.
- `rpiboot` will detect and attach the reTerminal’s internal memory as a storage device.
- At this stage, you should see some dialog appear in the `rpiboot` program:

```bash
Sending bootcode4.bin…
Received 4 bytes
somethingsomethingsomething
Etc. etc.
Loading startup.elf file
Warning: file not interpreted as such-and-such
Finished
```

Your output will not exactly match the example I have provided. Here are some guidelines:

- The program may close on its own, or may not. Either way is fine.
- You can ignore the “warnings” that appear at the end of the logs.
- You can ignore the "There is a problem with this drive" Windows notification.
- The program should NOT repeatedly loop at `Sending bootcode4.bin...`
    - if this is the case, and no other messages appear, try the previous steps again,
        make sure you pay attention to details.

Basically, unless the program is stuck in a loop, you should continue to the next step.

IF the program is stuck in a loop, try the following:

1. Find the location of the Windows Powershell Executable
    - Windows key button -> Powershell -> Open File Location
1. Run that with elevated access
1. In that powershell, run the following commands:

    ```powershell
    PS > cd C:\Users\<your-student-number>
    PS > git clone https://github.com/raspberrypi/usbboot
    PS > cd usbboot
    PS > cd win32
    PS > .\rpiboot_setup.exe
    ```
1. Follow the instructions to reinstall rpiboot
1. Once that is done, you can try the previous steps again and they should work.

:::{note}

IF, after trying all of the above instructions again, you are stuck with the `Sending bootcode4.bin...` loop, you have the following options:

- Try another lab computer -- about 50% of them seem to have issues with this step.
- Install `Raspberry Pi Imager` and `rpiboot` on your personal computer. See the <project:/labs/reterminal-setup/index.md#appendix> for instructions.

:::

#### Run Rasperry Pi (RPi) Imager

- Run the program on your desktop with [elevated permissions](#elevated-permissions)
- Before making any selections, press `Control+Shift+X` to open the "OS Customizations" Advanced Options menu.
- Make the following customizations (you will need to click through all 3 tabs at the top).
    - Set a unique username and password.
        - **Do not use the defaults or forget these**. *You will need to reimage your reTerminal if you do.*
    - Set a hostname (suggestion: `RE-XX`, matching the code on your reTerminal kit.)
    - Enable SSH with password authentication.
    - Try configure the wireless LAN to connect to the JAC wifi network:
        - SSID: `jac-BYOD` (double check the spelling of this)
        - Password: (your JAC password)
        - Wireless LAN country: `CA`
    - Set locale settings: `America/Montreal`
    - Disable telemetry.
    - Enable “eject media” and “play sound when finished”.
    - Take note of your hostname, username, and password on the [Lab 2 assignment on Moodle](https://moodle.johnabbott.qc.ca/mod/assign/view.php?id=68921)
        - You will be responsible for maintaining your system.
        - *If you get locked out, you may have to re-image the system.*
    - **Press "SAVE" when finished.**
- Once you've finished making the above customizations, there are three main
    configuration choices to make:
    - Raspberry Pi Device: **Raspberry Pi 4**
    - Operating System: **Raspberry Pi OS 64-bit (Recommended)**
    - Storage: **RPi-MSD-0001 (31.3GB). DO NOT SELECT ANY OTHER STORAGE DEVICE**.
        - If this storage device does not appear, you need to re-do the [`rpiboot` steps](#launch-rpiboot)
- Once Raspberry Pi Images starts, writing the image to the reTerminal’s memory can take **10-15 minutes**.
    - **Do not disconnect the reTerminal during flashing!**

### Reassembly

1. Once the writing and verification process is completed, disconnect the USB-C cable from
    the reTerminal.
1. **Return the memory select switch to the original position.** (Do you know why? If not,
    Reread the part about why we toggled it down in the first place!)
1. **Don’t re-assemble the heatsink+terminal cover yet** -- we have a few more steps to
    take first.
1. Plug the raspberry pi into the wall using the Pi Power Supply cable in your reTerminal
    kit. You may need an extension cord/power bar-- you can find one at the front of the
    class.

## First Boot

Your reTerminal has been re-imaged! **Make sure you have completed the
[reassembly](#reassembly)** steps, particularly that you have toggled the memory select
switch back up to normal boot mode.

At this point, we are now going to start running commands directly on the reTerminal itself. Follow the steps below:

- Plug your reTerminal into the wall using the power supply. There are power bars in the lab that you can use if you need more outlets.
    - In general, the reTerminal is powered using the provided power supply in your lab kit.
- Plug your reTerminal into the lab monitor using the provided **microHDMI to HDMI converter**
- Plug your reTerminal into the ethernet using the lab computer ethernet.
- Plug the lab keyboard and mouse into your reterminal USB.

On first boot, your reTerminal screen will not turn on -- this is why we need the microHDMI connection to the external monitor. 

The first task we need to take care of is fixing the reTerminal screen display drivers.

### Display driver fix

Once your are logged into the reTerminal and you can see the display on the lab monitor, follow the steps below:

1. Read and follow the steps outlined here:
    ["Install reTerminal drivers after flashing new Raspberry Pi OS/ Ubuntu OS or Other OS"](https://wiki.seeedstudio.com/reterminal_black_screen/#install-reterminal-drivers-after-flashing-new-raspberry-pi-os-ubuntu-os-or-other-os),
    up to and including `sudo reboot`.
    - NOTE: recall that you have installed a **64-bit** OS on your reTerminal. **DO NOT** follow any 32-bit OS steps in the above instructions.
1. If the above steps have been completed successfully, your device should reboot and
    BOTH the raspberry pi screen AND the HDMI connection should work (this takes several seconds, give it a minute before you
    panic).
    - Make sure your Pi is connected to the wall power supply, NOT to your computer (the
        pi screen needs more power than your lab computer can provide).

:::{note}
If your keyboard is in French mode on the raspberry pi, you can
[follow the instructions here](https://thelinuxcode.com/change-keyboard-layout-raspberry-pi/)
to set it back into English (US) mode.
:::

### Update & Upgrade

A good first step for any OS installation is to ensure all system packages
are at the latest version.

Raspberry PI OS is also based on Debian, like our WSL developer environments.
That means we can use the `apt` package manager:

```bash
$ sudo apt update
$ sudo apt upgrade
```

## Set up Remote connections

Going forward, we want to be able to use the reTerminal without having to plug it into an external monitor.

Fixing the device screen was one step -- however, we would also like to be able to use the reTerminal without relying on the small touchscreen either.

We are going to rely on **remote connections** to the reTerminal in general in this class -- that is, connecting to the reTerminal using an IP Address.

Because the lab network has firewalls, however, we cannot do so directly using the lab ethernet or the campus WIFI.

To fix this problem, we are going to use a remote networking tool called [Tailscale](https://tailscale.com/). Follow the steps below:

### Set up Tailscale

First, create an account on [Tailscale](https://login.tailscale.com/start). You have the
following choices for authentication:

- (Recommended) Your GitHub account
- Your school email address

If you're curious to know more about Tailscale before you sign up, please ask me! You can
also read about it here:

- <https://tailscale.com/why-tailscale>
- <https://tailscale.com/blog/how-tailscale-works>

In the big picture: Tailscale will allow us to establish direct remote connections between
our raspberry Pi and our developer environments by creating a
[Wireguard](https://en.wikipedia.org/wiki/WireGuard)
[VPN](https://en.wikipedia.org/wiki/Virtual_private_network)
[mesh network](https://en.wikipedia.org/wiki/Mesh_networking) for us.

To be clear, Tailscale is *free*, you will not need any of the paid features.

After you have made an account, you will need to set it up on your pi and your developer environments, see instructions below.

#### On the raspberry pi

[Follow these instructions](https://tailscale.com/download/linux/rpi-bullseye)

You can do the "Install with one command" step, OR follow the manual steps if you prefer.

NOTE: you will probably need to also run the following command on your raspberry pi:

`sudo apt install curl`

#### On the lab/your personal computer

Depending on the operating system:

- Windows:
    - Install on your WSL by [Following these instructions](https://tailscale.com/kb/1295/install-windows-wsl2)
    - You can do the "Install with one command" step, OR follow the manual steps if you prefer.
- macOS: [Follow these instructions](https://tailscale.com/kb/1016/install-mac)
- Linux: [Follow these instructions](https://tailscale.com/kb/1031/install-linux)

#### Verify your tailscale setup

On either your lab/personal developer environment, OR your raspberry pi, run the command: `tailscale status`

You should see the IP address for both your reTerminal AND your lab/personal developer environment.
Take note of these IP addresses before moving on to the next steps.

### Set up SSH

The SSH server inside your Raspberry Pi should already be enabled by default.

:::{important}
If you are having issues connecting by SSH, double check that the ssh server is enabled on your pi: follow the official instructions on
[Setting up the SSH Server on the Raspberry Pi](https://www.raspberrypi.com/documentation/computers/remote-access.html#ssh).
:::

#### Connecting over CLI

You can establish an SSH connection to the reTerminal from your developer environment. If
your connection is successful you should see a prompt like so:

`user-name@hostname:~ $`

where `hostname` and `user-name` correspond to the choices you made during your imaging of the pi.

> Follow the official Raspberry Pi instructions (NOTE: Linux instructions apply to WSL!)
> [**Secure Shell from Linux or Mac OS**](https://www.raspberrypi.com/documentation/computers/remote-access.html#secure-shell-from-linux-or-mac-os)

#### Document device metadata

See [Lab 2][moodle_lab_2], I ask you to obtain the reTerminal’s MAC address.

You can do so running `ifconfig` command in an ssh session, and checking the properties of the wireless network card (`wlan0`):

- Run the command `ifconfig` or the command `ip address`
- Look for the wireless network adapter `wlan0:`
- The MAC address will be listed there.I
    - Style points: use grep and pipe to grab the MAC address directly to your clipboard

#### Connecting over VSCode

You can use VS Code in your lab workstation to create a development environment inside the Raspberry Pi which will be controlled from the lab workstation.

1. In your **developer environment**, install the following VS Code
    extensions [**Remote - SSH**](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh),
        by Microsoft.
1. Connect your lab workstation to your Raspberry Pi by following these instructions from stack overflow: [Connecting to SSH from WSL in VSCode](https://stackoverflow.com/a/79634708)
1. You should now be able to enter an ssh session on VSCode by using `Ctrl-Shift-P` --> `Remote-SSH: Connect to Host...`

## Appendix


### RPi USB Device Boot installation

The instructions for installing and using this software vary greatly depending on your host operating system.

You can find all instructions in the README of the repository for the software: [https://github.com/raspberrypi/usbboot/](https://github.com/raspberrypi/usbboot/).

I've adapted those instructions for each possible operating system in the section below.


:::: {tab-set}

::: {tab-item} Windows

- Download the [repository source code](https://github.com/raspberrypi/usbboot/) using `git clone`.
    - Use your developer environment, i.e. your WSL instance, to do this (not git bash)
- (important) Move the cloned `usbboot` folder to your home directory in the `C:\` drive
    - Pro tip: do this in the terminal using the `mv` command, e.g. `mv /path/to/usbboot /mnt/c/Users/Michael.Haaf/Downloads`
- in **Windows Explorer**, locate `rpiboot_setup.exe` within the `usbboot/win32/` directory.
- Run the executable with elevated permissions (see [@nte-elevated])
    - If the software has already been installed, **press Yes to overwrite the existing installation**
    - By doing so, we will ensure that the software is the latest version (which will be important).
- Raspberry pi drivers will begin to be installed on your computer.
    - This process takes a few minutes. Keep the window open and move on to the next steps in the lab.
- When this process is finished, you should now have the folder `C:\Program Files (x86)\Raspberry Pi\` on your computer.

:::

::: {tab-item} macOS/Linux

  - (On macOS / Linux): read the README of the repository and follow those instructions
      instead.

:::


::: {tab-item} WSL

Not recommended at this time.

:::

::::

### Raspberry Pi Imager installation

- Follow software from the
    [official Raspberry Pi website.](https://www.raspberrypi.com/software/). This software
    is straightforward to install.
- NOTE: this *should* already be installed on the Lab computers. Check to see if Raspberry
    Pi Imager is an application you can open before installing.

<!-- TODO: fix link -->
[moodle_lab_2]: https://moodle.johnabbott.qc.ca/mod/assign/view.php?id=68921
