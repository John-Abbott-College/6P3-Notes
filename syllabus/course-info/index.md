---
title: Course Info
description: |
  Course description outlining goals, expectations, resources, and other
  important information.
date: 2026-01-01
---

## Logistics

:::{list-table}

* - **Instructor**
  - Michael Haaf
* - **Office**
  - - Penfield 311
    - Mon/Fri 11:00 - 12:30pm or so
* - **Contact**
  - - Email: <michael.haaf@johnabbott.qc.ca>
    - Teams: [by appointment](example.org)
* - **Websites**
  - - Course content: <https://john-abbott-college.github.io/6P3-Notes>
    - GitHub organization: [420-6P3-W26](https://github.com/420-6P3-W26)
    - GitHub classroom: [420-6P3-W26](https://classroom.github.com/classrooms/248563544-420-6p3-w26)

:::

### Communication

- Teams - For communicating (fastest, most reliable that I will check it
  same-day)
- MIO - For communicating (non-time-critical)
- Email - For communicating (time-critical). Will aim for <24hr response.

## Assessments

- 45% Assignments and Labs
- 20% Test (first week of May)
- 35% Project Milestones

```{mermaid}
:class: col-page-right

flowchart LR

    subgraph Labs
      direction TB
      L01[L1: Developer Environment Setup]
      L02[L2: Bash Mash]
      L03[L3: reTerminal built-in devices]
      L04[L4: Digital devices]
      L05[L5: PWM and Analog devices]
      L06[L6: IoT Communication Protocols]
      L07[L7: Serial devices: Basic]
      L08[L8: Serial devices: Advanced]
      L09[L9: Asynchronous Programming]
      L10[L10: Microsoft Azure SDK]
      L11[L11: Device calibration]
    end

    subgraph Assignments
      direction TB
      A1[A1: reTerminal Control Center]
      A2[A2: Azure IoT Hub]

      L03-->A1
      L04-->A1
      L05-->A1

      L06-->A2
      L07-->A2
      L08-->A2
      L09-->A2
      L10-->A2
    end

    subgraph Project
      direction TB
      M1[M1: Project setup]
      M2[M2: Project proposal]
      M3[M3: App Design]
      M4[M4: Subsystem implementations]
      M5[M5: IoT Hub App integration]
      M6[M6: Final Presentation]
      M7[M7: Project wrap-up]

      A1 --> M4
      A2 --> M5
    end

```

## Course material

There are no required textbooks for this course -- this website will contain all
of the content that you need to complete course deliverables. Additionally, each
lecture will contain references to additional resources for exploring each topic
in further detail beyond the scope of the course.
