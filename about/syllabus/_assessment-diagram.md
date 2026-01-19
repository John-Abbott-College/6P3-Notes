```{mermaid}

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
