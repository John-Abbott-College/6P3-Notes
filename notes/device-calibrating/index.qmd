---
title: "Device calibration"
subtitle: |
  Notes for getting your sensors/actuators to work.
date: 2025-05-05
categories: [hardware, bash, python]
toc-expand: 2
bibliography: references.bib
nocite: |-
  @*
---

## Overview

These notes group together various tips and tricks for calibrating and coding the
sensors and actuators for your project.


### To just make progress on A2/M4

#### Sensors

Make a file very similar to the one I made for the [aht20](https://github.com/420-6A6-6P3-W25/final-project-upstream/blob/main/iot_subsystems/src/example_system/devices/aht20.py), suggestions:

- name the python file after the device, for e.g., `tmg39931.py` for the the TMG39931.
- make a Mock class very similar to the `MockGrove...` class I made, e.g. `MockTMG39931`
    - (for now) have it inherit the same `Grove...` class, since it's also an I2C-using module, the behaviour is similar enough for us to be happy, we can replace it later
    - Ensure you use the correct default bus (1) and address (depends on the device)
    - define a read method that returns a tuple with random numbers for all the readings
- Make a `Sensor` class for each reading in a similar style to my Temperature and Humidity sensors
    - the `device` type should be the same (`Grove...`), so it can be the same type as your Mock class.
    - the `measurement` should be a new `Measurement` type you create for that device.
- Use your new `Sensor` classes the same way I used the Temperature and Humidity ones, that is, make sure the `device` controller gets them when the system is initiated
- You can now do everything you need to do to meet 100% of the A2/M4 requirements

### To get the device working

#### I2C devices

- Use one of the three ports labelled "I2C" on your raspberry pi, plug the sensor in
- on your reterminal, run `i2cdetect -y 1`. The devices' address should be "in use" once the device is plugged in
- See if you can get readings from the device using python. Try to find an [example using the device in python](https://github.com/ControlEverythingCommunity/TMG39931/blob/master/Python/TMG39931.py)

### To use the device in your project code

#### Sensors

- Make a new device class (e.g. `TMG39931` class in your device file e.g. `tmg39931.py`. It's going to be really similar to the `Grove...` class in the `grove.py` library, except:
    - `__init__` : the same, but use the correct default address and bus.
    - `read`: same idea, but customize according to the previous steps where you got readings from the device.
- Make your `Mock` class inherit from your new class instead
- Make your `Sensor` classes use your new class as the `device` instead
