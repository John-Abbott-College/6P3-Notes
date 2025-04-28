---
title: Azure SDKs in Python and C#
subtitle: |
  Azure Libraries in Python and C#
  Installation instructions for WSL,
  how to use the libraries in your code.
date: 2025-04-21
categories: [python, iot]
---

Azure offers Software Development Kits (SDKs) for most of its services. Below
you will find references to the SDKs used in the course.

> A **software development kit (SDK)** is a programming "package" that
> facilitates the development of an applications for a specific platform, vendor
> or technology.
>
> Typically a SDK includes one or more APIs, programming tools, and
> documentation.

## Azure IoT SDKs

Azure IoT provides SDKs for several languages such as Python, Java, .NET, C and
Node.js.

::: {#fig-iot-hub-architecture .column-margin}

![](assets/iot-hub-architecture.svg)

Azure IoT SDKs provide tooling and
examples to develop devices, service applications and to manage the IoT Hub
itself.

:::

There are a few categories of SDKs to know, which are managed and packaged separately:

Device SDKs
: Functionality to build **device clients** that communicate with and are controlled by an **IoT Hub**.

Service SDKs
: Functionality for **applications and services** that communicate with an **IoT Hub and registered devices**. Examples are a back-end service running on a VM or a mobile application.

IoT Hub Management SDKs
: Help build back-end applications that manage an IoT Hub.

::: {.callout-note}
Remember that the IoT Hub is only managing the device registration,
authentication and routing of messages and data.

The application logic and device control is typically done by a **back-end**
service and **user applications** using data routed via the IoT Hub's
end-points.
:::


## SDKs by language

::: {.panel-tabset}

## Python

Packages (pip)
: Device: [azure-iot-device](https://pypi.org/project/azure-iot-device/)
: Service: [azure-iot-hub](https://pypi.org/project/azure-iot-hub/)
: IoTHub Management: [azure-mgmt-iothub](https://pypi.org/project/azure-mgmt-iothub/)

Source (GitHub)
: Device: [azure/azure-iot-sdk-python](https://github.com/Azure/azure-iot-sdk-python)
: Service: [azure/azure-iot-hub-python](https://github.com/Azure/azure-iot-hub-python/)
: IoTHub Management: [azure/azure-sdk-for-python](https://github.com/Azure/azure-sdk-for-python)

Tutorials
: All: [Connect to IoT Hub (Python)](https://learn.microsoft.com/en-us/azure/iot-develop/quickstart-send-telemetry-iot-hub?pivots=programming-language-python)

Examples
: Device: [azure-iot-sdk-python/samples](https://github.com/Azure/azure-iot-sdk-python/tree/main/samples)
: Service: [azure-iot-hub-python/samples](https://github.com/Azure/azure-iot-hub-python/tree/main/samples)

Reference
: Device: [learn.microsoft.com](https://learn.microsoft.com/en-us/python/api/azure-iot-device/?view=azure-python)
: Service: [learn.microsoft.com](https://learn.microsoft.com/en-us/python/api/azure-iot-hub/?view=azure-python)
: IoTHub Management: [learn.microsoft.com](https://learn.microsoft.com/en-us/python/api/azure-mgmt-iothub/?view=azure-python)

## C\#

Package (NuGet)
: Device: [Microsoft.Azure.Devices.Client](https://www.nuget.org/packages/Microsoft.Azure.Devices.Client)
: Service: [Microsoft.Azure.Devices](https://www.nuget.org/packages/Microsoft.Azure.Devices.Client)
: IoTHub Management: [Azure.ResourceManager.IotHub](https://www.nuget.org/packages/Azure.ResourceManager.IotHub/)

Source (GitHub)
: Device/Service: [azure/azure-iot-sdk-csharp](https://github.com/Azure/azure-iot-sdk-csharp) 
: IoTHub Management: [azure/azure-iot-for-net](https://github.com/Azure/azure-sdk-for-net/tree/main/sdk/iothub)

Tutorials
: All: [Connect to IoT Hub (C#)](https://learn.microsoft.com/en-us/azure/iot-develop/quickstart-send-telemetry-iot-hub?pivots=programming-language-csharp) 

Examples
: Device: [azure-iot-sdk-csharp/iothub/device/samples](https://github.com/Azure/azure-iot-sdk-csharp/tree/main/iothub/device/samples) 
: Service: [azure-iot-sdk-csharp/iothub/service/samples](https://github.com/Azure/azure-iot-sdk-csharp/tree/main/iothub/service/samples)

Reference
: Device/Service: [learn.microsoft.com](https://learn.microsoft.com/en-us/dotnet/api/microsoft.azure.devices.client?view=azure-dotnet) 
: IoTHub management: [learn.microsoft.com](https://learn.microsoft.com/en-us/dotnet/api/microsoft.azure.management.iothub?view=azure-dotnet) 

:::

## Installing `dotnet` on developer environment

### WSL

These instructions were adatped from [learn.microsoft.com](https://learn.microsoft.com/en-us/dotnet/core/install/linux-debian?tabs=dotnet8#dependencies)
-- see the linked document for more details if you run into issues.

```bash
# Update system
$ sudo apt update && sudo apt upgrade -y

# Install required dependencies
$ sudo apt install libc6 libgcc-s1 libgssapi-krb5-2 libicu72 libssl3 libstdc++6 zlib1g

# Add dotnet repository to debian package manager
wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

# Install .NET 8
sudo apt update && sudo apt install -y dotnet-sdk-8.0

# Verify .NET8 installed
dotnet --version
```

#### Setup tab completions using `.bashrc`

To get tab completions set up for `dotnet`, add the following snippet to your `.bashrc`:

```bash

function _dotnet_bash_complete()
{
  local cur="${COMP_WORDS[COMP_CWORD]}" IFS=$'\n' # On Windows you may need to use use IFS=$'\r\n'
  local candidates
  read -d '' -ra candidates < <(dotnet complete --position "${COMP_POINT}" "${COMP_LINE}" 2>/dev/null)
  read -d '' -ra COMPREPLY < <(compgen -W "${candidates[*]:-}" -- "$cur")
}

complete -f -F _dotnet_bash_complete dotnet
```

See [learn.miscrosoft.com](https://learn.microsoft.com/en-us/dotnet/core/tools/enable-tab-autocomplete#bash)
for more details.

### OSX

Try the instructions here <https://learn.microsoft.com/en-us/dotnet/core/install/macos>

NOTE: I haven't tested these instructions myself.


