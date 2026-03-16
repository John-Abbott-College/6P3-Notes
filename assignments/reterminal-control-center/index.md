---
title: "A1: reTerminal Control Center"
description: |
  Creating a prototype reTerminal with connected devices.
date: 2026-03-13
blogpost: true
location: Assignment
author: 9%
language: 2026-03-31
---

:::{important}

These instructions are a work-in-progress: stay tuned for updates.

:::

## Overview

In this assignment, you will make a **prototype** of the applications you deploy on your
reTerminal for your project.

The stack will be:

- Python backend for managing on-board and external devices
- Typescript frontend for interfacing with the reterminal touchscreen
- HTTP communication between the backend and the frontend.

This assignment will use similar techniques from previous labs (bash and python scripting)
to control devices, but will require a bit more structure to create a solid foundation for
future development.

The idea is to create a *quick* (NOT perfect) *prototype* to demonstrate that the
technology stack we've chosen will suffice for the basic set of problems. In future
assignments and project milestones, we will tweak and perfect this stack. So: don't sweat
trying to make the code perfect in this assignment -- we'll get there.

## Getting Started

- Ensure your `coursework` `instructions` branch is up to date
- Create a branch called `a1` for your work on this assignment off of `instructions`.
- On your `a1` branch, create a directory called `a1`.

### New Dependencies

We will be using more advanced project management tools for this assignment.

In your App Dev class, you use `bun` to manage typescript dependencies -- we will do that
here, as well as using a similar tool called `uv` for our python dependencies

- [Instructions for installing `uv` on your developer environment/reTerminal](https://docs.astral.sh/uv/getting-started/installation/#installation-methods)
- [Instructions for installing `bun` on your developer environment/reTerminal](https://bun.com/docs/installation)

Make sure you install `bun` and `uv` on both your reterminal and your developer
environment.

### Project structure

Once you have `uv` installed:

After running `uv init controller` in the `a1` directory of your coursework repository.
You should end up with following structure in your coursework repository on branch `a1`:

```
coursework-<your-repo-name>/
├── a1
│   └── controller
│       ├── main.py
│       ├── pyproject.toml
│       └── README.mdoursework-<your-repo-name>
├── <other-lab-directories>
```

## (10) Device Scripts

First, you will create 

Add the following files to your `controller` directory:

```
coursework-<your-repo-name>/
├── a1
│   └── controller
│       ├── led.py # for controlling an LED
│       ├── fan.py # for controlling a fan
│       ├── aht20.py # for controlling the aht20 temp/humi sensor
```

### Hardware Setup

This assignment will use three of the devices in your reTerminal kit:

- the LED
- the fan + relay for powering the fan circuitry
- the AHT20 for temperature/humidity readings

For each of the three devices there is a bit of custom set up. 

Instructions for setting up device can be found here:
<https://docs.google.com/document/d/1KQtT8Uj5ExVKaLA7Ey5N58Vd93QWsowbqu-CDyIw36s/edit?usp=sharing>

:::{note}

The instructions above are from an old lab -- don't focus on making the code match the
requirements exactly. We will be making changes to it in the following steps.

:::

### Scripts

Each of the device files (`led.py`, `aht20.py`, `fan.py`) should have a `__main__` execution statement.
This will allow you to test the file directly:

:::{note}

To see the point of the `if __name__=="__main__"` statement, see the
[course notes on python scripting]<project:/lectures/python-scripting/index.md#top-level-environment>

:::

```python
if __name___ == "__main__":
    # your code for each device goes here 
    # This should be a simple loop that shows the device turning on/off
    # or, in the case of a sensor, showing readings from the device.


```

### Requirements

To get marks for this part of the lab:

- commit & push your changes to the `a1` branch
- Sometime before the deadline, **In-person demo** your scripts to me, showing that all
three devices work.

:::{note}

Make sure you are using `uv` to manage your dependencies. Your `pyproject.toml` file
should have a complete list of all the dependencies needed for this project.

```
uv add <dependency name>
uv remove <dependency name>
```

See <https://docs.astral.sh/uv/getting-started/features/>

:::

## (45) Device Controller Backend

For this part of the assignment, we will be setting up a Python backend for communicating
with the device code you've made.

Make the following adjustments:

```
├── a1
│   └── controller
│       ├── app.py # Rename main.py -> app.py
│       ├── model.py # For making sure the above have a common interface
```

### Create a model

To make the devices 

Add the following code to `model.py`:

```python
from typing import Any

class Sensor():
    device: Any
    UNIT: str = ""

    def __init__(self, device: Any):
        self.device = device

    def read_sensor(self) -> str:
        """Takes a reading of the sensor, and returns the result as a string."""
        pass

class Actuator():
    device: Any
    state: str = ""

    def __init__(self, device: Any):
        self.device = device

    def control_actuator(self, state: str) -> str:
        """Changes the internal state of the actuator, and returns the new state as
        a string."""
        pass
```

### Using the model

Create **python classes** in your `led.py`, `fan.py`, and `aht20.py` files. These classes
should be:

```python

class TemperatureSensor(Sensor);
    pass

class HumiditySensor(Sensor):
    pass

class Fan(Actuator):
    pass

class LED(Actuator):
    pass
```

Then, **implement** the classes. That means: each class should have implementations for
the functions of its parent class.


### Using FASTAPI

:::{note}

These instructions are a bit thread-bare at the moment: I will improve them soon.

:::

We will make the devices externally accessible using a library called FastAPI.

First, add the dependency to your project using `uv`:

```
uv add fastapi['standard']
```

You can then modify `app.py` so that you can add endpoints to your python backend: <https://fastapi.tiangolo.com/tutorial/first-steps/>

### Requirements

You should have the following endpoints:

- `/read/{sensor-id}`: a GET request for a reading from the given sensor
- `/control/{actuator_id}`: a PUT request to change the state of the actuator

You should have unique ids for 1 temperature sensor, 1 humidity sensor, 1 fan actuator,
and 1 LED actuator.

For marks for this part of the assignment:

- push working code to `a1` branch of your repository
- In person demo of the API working (instructions TBA)

## (35) Dashboard

Instructions TBA

- Electrobun
- OR, react-native-for-web using Expo

## Rubric

- TBA


