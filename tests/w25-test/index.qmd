---
title: Connected Objects Test
categories: [hardware, bash, linux, git, python, signals, iot]
date: 2025-05-12
format:
  pdf:
    include-in-header: header.tex
    template-partials:
      - before-body.tex
    geometry:
      - inner=3cm
      - outer=4cm
      - top=3cm
      - bottom=4cm
      - headsep=22pt
      - headheight=11pt
      - footskip=33pt
      - ignorehead
      - ignorefoot
      - heightrounded
    listings: false
filters:
  - ../../assets/filters/callout-question.lua
questions:
  number: true
---

**Worth:** 20%

**Time:** 105 minutes (1h45m)

**Rules:**

- Write all answers on the paper provided to you.
- This is an individual test. Collaboration/communication with other students is not permitted.
- Course notes and most websites are allowed for reference. 
- Test is OPEN BOOK, EXCEPT for auto-completion services such as ChatGPT, Bard, GitHub Co-pilot, etc.
- The following resources are encouraged and will be helpful:
    - Course notes (course website)
    - Past Labs and Assignments
- Since the course website and labs frequently link to pages on the general internet, you are allowed to consult the general internet -- EXCEPT for auto-completion services like ChatGPT as stated above.
- However, the test has been written such that questions are particular to our course, and searching on Google/other external resources will be slower/less relevant/perhaps misleading compared with starting with my course website/labs. 
- Please raise your hand to ask for instructor clarification when needed.

\newpage

## Python


:::: {.callout-question}
#### Python libraries
For many 3rd party python libraries that we have used in our projects, the "official" instructions to install those packages were to use root with the command: sudo pip3 install <package-name>.

We were not able to follow these instructions. Which of the following answers is the correct explanation + alternative approach?

::: {.content-hidden when-profile="solutions"}
\vspace{0.3in}
:::
::: {.content-visible when-profile="solutions"}
#### Solution
- Project python packages conflict with system python packages; use pip in virtual environment without sudo to install
:::
::::



## Hardware

:::: {.callout-question}
#### Hardware
What computing hardware is the reTerminal built upon?

::: {.content-hidden when-profile="solutions"}
\vspace{0.3in}
:::
::: {.content-visible when-profile="solutions"}
#### Solution
- Raspberry Pi CM 4
:::

::::

:::: {.callout-question}
#### Hardware
What operating system does the reTerminal use?

::: {.content-hidden when-profile="solutions"}
\vspace{0.3in}
:::
::: {.content-visible when-profile="solutions"}
#### Solution
- Raspberry Pi OS or Debian
:::
::::

:::: {.callout-question}
#### Plugging in a device
The Analog Joystick from Lab 3 has the following electrical connections:

- `GND`: Electrical ground
- `Vcc` / : Power source.
- `VRx` / `Vout`: Analog Voltage for x-position. Between `Vcc` (see above) and `0V`, depending on the position of the joystick.
- `VRy` / `Yout`: Analog Voltage for y-position. See `VRx` for details.
- `SW` / `Sel`: Switch signal. This is a simple button clicked with the joystick. Will produce on/off digital signal between `Vcc` (see above) and `0V.`

Explain in a few sentences how you could connect this device to the Raspberry Pi using the ADC Grove Hat component and the wires we have available in class such that:

- the `Vcc` is 5V
- the X and Y positions can be read from channel `A6` and `A7` of the grove bash hat respectively
- when the Switch button is pressed, a digital signal is sent to pin 22

::::

## IoT


:::: {.callout-question}
#### IoT Components
An IoT system has the following high level components:

- Sensors and/or Actuators of any kind
- IoT Devices
- Cloud Gateway
- Data Processing
- User Interfaces

Match each of these with the following:

- reTerminal
- RGB LED Stick
- GPS (Air530)
- Connection String
- Azure Portal

