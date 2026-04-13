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

### Application

The exact requirements are TBD, but the big picture is:

- Each subsystem should have at least one page in your App Dev III App
- There should be UI for interaction with actuators / viewing sensors for each subsystem
- You should for now use mock data/interactions -- we will add IoT to connect the App and
  the Reterminal in Milestone 4
