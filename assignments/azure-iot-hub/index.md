---
title: "A2: Azure IoT Hub"
description: |
  Extending the A1 prototype to use async patterns, IoT protocols.
date: 2026-03-01
blogpost: true
location: Assignment
author: 9%
language: 2026-05-14
---

## Overview

In this assignment, we will build on the project work. This is an individual task done in
your project repo.

## (30%) Subsystem improvements

### (10%) Dashboard/backend autostart

- autostart backend and dashboard processes at boot with `systemd`
    - Adapt these instructions from Adafruit for **enabling a systemd process that runs on
      boot**:
    <https://learn.adafruit.com/running-programs-automatically-on-your-tiny-computer/systemd-writing-and-enabling-a-service>
    - to run a web app in fullscreen from a script: use `firefox kiosk` along with `bun`
    to start your dashboard
- Goal: when your reterminal turns on, the dashboard and backend should autostart in
fullscreen.

### (20%) Choose your adventure

Choose one of the following options:

- Unit testing for all devices, incorporated into CI/CD
    - IDEA: ensure that all sensors/actuators have unit test coverage
    - IDEA: ensure your backend code has unit test coverage
- reTerminal features (see the [grove documentation](https://wiki.seeedstudio.com/reTerminal-hardware-interfaces-usage/)
    - buzzer (actuator)
    - built-in accelerometer (sensor)
    - backlight (sensor)
    - buttons (actuators)
    - IDEA: incorporate the above features of the reterminal into your subsystem
    dashboard/backend.
- Other extra cool features of a similar complexity to above

## (50%) IoT Features

- Context: [App Dev Milestone
4](https://john-abbott-college.github.io/6A6-Notes/project/milestone-4/)
- Tutorial: [Send telemetry from an IoT Plug and Play device to Azure IoT Hub](https://learn.microsoft.com/en-us/previous-versions/azure/iot/tutorial-send-telemetry-iot-hub?pivots=programming-language-python#run-the-device-sample)
- Sample code to use during the tutorial: [Sample Plug-n-PLay code in Python](https://github.com/Azure/azure-iot-sdk-python/tree/main/samples/pnp)

### (20%) Telemetry

Each subsystem should sent sensor and actautor status reports on a regular basis (once
every 15 minutes).

See the above tutorials for how to send telemetry to Azure IoT Hub.

Your subsystem should implement this technique for all of its sensors.

### (20%) Direct Methods

Each subsystem must receive and respond to the following direct methods:

> Name: `is_online`
> Payload: No payload required.
> 
> The direct method response should include:
> 
> 200 code if the method name matches `is_online`
> No payload required.
> 
> 400 code if a different method name is used.
> Payload: `{ "details": "method name unknown" }`
> The direct method request should also be logged to the console of the reTerminal.

> Name: `control_actuator`
> Payload: JSON describing the command
> 
> For example, if your IOT subsystem has a fan, then the following direct method invocation using azure cli should work:
> 
> `az iot hub invoke-device-method --mn control_actuator -d ${IOT_DEVICE_NAME} -n ${IOTHUB_NAME} --payload "{action: FAN_TOGGLE, value: 1}"`
> 
> This should result in:
> The fan turning on
> The Command being logged to the console of your reTerminal.
> 
> The direct method response should include:
> 
> 200 code if the control_actuator method returns True (meaning the state changed)
> Payload: `{ "details": "method name unknown" }
> 201 code if the control_actuator method returns False (meaning the state did NOT change)
> Payload: `{ "details": "method name unknown" }
> 400 code if the action or value, or anything about the --payload , is invalid.
> Payload: `{ "details": "method name unknown" }```

## (20%) Documentation

- README for subsystem
- README for each device
- `pyproject.toml` up to date with dependencies
- linting/formatting