::: {.content-hidden when-profile="solutions"}
\vspace{0.3in}
:::
::: {.content-visible when-profile="solutions"}
#### Solution
- IoT Device
- Actuator
- Sensor
- Cloud Gateway
- Data Processing
- User Interface
:::
::::


## Signal Processing

:::: {.callout-question}
#### ADC

The Grove Base Hat has an Analog to Digital Converter (ADC) with 12 bit resolution. It outputs readings using an unsigned integer and the supported analog voltage range is from 0 to 3.3V.

If a joystick is plugged into the ADC of the basehat, and generates an output value of **3925**, what is the approximate position of the joystick and why? **Choices: Lowest, Middle, Highest.**

::: {.content-hidden when-profile="solutions"}
\vspace{0.3in}
:::
::: {.content-visible when-profile="solutions"}
#### Solution
:::

::::


:::: {.callout-question}
#### Device protocols

SPI and I2C use a Clock, why?

::: {.content-hidden when-profile="solutions"}
\vspace{0.3in}
:::
::: {.content-visible when-profile="solutions"}
#### Solution
:::

::::


:::: {.callout-question}
#### Digital vs Analog

Digital vs Analog?

::: {.content-hidden when-profile="solutions"}
\vspace{0.3in}
:::
::: {.content-visible when-profile="solutions"}
#### Solution
:::

::::


:::: {.callout-question}
#### reTerminal pins

The reTerminal has 40 pins designed to carry a variety of signals. Which of the following are NOT pins you can find on the reTerminal? Select ALL that apply (i.e., select all pins that you would NOT find on a reTerminal).

- A. 3.3V
- B. 5V
- C. 1V
- D. GPIO
- E. Ground
- F. 0V
- G. 12V

::: {.content-hidden when-profile="solutions"}
\vspace{0.3in}
:::
::: {.content-visible when-profile="solutions"}
#### Solution
:::

::::


:::: {.callout-question}
## ADC

The signal below is being sampled by an ADC that has a 8-bit resolution. What values are returned by the ADC at times 1s and 2s respectively? Assume an unsigned integer is returned by the ADC.

Separate your values with commas, and don't include units. For example: 111, 222

::: {.content-hidden when-profile="solutions"}
\vspace{0.3in}
:::
::: {.content-visible when-profile="solutions"}
#### Solution
51, 255
:::

::::

:::: {.callout-question}

Match the prompts below to the correct communication protocol (either HTTP, MQTT, or none of the above)

- Uni-directional (client must initiate, server/broker cannot)
- Publisher -> Subscriber protocol
- Connection can persist after message delivered
- Messages can be arbitrailty large in size
- Communication is stateful (message bahavior can depend on properties set by previous message)

::: {.content-hidden when-profile="solutions"}
\vspace{0.3in}
:::
::: {.content-visible when-profile="solutions"}
#### Solution
- HTTP
- MQTT
- MQTT
- HTTP
- MQTT
:::

::::

:::: {.callout-question}
## MQTT vs HTTP

Why is MQTT more energy efficient than HTTP as a protocol for IoT? Explain your answer using the devices and cloud that we are using in our project.

::: {.content-hidden when-profile="solutions"}
\vspace{0.3in}
:::
::: {.content-visible when-profile="solutions"}
#### Solution
- HTTP is a request -> response protocol.
- With HTTP, an IoT device has to constantly request updates from a server to have the latest information, even if nothing has changed.
- The reoccurring HTTP requests use computational resources which in turn uses more energy.
:::

::::

:::: {.callout-question}
#### Applying concepts to new devices

Consider a stovetop (the device, usually on top of an oven, used to heat food at home or work). Underneath the surface, a stovetop is a metal coil that, when a large amount of current is applied, heat is produced. The temperature of the stovetop is set by a dial from 0-10.

Apply knowledge we have learned in this course to answer the following questions:

