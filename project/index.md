---
title: "Project"
description: "Index of all project milestones."
date: 2026-01-01
---

:::{toctree}
:maxdepth: 1
:glob:
:hidden:
*/*
:::

In this capstone project, you will work in teams of 3 to research, design, prototype, and deliver an end-to-end IoT product.

The IoT solution will use the following tech stack:

* 3x reTerminal for the IoT computing devices.
* Python/Bash for the on-device programming logic.
* Microsoft Azure for the cloud infrastructure and IoT gateway.
* TypeScript and Expo for the multi-platform control center application.

:::{figure} assets/infrastructure.png

Cloud infrastructure that will be used for the final project. Pretend that it says
"Typscript App" instead of MAUI App!

:::

With some constraints, the goals and objectives of the IoT system
will be up to your team.

Your final product will be a codebase that is inheritable by future students
and teachers in this program!

## Milestones

The course project will consist of 5 milestones.

NOTE: the **Worth** percentage is a percentage of the project portion of your grade.

- In connected objects: the project grade is 35% of your overall grade.
- In app dev III: the project grade is 50% of your overall grade.

:::{postlist}
:location: Project
:date: %A, %B %d, %Y
:format: {title} (Due: {language}; Worth: {author})
:list-style: circle
:excerpts:
:sort:
:expand: Read more ...
:::

## Hardware

The following list contains most of the available parts.

Other parts may be purchased or used on request. Ask me if you have any cool ideas or
questions!

| Component & DocumentationRefer to these for hardware specifications and circuit/pin/bus reference. Software may not be relevant. | Interface Type | Relevant Libraries Refer to these for suggested python libraries to use to interface with the device | Examples Refer to these for similar examples to us in class (python on Raspberry Pi). This is a better starting point than other online sources, since the sensors/actuators we use are used on a wide variety of hardware.  |
| :---- | :---- | :---- | :---- |
| [Water Level Sensor \*](https://www.waveshare.com/wiki/Liquid_Level_Sensor) | Analog | [ADC library for Grove Base Hat](https://github.com/Seeed-Studio/grove.py/blob/master/grove/adc.py) (Github) | See use of ADC in [Lab 3](https://docs.google.com/document/d/1-H11p5e-HsdLQ4isPcim3jEzQ005bsckOcPwPpzzdTI/edit?usp=sharing) |
| [Soil Moisture Sensor \*](https://wiki.seeedstudio.com/Grove-Capacitive_Moisture_Sensor-Corrosion-Resistant/) | Analog | [ADC library for Grove Base Hat](https://github.com/Seeed-Studio/grove.py/blob/master/grove/adc.py) (Github) | See use of ADC in [Lab 3](https://docs.google.com/document/d/1-H11p5e-HsdLQ4isPcim3jEzQ005bsckOcPwPpzzdTI/edit?usp=sharing) |
| [RGB Led Stick](https://wiki.seeedstudio.com/Grove-RGB_LED_Stick-10-WS2813_Mini/#docusaurus_skipToContent_fallback) | PWM | [grove\_ws2813\_rgb\_led\_strip.py](https://github.com/Seeed-Studio/grove.py/blob/master/grove/grove_ws2813_rgb_led_strip.py) module from Grove.py package. | See module source code.Alternatively, see [NeoPixels on Raspberry Pi](https://learn.adafruit.com/neopixels-on-raspberry-pi/overview) for using NeoPixel CircuitPython library with the Blinka compatibility layer. |
| [Cooling Fan](https://abra-electronics.com/thermal-management/fans/dc-fans-5v/5v-cooling-fan-40mm-x-10mm.html) | Digital | Controlled via relay module | See [fan and relay in Lab 4](https://docs.google.com/document/d/1M3LKarz0A299S5vM3ysqtHiEnGWiEEBzVWy4iCj3lYc/edit?usp=sharing) |
| [AHT20 Temp & Humidity Sensor \*](https://wiki.seeedstudio.com/Grove-AHT20-I2C-Industrial-Grade-Temperature%26Humidity-Sensor/) | I2C | [Grove\_temperature\_humidity\_aht20.py](https://github.com/Seeed-Studio/grove.py/blob/master/grove/grove_temperature_humidity_aht20.py) from Grove | See use of [AHT20 Lab 4](https://docs.google.com/document/d/1M3LKarz0A299S5vM3ysqtHiEnGWiEEBzVWy4iCj3lYc/edit?usp=sharing) |
| [GPS (Air530)](https://wiki.seeedstudio.com/Grove-GPS-Air530/)  | Serial | [pyserial](https://pythonhosted.org/pyserial/shortintro.html) to read serial data. [pynmea2](https://github.com/Knio/pynmea2) to parse gps messages | [Location tracking](https://github.com/microsoft/IoT-For-Beginners/tree/main/3-transport/lessons/1-location-tracking) by Microsoft This is a general summary of how long/lat measurement works, the important/relevant example is in a sublink called “[Single-board computer \- Raspberry Pi](https://github.com/microsoft/IoT-For-Beginners/blob/main/3-transport/lessons/1-location-tracking/pi-gps-sensor.md)” |
| [USB Power Bank](https://www.amazon.ca/INIU-Portable-External-Powerbank-Compatible/dp/B07G34JZG2/ref=sr_1_5?crid=R0AZJWGG4977&dchild=1&keywords=usb+battery+pack&qid=1635955800&sprefix=usb+battery+%2Caps%2C188&sr=8-5) | N/A | N/A | N/A |
| [reTerminal’s built-in accelerometer](https://wiki.seeedstudio.com/reTerminal-hardware-interfaces-usage/#accelerometer) | I2C | [acceleration.py](https://github.com/Seeed-Studio/Seeed_Python_ReTerminal/blob/main/seeed_python_reterminal/acceleration.py) in [Seeed\_Python\_ReTerminal](https://github.com/Seeed-Studio/Seeed_Python_ReTerminal) | [Accelerometer Test](https://github.com/Seeed-Studio/Seeed_Python_ReTerminal#accelerometer-test) and [Accelerometer and Buttons Test](https://github.com/Seeed-Studio/Seeed_Python_ReTerminal#accelerometer-and-buttons-test) (async) |
| [reTerminal’s built-in buzzer](https://wiki.seeedstudio.com/reTerminal-hardware-interfaces-usage/#buzzer) | I2C (I/O expander) | [core.py](https://github.com/Seeed-Studio/Seeed_Python_ReTerminal/blob/main/seeed_python_reterminal/core.py) in [Seeed\_Python\_ReTerminal](https://github.com/Seeed-Studio/Seeed_Python_ReTerminal) | [Buzzer Test](https://github.com/Seeed-Studio/Seeed_Python_ReTerminal#buzzer-test) |
| [PIR Motion Sensor](https://wiki.seeedstudio.com/Grove-Adjustable_PIR_Motion_Sensor/) \* | Digital | None needed. [grove\_mini\_pir\_motion\_sensor.py](https://github.com/Seeed-Studio/grove.py/blob/master/grove/grove_mini_pir_motion_sensor.py) can be used. | [*Play With Arduino*](https://wiki.seeedstudio.com/Grove-Adjustable_PIR_Motion_Sensor/#play-with-arduino) from wiki. |
| [Magnetic door sensor reed switch](https://abra-electronics.com/electromechanical/switches/magnetic-reed-switches/sec-100-magnetic-door-sensor-no.html) | Digital | None needed, behaves like a button. [Button class](https://gpiozero.readthedocs.io/en/stable/recipes.html#button) from gpiozero. | [Blog post](https://www.electroniclinic.com/reed-switch-with-raspberry-pi-interfacing-and-python-programming/) by electroniclinic.com |
| [MG90S 180° Micro Servo](https://abra-electronics.com/electromechanical/motors/servo-motors/mg90s-metal-gear-micro-servo-rc-micro-servo.html) | PWM | [Servo class](https://gpiozero.readthedocs.io/en/stable/recipes.html#servo) from gpiozero | [Example \+ video](https://github.com/garyexplains/examples/tree/master/servo) by garyexplains |
| [Sound Sensor/ Noise Detector](https://wiki.seeedstudio.com/Grove-Loudness_Sensor/) | Analog | [ADC library for Grove Base Hat](https://github.com/Seeed-Studio/grove.py/blob/master/grove/adc.py) (Github) | See use of ADC in [Lab 3](https://docs.google.com/document/d/1-H11p5e-HsdLQ4isPcim3jEzQ005bsckOcPwPpzzdTI/edit?usp=sharing) |
| (Optional) Alternative  device |  |  | There are other sensors/actuators available to us in the lab. Instructions/examples will be available in a future Connected Objects milestone. |

## Example Projects

- Winter 2025 projects: <https://github.com/orgs/420-6A6-6P3-W25/repositories>
  - Here, each team came up with their own subsystem and device capabilities.
  - This will be a good reference for seeing what different ideas are possible.
- Winter 2024 projects: <https://github.com/orgs/JAC-Final-Project-W24-6A6-6P3/repositories>
  - In this semester, ALL teams had the same subsystems (Plant, Geo, and Security).
  - Here, you can see polished ideas for subsystems.
  - I can particularly recommend the `CropCare` project -- very high quality.
