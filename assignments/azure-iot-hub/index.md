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

## Learning to use IoT Features

To begin implementing the IoT Features on your subsystem, follow the following
instructional steps:

### Setup

Read and complete **up to and including** Part 1: Azure Setup of the App Dev Milestone 4: [App Dev Milestone 4 instructions](https://john-abbott-college.github.io/6A6-Notes/project/milestone-4/)

Afterwards, you should have:

- [ ] an IoT Hub
- [ ] At least one named device on your IoT Hub
    - [ ] Eventually, everyone should three devices (one for each teammate in the
project). See the figure below.
- [ ] A connection string for that IoT Hub

:::{figure} assets/hub-devices-example.png

Your Azure IoT Hub should look something like this when you are done creating devices for
yourself and your teammates.

Every team member should create devices for each of the subsystems in your project on
their own Azure IoT Hub.

:::

### Install Azure CLI

One tool that will be invaluable for us is the Azure CLI. You can install it on your
developer environment and/or your reterminal.

1. First, install azure CLI. See [installation
instructions (Debian)](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?view=azure-cli-latest&pivots=apt)
    - Recommended: "Option 1: Install with one command"
2. Login to azure cli on the machine you have installed it:
    ```
    $ az login

    # If the above doesn't work:
    $ az login --use-device-code
    ```
3. Install the `azure-iot` extention:
    ```
    az extension add --name azure-iot
    ```

### Sample Device Code

Before we change the code of our own subsystems, lets use a "Plug-n-Play" implementation
from Azure to see how everything should work.

The goal here is to:

- [ ] run python code that sends [telemetry](https://en.wikipedia.org/wiki/Telemetry)
updates to Azure IoT about a subsystem
- [ ] run python code that can receive [direct method
requests](https://learn.microsoft.com/en-us/azure/iot-hub/iot-hub-devguide-direct-methods)
and respond to them.

Follow the steps below:

- Git clone the following repo, either on your reterminal or your developer environment
    - [Sample Plug-n-Play code in Python](https://github.com/Azure/azure-iot-sdk-python/)
- Navigate to the `samples/pnp/` directory
- You will need to create a virtual environment in this directory (use either `uv` or
  `python -m venv`) to install any needed dependencies
- In that virtual environment, install the package `azure-iot-device`
- You will need to set the following environment variables:
    ```bash
    $ export IOTHUB_DEVICE_CONNECTION_STRING="<your connection string here>"
    $ export IOTHUB_DEVICE_SECURITY_TYPE="connectionString"
    ```
- Run the provided sample (`temp_controller_with_thermostats.py`)

You should see console output similar to the following:

```
Connecting using Connection String <redacted>
Updating pnp properties for root interface
{'serialNumber': 'some_serial_number'}
Updating pnp properties for thermostat1
{'thermostat1': {'maxTempSinceLastReboot': 98.34, '__t': 'c'}}
Updating pnp properties for thermostat2
{'thermostat2': {'maxTempSinceLastReboot': 48.92, '__t': 'c'}}
Updating pnp properties for deviceInformation
{'deviceInformation': {'swVersion': '5.5', 'manufacturer': 'Contoso Device Corporation', 'model': 'Contoso 4762B-turbo', 'osName': 'Mac Os', 'processorArchitecture': 'x86-64', 'processorManufacturer': 'Intel', 'totalStorage': 1024, 'totalMemory': 32, '__t': 'c'}}
Listening for command requests and property updates
Press Q to quit
Command name is: reboot
Command name is: thermostat1*getMaxMinReport
Command name is: thermostat2*getMaxMinReport
Sending telemetry from various components
Sent message
{"temperature": 29}
Sent message
{"temperature": 45}
...
```

Keep this process running -- what we're going to do now is verify that this device code is
indeed connected to the Azure IoT Hub.

### Verify the telemetry

See the following azure documentation: [Viewing telemetry](https://learn.microsoft.com/en-us/previous-versions/azure/iot/tutorial-send-telemetry-iot-hub?pivots=programming-language-python#view-telemetry)

### Verify the direct methods invocations

Instructions TBD

## (50%) IoT Features to Implement

Before beginning these features, **make sure you have done all the steps of the Learning
to Use Azure IoT above!**.

### (10%) Azure IoT Device Client setup

In the backend of your reterminal code, you will need to initialize an
[`IoTHubDeviceClient` (link to documentation)](https://learn.microsoft.com/en-us/python/api/azure-iot-device/azure.iot.device.aio.iothubdeviceclient?view=azure-python).

This object will connect to your Azure IoT hub using a connection string.
See the
[`create_from_connection_string`](https://learn.microsoft.com/en-us/python/api/azure-iot-device/azure.iot.device.aio.iothubdeviceclient?view=azure-python#azure-iot-device-aio-iothubdeviceclient-create-from-connection-string)
method in the documentation.

#### Connection String

You should set
this connection string in a `.env` file accessible to your subsystem.

:::{important}

DO NOT commit `.env` with your connection string to github!
You should add `.env` to your `.gitignore`.

You can create a `.env_example` file to document what environment variable keys you are
expecting someone running your system to have handy.

:::

```
IOTHUB_DEVICE_CONNECTION_STRING="<your connection string here>"
IOTHUB_DEVICE_SECURITY_TYPE="connectionString"
```

:::{note}

Suggestion: you can also set other useful environment variables in `.env` too --
`IOTHUB_NAME`, `IOTHUB_DEVICE_NAME`, etc.

:::

### (20%) Subsystem Telemetry

Each subsystem should sent sensor and actautor status reports on a regular basis (once
every 15 minutes).

Helpful examples:

- From the tutorial: [`send_telemetry_from_temp_controller`](https://github.com/Azure/azure-iot-sdk-python/blob/main/samples/pnp/temp_controller_with_thermostats.py#L150)
  and [`create_telemetry`](https://github.com/Azure/azure-iot-sdk-python/blob/main/samples/pnp/pnp_helper.py#L32)
- Project code from [previous iterations of this
class](https://github.com/jac-cs-capstone-w25)

Your subsystem should implement this technique for all of its sensors.

### (20%) Direct Methods

Use the [`on_method_request_received`](https://learn.microsoft.com/en-us/python/api/azure-iot-device/azure.iot.device.iothubdeviceclient?view=azure-python#azure-iot-device-iothubdeviceclient-on-method-request-received)(https://learn.microsoft.com/en-us/python/api/azure-iot-device/azure.iot.device.iothubdeviceclient?view=azure-python#azure-iot-device-iothubdeviceclient-on-method-request-received)(https://learn.microsoft.com/en-us/python/api/azure-iot-device/azure.iot.device.iothubdeviceclient?view=azure-python#azure-iot-device-iothubdeviceclient-on-method-request-received)(https://learn.microsoft.com/en-us/python/api/azure-iot-device/azure.iot.device.iothubdeviceclient?view=azure-python#azure-iot-device-iothubdeviceclient-on-method-request-received)(https://learn.microsoft.com/en-us/python/api/azure-iot-device/azure.iot.device.iothubdeviceclient?view=azure-python#azure-iot-device-iothubdeviceclient-on-method-request-received)(https://learn.microsoft.com/en-us/python/api/azure-iot-device/azure.iot.device.iothubdeviceclient?view=azure-python#azure-iot-device-iothubdeviceclient-on-method-request-received)(https://learn.microsoft.com/en-us/python/api/azure-iot-device/azure.iot.device.iothubdeviceclient?view=azure-python#azure-iot-device-iothubdeviceclient-on-method-request-received)(https://learn.microsoft.com/en-us/python/api/azure-iot-device/azure.iot.device.iothubdeviceclient?view=azure-python#azure-iot-device-iothubdeviceclient-on-method-request-received)(https://learn.microsoft.com/en-us/python/api/azure-iot-device/azure.iot.device.iothubdeviceclient?view=azure-python#azure-iot-device-iothubdeviceclient-on-method-request-received)
property of the `IoTHubDeviceClient` to implement the following direct methods:


Helpful examples:

- Project code from [previous iterations of this
class](https://github.com/jac-cs-capstone-w25)

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
