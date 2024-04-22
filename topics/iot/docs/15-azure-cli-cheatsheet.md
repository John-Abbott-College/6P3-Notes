---
title: Azure CLI Cheatsheet
subtitle: "References for useful Azure CLI commands and concepts"
date: 2024-04-22
---

Most of these commands were obtained from *[Quickstart: Send telemetry from a device to an IoT hub and monitor it with the Azure CLI](https://learn.microsoft.com/en-us/azure/iot-hub/quickstart-send-telemetry-cli)*, which we did in Lab 6 of this course.

> Reminder: there are several options for using Azure CLI: 
>
>  - you can install it on your reTerminal via `apt`,
>  - on your developer workstation, or
>  - on your VSCode via the Azure IoT Hub extension,
>  - you can use it on the Azure browser via the Cloud Shell.
>
>  You may find all four options useful, depending on what part of your system you are working on. See [the Intro to Azure](/topics/iot/docs/intro-azure-iot.qmd) course notes on the subject for more info to get Azure CLI set up.

## Connection Strings

### IoT Hub

See detailed documentation at [az iot hub connection-string](https://learn.microsoft.com/en-us/cli/azure/iot/hub/connection-string?view=azure-cli-latest)

#### IoT Hub Service String

Recommended level of access for external applications:

```sh
az iot hub connection-string show --policy-name service --hub-name {YourIoTHubName} --output table
```

#### IoT Hub Owner String

Be advised: this connection string provides the highest level of access.
```sh
az iot hub connection-string show --hub-name {YourIoTHubName}
```

#### EventHub Compatible String

Show the eventhub compatible connection string of the given IoT Hub's default eventhub:
```sh
az iot hub connection-string show -n MyIotHub --default-eventhub
```

### Device Strings

Manage IoT device's connection string with [az iot hub device-identity connection-string show](https://learn.microsoft.com/en-us/cli/azure/iot/hub/device-identity/connection-string?view=azure-cli-latest#az-iot-hub-device-identity-connection-string-show)

```sh
az iot hub device-identity connection-string show --device-id {YourDevice} --hub-name [YourIotHubName}
```

## Simulating a Device

```sh
az iot device simulate -d simDevice -n {YourIoTHubName}
```

By default, this command will:

- Send D2C messages with a payload of `Ping from Az CLI IoT Extension`
- Automatically receive and acknowledge C2D messages.

See `az iot device simulate` [documentation for details](https://learn.microsoft.com/en-us/cli/azure/iot/device?view=azure-cli-latest#az-iot-device-simulate).

## Messages

### Monitor C2D Messages

List all message details for all devices.

```sh
az iot hub monitor-events --output table -p all -n {YourIoTHubName}
```

List message details for a specific device:

```sh
az iot hub monitor-events --output table --device-id {YourDevice} --hub-name {YourIoTHubName}
```

### Send C2D Message

Includes custom key, value properties. [See documentation](https://learn.microsoft.com/en-us/cli/azure/iot/device/c2d-message?view=azure-cli-latest#az-iot-device-c2d-message-send). 

```sh
az iot device c2d-message send -d simDevice --data "Hello World" --props "key0=value0;key1=value1" -n {YourIoTHubName}
```

## Direct Methods

### Invoke Direct Method on Device

```sh
az iot hub invoke-device-method --mn MySampleMethod -d simDevice -n {YourIoTHubName}
```
