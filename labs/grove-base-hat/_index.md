---
title: "L4: External GPIO devices"
subtitle:
  Learn how to read external digital and analog sensors using the Grove Base Hat.
date: 2026-02-17
blogpost: true
location: Lab
author: 3%
language: 2026-02-23
---

## Overview<a name="overview"></a>

Last lab, we used system drivers installed on the reTerminal to control the chassis buttons, LED, touchscreen, etc.

In this lab, we will connect our first external device: an analog joystick that comes with a digital button-pressing mechanism. 

The Grove Base Hat is the main interface we will use connecting external devices to the reTerminal in this course.
In this lab we will learn to calibrate an analog joystick that comes with a digital button-pressing mechanism.

### Objectives<a name="objectives"></a>

* To differentiate between digital and analog signals
* To read simple digital signals using the Python ***GPIO Zero*** library.
* To use an analog to digital converter (ADC) using the ***seeed-grove*** library.
* To calibrate an electronic device (a joystick) that uses digital and analog signals


## Part 0: Getting started 

- Make sure your **coursework** repository is up to date with upstream  
- All of the work for this lab will take place in the **lab-4** directory.  
- cd into the **lab-4** directory and [create a virtual environment](https://john-abbott-college.github.io/6P3-Notes/notes/python-package-management/#using-pip-with-virtual-environments) for this lab.  
- Create a branch called **lab-4** for the work you do in this lab.

## Context: GPIO’s & Grove Base Hat 

The reTerminal exposes all 40 pins of the Raspberry Pi (figure 1 below). Most of these pins are **General Purpose Input Output (GPIO)** pins, meaning that they can receive and generate digital signals in the form of high and low voltages.

## Grove Base Hat 

The reTerminal’s GPIOs pins (*Figure 1*) can be connected to the Grove connectors using the **Grove Base Hat** (*Figure 2*).

For details on the **Grove Base Hat** see the [official wiki here](https://wiki.seeedstudio.com/Grove_Base_Hat_for_Raspberry_Pi/).

![][image1]  
***Figure 1**: 40 pins of the reTerminal*

![][image2]  
***Figure 2**: Grove Base Hat*

### Connecting Grove Base Hat to reTerminal {#connecting-grove-base-hat-to-reterminal}

In order to connect the Base Hat to the reTerminal, align their respective pins \#1. See details below.

1. Identify pin \#1 of the reTerminal (top-left pin labeled 1 in *Figure 1,* ).  
   1. Note that pin \#1 refers to the physical pin number, not GPIO1.  
        
2. Identify pin \#1 of the Base Hat (*Figure 3*).

***Figure 3**: Pin \#1 of the Grove Base Hat*

3. Connect pins \#1 of the reTerminal to the Base Hat (*Figure 4*).  
   1. Use the flexible ribbon cable provided with your hardware kit.  
   2. **Tip:** use the red line of the flexible cable for pin \#1.

![][image3]  
***Figure 4:** connecting pin \#1 of reTerminal and Base Hat with ribbon cable. The red line should be on the “green button” side of the reTerminal, and on pin \#1 of your base hat.*

| ⚠️ | IMPORTANT: If your ribbon cable is already connected to the Base Hat as shown above, do not disconnect it\! The pins of the Base Hat bend very easily so keep your ribbon cable always connected | ⚠️ |
| :---- | :---- | :---- |

### Base Hat Numbering System {#base-hat-numbering-system}

The pin numbering system in the Base Hat follows the BCM (Broadcom) GPIO numbering system.

For example:

- Pin 5 of socket D5 connects to GPIO 5 of the Raspberry Pi (*see Image below*).  
- Pin 17 of socket D16 connects to GPIO 17 of the Pi.




# **Part 1: (0.5%) Digital Inputs w/ GPIO Zero** {#part-1:-(0.5%)-digital-inputs-w/-gpio-zero}

There are a few python libraries that facilitate the use of the GPIO pins. Some of the most popular are:

* [***GPIO Zero***](https://gpiozero.readthedocs.io/en/stable/) (officially [endorsed](https://www.raspberrypi.com/documentation/computers/os.html#use-gpio-from-python) and used for most of this course.).  
* [*Pigpio*](https://abyz.me.uk/rpi/pigpio/)  
* [*Rpi.GPIO*](https://pypi.org/project/RPi.GPIO/)

***GPIO Zero*** provides classes for most common Input and Output (I/O) devices.

Below are the diagrams for the class hierarchies. (**abstract classes** are shaded **lighter**)

## Input Classes {#input-classes}

![][image4]  
***Figure 5**: Class inheritance for **input devices** of GPIO Zero library*

## Output Classes {#output-classes}

![][image5]  
***Figure 6**: Class inheritance for **output devices** of GPIO Zero library*

For example, consider a button connected to GPIO 22 that can generate a high or low signal, depending on whether or not it is pressed.

![][image6]

There are **multiple ways** to read the button signal. Below are some options:

**Option 1:** Instantiate a generic digital input pin as an ***InputDevice*** **object** and read its ***is\_active*** **property**:

| import gpiozeroimport timebutton \= gpiozero.InputDevice(22, *pull\_up=True*)while True:   if button.is\_active:       print("ON")   else:       print("OFF")   time.sleep(0.1) |
| :---- |

Note that the pin number in the code must match the GPIO \#.

For example, button \= gpiozero.InputDevice(22) is referring to GPIO 22 which is exposed via the Base Hat socket D22 (see image above).

However, the more specialized ***Device*** classes are recommended whenever possible since they offer additional features.

**Option 2:** Use the [***Button*** class](https://gpiozero.readthedocs.io/en/stable/api_input.html#button), which offers optional *bounce\_time* (see [switch debouncing](https://www.geeksforgeeks.org/switch-debounce-in-digital-circuits/)*), hold\_time, wait\_for\_press()*, and many other features.

| from gpiozero import Buttonimport timebutton \= Button(22)while True:   if button.is\_pressed:       print("Button is pressed")   else:       print("Button is not pressed")   time.sleep(0.1) |
| :---- |

## Part 1 Tasks {#part-1-tasks}

1. Create a virtual environment and activate it  
2. Use pip to install this package:  
   1. pip install gpiozero

   

3. Familiarize yourself with:  
   1. Section [***Basic Recipes***](https://gpiozero.readthedocs.io/en/stable/recipes.html#basic-recipes) of the ***GPIO Zero*** docs \-- plenty of code examples for interfacing with the buttons/LEDs/etc.  
   2. API for [Input Devices](https://gpiozero.readthedocs.io/en/stable/api_input.html).

   

4. Connect the button to the Grove Base Hat using a breadboard (*Figure 7*).  
   1. Connect a GPIO pin of the Base Hat to one of the button legs.  
   2. Connect a **GND** (electrical ground) pin of the Base Hat to the other button leg.

![][image7]  
***Figure 7**: Button connection to the Base Hat*

5. Create a python script named ***button.py*** that prints “ON” to the terminal when the button is held for more than 1 second, otherwise it prints “OFF” using the library ***GPIO Zero,*** 

## Part 1 Tips/Troubleshooting {#part-1-tips/troubleshooting}

If you are having trouble getting this lab to work, start with the following steps:

- **Double check your connections** \-- this is the most common source of electronics bugs. Have you followed the wiring from the example above? Are the pins of the buttons on the same breadboard row as your power / gnd cables?  
- Read the [course notes about Electronics](http://john-abbott-college.github.io/6P3-Notes/topics/hardware/docs/circuitry-basics.html#ohms-law) to get a better sense of how breadboards actually work.  
- Try some of the [***Basic Recipes***](https://gpiozero.readthedocs.io/en/stable/recipes.html#basic-recipes) of the ***GPIO Zero*** docs \-- plenty of code examples for interfacing with the buttons/LEDs/etc.  
- Read through the API for [Input Devices](https://gpiozero.readthedocs.io/en/stable/api_input.html)

# **Part 2: ADC & Grove Library (1.5%)** {#part-2:-adc-&-grove-library-(1.5%)}

The Raspberry Pi does not have a built-in Analog to Digital Converter (ADC). Luckily, the Grove Pi Hat has a **12-bit ADC** with 4 connectors.

In this part you will read analog data from a game controller joystick using an ADC.  
![][image8]

The joystick position controls the position of a potentiometer, which increases or decreases the voltage between Vcc and GND. You will measure this changing voltage using the ADC.

![][image9]  
*Potentiometer position increasing and decreasing voltage. ([Panama Hightek](https://panamahitek.com/en/what-is-and-how-does-a-potentiometer-work/)*)

Optionally, watch the video below to understand how the joystick works: [How do Video Game Controllers Work?  || Exploring a PS4 Game Controller](https://youtu.be/vQesgAtr2e4?t=287) (4mins).

You will have one of two possible joystick models. Both have 5 pins:

***Figure 7:** Top view of two joystick models with its 5 pins*

* **GND: Electrical ground**. Connect to the ground of the circuit where it’s used (ei. One of the Base Hat’s GND pins).  
* **Vcc / \+5V: Power source**. Voltage input that is “powering” the joystick. Will also determine the highest voltage coming out of the potentiometers. Therefore, when using 3.3V circuits (ei. Base Hat), **connect to 3.3V**, despite the \+5V label.  
* **VRx / Vout: Analog Voltage for x-position**. Between Vcc (see above) and 0V, depending on the position of the joystick.  
* **VRy / Yout: Analog Voltage for y-position**. See VRx for details.  
* **SW / Sel: Switch signal**. This is a simple button clicked with the joystick. Will produce on/off digital signal between Vcc (see above) and 0V.

## Part 2 Tasks {#part-2-tasks}

Steps below are **done in the reTerminal:**

1. Install the ***Grove.py*** library provided by Seeed.  
   1. If you haven’t already, make sure you have created a virtual environment for lab5.  
   2. pip install git+[https://github.com/Seeed-Studio/grove.py](https://github.com/Seeed-Studio/grove.py)  
      1. NOTE: do not follow the instructions for installation in the repo\! Use pip and a virtual environment instead.  
   3. (The above command will install the latest version of the grove.py library directly from GitHub rather than the pypi index.)  
2. Connect the joystick to the Base Hat on one of the ADC connections.  
   1. **Do not power the joystick with a 5V pin. GPIO pins are 3.3V tolerant only.**  
   2. See Figure 8 for analog connection details.

![][image10]  
***Figure 8:** Base Hat to joystick wiring.*

3. Create a python script named ***joystick.py*** that prints the analog input from the joystick.  
   1. Use the module ***adc.py*** from the [***Grove.py*** library](https://github.com/Seeed-Studio/grove.py/blob/master/grove/adc.py) to read the joystick’s analog data.  
   2. Print the data with the following format: 

*X \= 1234 ; Y \= 2345*

3. Sample the analog signal every 0.1 seconds.

## Part 2 Tips/Troubeshooting {#part-2-tips/troubeshooting}

There are a few setup steps to make sure the various components and softwares are working together properly for this part \-- make sure you are thorough and double check your setup if you are running into problems. The following tips should cover most errors.

1. Make sure your **i2c interface** is enabled. See the raspberry pi configuration, or try **sudo raspi-config** from inside the pi.

   2. Ensure you have installed **grove.py** using a venv, and that your venv is activated, when running the Part 3 script. Reread the Part 3 instructions if you’re not sure.

   

      3. 🔎 Search the [***Grove.py*** repository](https://github.com/Seeed-Studio/grove.py) for the ***adc.py*** module and look for examples on how to use it.

      4. Double check the connections of your joystick (make sure the correct cables is connected to the correct pins, see Figure 8).

   

      5. Make sure you have read and attempted the i2c fixes suggested in the instructions:  
- [Wrong i2c address problem/fix](https://github.com/Seeed-Studio/grove.py/issues/64)  
- [Wrong i2c bus problem/fix](https://github.com/Seeed-Studio/grove.py/issues/71) 

- If nothing from the above worked, try reading around and seeing if you can debug your i2c interface using some of the commands/ideas discussed at the following links:   
  - [https://raspberrypi.stackexchange.com/questions/92817/i2c-bus-0-not-working-i2c-bus-1-is](https://raspberrypi.stackexchange.com/questions/92817/i2c-bus-0-not-working-i2c-bus-1-is)   
  - [https://raspberrypi.stackexchange.com/questions/10566/i2c-devices-not-detected](https://raspberrypi.stackexchange.com/questions/10566/i2c-devices-not-detected)   
  - [https://stackoverflow.com/questions/62757687/raspberry-pi-4-i2c-bus-not-working-correctly](https://stackoverflow.com/questions/62757687/raspberry-pi-4-i2c-bus-not-working-correctly) 

| 🐞 | Note: when you see instructions referring to /boot/config.txt or similar \-- you should actually look in /boot/firmare/config.txt instead. | 🐞 |
| :---- | :---- | :---- |

# **Part 3: Mouse emulator (1%)** {#part-3:-mouse-emulator-(1%)}

The [***PyAutoGUI***](https://pypi.org/project/PyAutoGUI) ***library*** can control the mouse of a graphical desktop session.  
In this part you will use the joystick and the button from the previous parts to control the mouse of the reTerminal.

**READ THIS NOTE BELOW\!**

| ⚠️ | Note 1: *PyAutoGUI* only works when executed from a graphical desktop session. It will fail if the script is started in a SSH session. Note 2: *PyAutoGUI* doesn’t work on Wayland, which is the default for our raspberry pis. You will need to switch to X11: Follow the instructions below: ([original instructions for context](https://forums.raspberrypi.com/viewtopic.php?p=2156219&sid=0f4790196c0377bb83fabbb3c86beb01#p2156219)) Switch the PI-OS back to using the "X11" display compositor: invoke "sudo raspi-config" in a terminal select option 6\) "advanced options" \- select A6) "Wayland” \- select W1) "X11" \- a message will appear telling you that X11 is active use Tab to select "finish". Reboot. You will need to re-enable VNC (sudo raspi-config, Interface Options, follow the steps for VNC)  | ⚠️ |
| :---- | :---- | :---- |

**IF SOMETHING WITH THE MOUSE ISN’T WORKING, READ THE ABOVE\!**

Use the on-screen keyboard of the reTerminal, or plug a keyboard into the reTerminal, to run the code in this part on the graphical environment directly.

## Part 3 Tasks {#part-3-tasks}

1. Install the ***PyAutoGUI library***. Follow [instructions on PyPI](https://pypi.org/project/PyAutoGUI/).  
   1. Remember to use your virtual environment\!  
   2. See the [official docs](https://pyautogui.readthedocs.io/en/latest/index.html) for library API and examples.

   

2. Create a python script named ***mouse.py*** with the following functionality:  
     
   1. The joystick moves the mouse of the graphical desktop session in the x and y directions.  
        
   2. The speed of the mouse depends on the voltage sent by the joystick.  
      1. There must be at least two speeds: slow and regular.  
      2. Eg.: the higher the banking angle of the joystick, the faster the mouse will move.  
           
   3. A click of the breadboard button triggers a left-click of the mouse.  
      1. Use the joystick’s built-in button instead of the breadboard button from Part 3\.

# **Deliverables** {#deliverables}

1. Give a live demonstration to your teacher of part 3 on **Friday, March 21**  
   1. The joystick controls the reTerminal’s mouse with at least two movement speeds.  
   2. Use the joystick and button to click on an icon on reTerminal’s desktop.  
2. By now, you have written the following scripts:

Part 1\) **button.py**

Part 2\) **joystick.py**

Part 3\) **mouse.py**

Push these scripts to your **lab-5** branch on your Labwork repository, then submit on Gradescope.

[image1]: assets/image1.png
[image2]: assets/image2.png
[image3]: assets/image3.png
[image4]: assets/image4.png
[image5]: assets/image5.png
[image6]: assets/image6.png
[image7]: assets/image7.png
[image8]: assets/image8.png
[image9]: assets/image9.png
