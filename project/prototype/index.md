---
title: "Milestone 3: Device Prototyping"
description: |
  Begin implementing your application and reterminal codebases
date: 2026-02-27
blogpost: true
location: Project
author: 20%
language: 2026-04-24
---

In this milestone, you will adapt your course assignment
work to create a collective prototype of your reterminal
devices and your Typescript application.

This milestone will start where Milestone 2 and Assignment 1 ended. You will:

- Continue the tasks begun in Milestone 2 for project infrastructure
- Adapt your Assignment 1 code as a **subsystem** of your project code
- Acquire new devices to test and adapt to your subsystem code

## Getting Started

### Milestone 1 & 2 follow-up

- Go over Milestone 2 infrastructure plan with teacher 
- Go over subsystem plans with teacher and teammates

After these steps, you will acquire the devices you need to begin implementing your
prototype.

## Device Requirements

Each subsystem is required to have a minimum "complexity" of **8**. See the table below for more
information:

:::{note}

The overall "complexity" score, as well as the complexity for each device type below, is
not set in stone, is subject to change in the future.

:::

:::{list-table}

- - Device Type
  - Complexity Score
  - Examples
- - An Assignment 1 device
  - 2
  - LED, Temp/Humi sensor, Fan
- - Digital Sensor
  - 3, then 1
  - Magnetic door sensor, 
- - Analog sensor
  - 3, then 1
  - Joystick,
- - Digital actuator
  - 3, then 1
  - LED (on/off)
- - Analog actuator
  - 3, then 1
  - LED (PWM dimming)
- - Serial (SPI/I2C/UART)
  - 4 for each unique type, 2 for each repeated type
  - GPS, 
- - USB
  - 4 for each unique type, 2 for each repeated type
  - Raspberry Pi Camera

:::

## Code Requirements

### Overall

```
app/
├── <code for your App Dev III project work>
reterminal/
├── common/
├── <subsystem1>
├── <subsystem2>
├── <subsystem3>
```

### ReTerminal

```
subsystem/
├── controller
│   ├── pyproject.toml
│   ├── README.md
│   └── ...
├── dashboard
│   ├── package.json
│   ├── README.md
│   └── ...
```

The requirements for the reTerminal code are similar to assignment 1, but adapted to
**your devices**:

#### (20%) Device classes and scripts

For each of your subsystem devices, you should have a python file that:

- defines any `Sensor`/`Actuator` implementations you will use in your backend
- includes an `if __name__ == "__main__"` statement to permit the script to be tested
indepdendent of the rest of the project.

This is very similar to the requirements for `aht20.py`, `led.py`, etc. in Assignment 1,
but adapted for the devices for your subsystem.

#### (40%) Reterminal Backend

Each of your subsystem devices must be included in the reTerminal backend for your
subsystem.

- adapt your assignemt1 fastapi code to include the sensors and actuators from your
subssystem
- you should be able to read from each of the sensors, and control each of the actuators,
  from the `fastapi` `/docs` api.

This is very similar to the requirements for the backend in Assignment 1,
but adapted for the devices for your subsystem.

#### (30%) Reterminal Dashboard

Each of your subsystem devices must be included in the reTerminal dashboard for your
subsystem.

- adapt your assignment1 dashboard code to include the sensors and actuators from your
subssystem
- you should be able to read from each of the sensors, and control each of the actuators,
  from the dashboard. The exact UI is up to you.
- the dashboard **must run and be usuable on your reterminal**. Make sure you test this
out to ensure the buttons are big enough, etc.

This is very similar to the requirements for the dashboard in Assignment 1,
but adapted for the devices for your subsystem.

### Application

The exact requirements are TBD, but the big picture is:

- Each subsystem should have at least one page in your App Dev III App
- There should be UI for interaction with actuators / viewing sensors for each subsystem
- You should for now use mock data/interactions -- we will add IoT to connect the App and
  the Reterminal in Milestone 4