- Is the stovetop an example of a sensor or an actuator? Explain in one sentence why you chose the answer you did.
- In Canada, stovetops are wired to a 240V power source. The voltage cannot be changed, so when the stovetop is on, the current is always the same, and the heat produced is always the same. In your own words, explain how the temperature of the stovetop can be adjusted by the dial from 0-10 despite this problem.

::: {.content-hidden when-profile="solutions"}
\vspace{0.3in}
:::
::: {.content-visible when-profile="solutions"}
#### Solution
- The temperature is not truly 0-10 since it can only be ON or OFF.
- PWM quickly turns the stovetop OFF for very short periods of time.
- The longer the stovetop is OFF, the colder the temperature is.
:::

::::



:::: {.callout-question}

Suppose you are troubleshooting a reTerminal connection to I2C devices. You run the following commands, and see the following results:

```
pi12@pi12:~/ $ i2cdetect -y 2
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         -- -- -- -- -- -- -- -- 
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
70: -- -- -- -- -- -- -- --
```

```
pi12@pi12:~/ $ i2cdetect -y 3
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         -- -- -- -- -- -- -- -- 
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
20: -- -- -- -- -- -- -- -- -- 29 -- -- -- -- -- -- 
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
70: -- -- -- -- -- -- -- 77                         
```

```
pi12@pi12:~/ $ i2cdetect -y 4
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

Select ALL of the following answers that are true, given the above results.

- Bus 4 has a device connected at address 29
- Bus 2 is enabled and ready to communicate over i2c
- Bus 4 has a device connected at address 77
- Bus 1 has a device connected at address 38

::: {.content-hidden when-profile="solutions"}
\vspace{0.3in}
:::
::: {.content-visible when-profile="solutions"}
#### Solution
- Bus 4 has a device connected at address 29
:::

::::





## Coding Exercise

:::: {.callout-question}

A developer is creating a Python script that uses several modules installed with pip. When running the script, the Python interpreter is not finding one of the modules installed with pip.

Write two commands that will:

- List all installed Python modules;
- List the installation directory of a specific Python module;

::: {.content-hidden when-profile="solutions"}
\vspace{4in}
:::

::: {.content-visible when-profile="solutions"}
#### Solution
```
pip show <package>
pip list
```
:::

::::

:::: {.callout-question}
#### Preparing a linux system

A developer is preparing a **RaspberryPi OS** for Python development. The developer has a user account with `sudo` permissions on the raspberry pi.

**Write down all of the commands needed** to do the following:

- Update system package repositories;
- Upgrade all installed system packages;
- Ensure `python3` is installed.
- Ensure the system `python3` is the default system python, and ensure that the `python3-venv` module is installed
- Create a new folder named `python-development` in the user's home directory;
- Create and activate a python virtual environment in the `python-development` directory;
- Install the python package `azure-cli` to the virtual environment.

HINT: the Developer environment setup notes will be useful for part of this question.

::: {.content-hidden when-profile="solutions"}
\vspace{4in}
:::

::: {.content-visible when-profile="solutions"}
#### Solution
```
sudo apt update
sudo apt upgrade -y
sudo apt install python3 python-is-python3 python3-venv
mkdir ~/python-development
cd ~/python-development
python -m venv .venv
source .venv/bin/activate
pip install azure-cli
```
:::

::::

:::: {.callout-question}

Assume `library/module.py` is a file you have installed in your virtual environment.

The code snippet `myscript.py` is incomplete.

Add the correct lines of code such that the program will **extend** the class defined in `library/module.py`, such that the code runs. 

You should aim to add the least lines of code possible.

Copy pasting the original implementation and modifying it will be worth partial marks, but not passing marks, as there is a more efficient method that we have learned.

Make it so your version of the `Device` class returns a non hardcoded value when the `read` method is called.

```python
class Device(object):
  def __init__(self, property1):
    self.property1 = property1
    self.property2 = "Hard-coded value"

    def read(self):
        return self.property2
```

Complete the code below!

```python
from library.module import ___________________
class myDevice(        ):

   def __init__(self,                )






```

::::
