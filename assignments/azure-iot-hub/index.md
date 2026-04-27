---
title: "A2: Azure IoT Hub"
description: |
  Extending the A1 prototype to use async patterns, IoT protocols.
date: 2026-03-01
blogpost: true
location: Assignment
author: 9%
language: 2026-05-11
---

## Overview

In this assignment, we will build on the

## (%30) Subsystem improvements

### (%10) Dashboard/backend autostart

- `systemctl`
- `firefox kiosk`

### (%20) Choose your adventure

- Unit testing for all devices, incorporated into CI/CD
- reTerminal features

## (%50) IoT Features

### (%20) Telemetry

IoTHub Device to Cloud (D2C) for Sensor Readings (1%)

Your IOT system is initialized with sensors and periodically reads and sends a list of Readings to the IoT Hub
Each message has a custom property key of “measurement” with a corresponding value set to the Measurement type for that Reading
The body of each message contains a json representation of the Reading.
Hint: 
The example_system shows how you should use the Azure Device Client in your system code to send readings, see https://github.com/420-6A6-6P3-W25/final-project-upstream/blob/main/iot_subsystems/src/example_system/example_system.py#L64 and https://github.com/420-6A6-6P3-W25/final-project-upstream/blob/main/iot_subsystems/src/example_system/example_system.py#L87 
You can monitor D2C messages and their properties using the Azure CLI command. You should see D2C messages recorded as events in this output.
az iot hub monitor-events --properties all --output table --hub-name <iot-hub-name>

### (%20) Direct Methods

Each subsystem must receive and respond to the following direct method:

Name: “is_online”
No payload required.

The direct method response should include:

200 code if the method name matches “is_online”
No payload required.
400 code if a different method name is used.
Payload: { "details": "method name unknown" }

The direct method request should also be logged to the console of the reTerminal.

IoTHub Direct Method for “control_actuator” controls your actuators (3%)

Acceptance criteria:
Each IOT System can receive actuator commands as Direct Method invocations
Name: “control_actuator”
Payload: JSON describing the command

For example, if your IOT subsystem has a fan, then the following direct method invocation using azure cli should work:

az iot hub invoke-device-method --mn control_actuator -d ${IOT_DEVICE_NAME} -n ${IOTHUB_NAME} --payload “{action: FAN_TOGGLE, value: 1}”

This should result in:
The fan turning on
The Command being logged to the console of your reTerminal.

The direct method response should include:
200 code if the control_actuator method returns True (meaning the state changed)
Payload: { "details": "method name unknown" }
201 code if the control_actuator method returns False (meaning the state did NOT change)
Payload: { "details": "method name unknown" }
400 code if the action or value, or anything about the --payload , is invalid.
Payload: { "details": "method name unknown" }


### (%10) Device Twin

The farm must include the ability to receive Device Twin updates from the IoT Hub.

You can see course notes with example tutorials here: https://john-abbott-college.github.io/6P3-Notes/topics/iot/docs/device-twins.html 

This cheatsheet may also be useful: https://john-abbott-college.github.io/6P3-Notes/topics/iot/docs/azure-cli-cheatsheet.html 

You are only required to receive the desired property below. The device is not required to report any reported properties for this Milestone.

“telemetryInterval” : <int value>

The int value represents the time interval to upload D2C messages in seconds. When set, this value will overwrite the default telemetry interval of 5 seconds.

The farm should get the desired twin property as soon as it starts as well as any time there is a new update (patch).

## (%20) Documentation

- README for subsystem
- README for each device
- `pyproject.toml` up to date with dependencies
- linting/formatting
