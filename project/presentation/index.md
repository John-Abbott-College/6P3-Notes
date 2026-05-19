---
title: "Milestone 5: Final Presentation"
description: |
    Integrate physical devices with application and IoT architecture in a short
    demonstration.
date: 2026-02-27
blogpost: true
location: Project
author: 35%
language: 2026-05-27
---

In this milestone, you will give an in-person demonstration
of the functionality of your entire project. This milestone
will also be an assessment of the quality of the code and documentation
of your project.

*This documented adapted with permission from [Vik's lovely notes on the App Dev requirements
for this milestone](https://john-abbott-college.github.io/6A6-Notes/project/milestone-5/).
Make sure you read those too!*

## 🔍 Context

Milestone 5 is the culmination of your App Dev III project.
In [Milestone 4](project:project/iot-integration/index.md)
you incorporated your reTerminals as *IoT devices* within an Azure IoT Hub instance.

This milestone will test the integration of all your subsystems with your multi-platform application.
Your reTerminal devices should robustly measure data, send regular telemetry,
and act upon instructions from your applications, reTerminal dashboard, and Azure IoT Hub control commands.

## ✅ Requirements

:::{note}
These are the requirements for **Connected Objects**. Vik and I might have different ways we grade you.
Below is what will determine your **Connected Objects** grade.
:::

What follows is an explanation of the requirements.

You can see the weight of these requirements in the <#grading-rubric> section below.

### Presentation

The bulk of your marks for this milestone will come from the in-person presentation taking
place on May 21/22/26/27 (see <#schedule> below).

#### Demo: readiness, flow, and organization

Your team should be **ready to present** by the time of the beginning of your demonstration. There are a few components to this:

- Your team should have some plan for how to present the main features of the subsystem and the app
    - Vik and I will ask questions throughout, but you should not need use to prompt you
    to show off what your subsystems can do. Have a plan to show us what you've done
    already!
- All team members should be able to quickly demo device features when asked
    - **Recommendation: practise in advance!**

**Subsystems**

- Live readings for all sensor devices,0,Subsystem relatively few sensors/actuators/complexity,-0.3
- Lack of familiarity with devices during demo,-0.2,Able to determine if device online/offline using direct method call,0,Subsystem does not have enough sensors/actuators/complexity,-0.5
- Unable to quickly query using Azure CLI during demo,-0.3,,,Good sensor calibration and unit choices,0
- Not ready to return all borrowed devices at end of lab,-0.3,,,,

#### IoT integration

- You have already set up your reterminals to use the same IoT Hub as your application
    - Your reterminals are using the correct connection string / device id
- That IoT Hub is ready to use (you don't run into message limiting issues)
- Able to quickly query Azure using CLI when asked
 
#### Subsystem functionality

- Device autostart/quickstart: you should be able to quickly start your reterminal
    - That means: we shouldn't have to watch you set up the several terminal instaces
    required to start the backend/dashboard/etc.
    - Ideally, your reterminals should autostart and be connected to the IoT Hub and ready
      to use
    - Alternatively, wrap the startup into a single script that can be quickly executed
    over SSH.
- your reTerminal apps should be robust, not crash
- Device setup issues

#### After the demo


### Repository content

This part of the requirements is an assessment of the code committed to your project
repository.

#### Git Integration

- **All work must be merged to the `main` branch and easily accessible**
- Aim to incorporate or remove ALL branches in `main`
    - NOTE: I'm not expecting perfection, but a good effort to clean up the branches is
    expected.
- Git history shows good coordination (meaningful commit messages, proper branching)
    - NOTE: I'm not expecting perfection across ALL of your commit history. I'm looking
    to reward teams that put some effort into this, and give medium-ish marks to teams who
    didn't.
- `.gitignore` properly configured (i.e. no `.venv/` committed)

#### Code Quality

- Clean, well-organized subsystem code. There should not be many linter or formatting
  issues.
- Aim for modular, non-repetitive code.
- Not expecting perfection, but effort.

#### Documentation

Your repository must include complete setup instructions in the README:

:::{note}

Your `main` branch root-directory `README.md` does not itself need to contain all of the information below, but it
**must** be an access point for where to find that information.

Vik & I should be able to open the main link to your repository and immediately be able to
find links and/or information about your application, subsystem, and IoT documentation.

:::

- Subsystem documentation for devices
    - **Setup Instructions**: How to run the app per subsystem
        - Device wiring, 
    - **Usage Instructions**: How to run the app per subsystem
        - Instructions for setting up autostart / quickstart on a new machine
        - Dependencies installation steps
        - Environment variable names and where to set them / how to source them before running programs
    - **Protocol type** (Digital/Analog/Serial/UART/I2C/USB/etc.) for each device
    - **Datasheet** linked for each device.
- Known issues or limitations

The goal is that another team or instructor should be able to clone your repo and configure their own IoT Hub to test your app with your suite of devices.


## 🎬 Demo Format

:::note
Your scheduled demo slot is also your final deadline for this milestone.
:::

During your in-person demo, your team will demonstrate the complete system functionality. All team members **must** be present.
You will be asked to go through each of the requirements stated above and will be graded on the spot.
Failure to meet any of the criteria will result in deductions, and you will not have any opportunities after the demo to fix them.

### Presentation Schedule

::::{subfigure} AB|CD
:layout-sm: A|B|C|D
:gap: 8px
:subcaptions: above
:name: schedules
:class-grid: outline

:::{image} assets/schedule-thurs21.png
:alt: Thursday May 21st
:::

:::{image} assets/schedule-thurs21.png
:alt: Friday May 22nd
:::

:::{image} assets/schedule-thurs21.png
:alt: Tuesday May 26th
:::

:::{image} assets/schedule-thurs21.png
:alt: Wednesday May 27th
:::

Presentation Schedule

::::

### After the demo

## 📊 Grading Rubric

### Presentation

See the table below for the rubric I will be applying during your presentation.
See the relevant section above for explanation of the main categories.

:::{csv-table}
:file: presentation-rubric.csv
:header-rows: 1

:::

### Code Quality, Git, & Documentation

See the table below for the rubric I will be applying after your presentation.
See the relevant sections above for explanation of the main categories.

| Points | Criteria                                                                                                                                          |
| ------ | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| **3**  | Clean, well-organized code. TypeScript types properly defined and integrated (union types). Meaningful commit messages showing good coordination. Complete README documentation. No console errors.               |
| **2**  | Generally clean code with minor issues. Most types defined. Git history adequate. Documentation mostly complete. Minor console warnings.                      |
| **1**  | Acceptable code with multiple issues. Some type conflicts. Poor Git coordination. Incomplete documentation. Console errors present.                                    |
| **0**  | Poor code quality. Major type conflicts. No Git coordination. Missing documentation. Major console errors.                                                          |

### Peer & Self Assessment

We will use the same Peer & Self Assessment as in App Dev III; please [see the relevant
instructions here](https://john-abbott-college.github.io/6A6-Notes/project/milestone-5/#peer--self-assessment-3-points)

## 📝 Summary

| Component                           | Points | Notes                                                                      |
| ----------------------------------- | ------ | -------------------------------------------------------------------------- |
| Presentation: demo/readiness/flow   | 20     | All three reterminal devices working                                       |
| Presentation: IoT Integration       | 20     | All tabs unified, 2+ user roles with authorization, professional interface |
| Presentation: Subsystem             | 20     | Airplane mode test required during demo                                    |
| Code Quality, Git, & Documentation  | 20     | Clean code, types, Git coordination, README                                |
| **Project Subtotal**                | **80** | Shared grade for entire team (with exceptions, see IoT Int. and Subsystem) |
| Peer & Self Assessment              | 10*    | Multiplier + direct points (see App Dev III formula)                       |
| **TOTAL**                           | **90** | Project Subtotal × Peer Factor + Peer Points                               |

## ❓FAQ

I may add more FAQ here if I get more questions:

:::{admonition} Question

**Q:** Our team needs more time! What should we do?

**A:** There are time slots you can book on Tuesday the 26th and Wednesday the 27th.
Message Vik or myself.

:::
