# Azure IoT SDKs

Azure offers Software Development Kits (SDKs) for most of its services.
Below you will find references to the SDKs used in the course.

>  A **software development kit (SDK)** is a programming "package" that facilitates the development of an applications for a specific platform, vendor or technology.
>  
>  Typically a SDK includes one or more APIs, programming tools, and documentation.


## Azure IoT SDKs


Azure IoT provides SDKs for several languages such as Python, Java, .NET, C and Node.js.

The SDKs are organized as:

- **Device SDKs**
	- Functionality to build **device clients** that communicate with and are controlled by an **IoT Hub**.
	
- **Service SDKs**
	- Functionality for **applications and services** that communicate with an **IoT Hub and registered devices**.
	- Examples are a back-end service running on a VM or a mobile application.
	
- **IoT Hub Management SDKs**
	- Help build back-end applications that manage an IoT Hub.


>Remember that the IoT Hub is only managing the device registration, authentication and routing of messages and data.
>
>The application logic and device control is typically done by a **back-end** service and **user applications** using data routed via the IoT Hub's end-points.


![](assets/iot-hub-architecture.svg)
*Azure IoT SDKs provide tooling and examples to develop devices, service applications and to manage the IoT Hub itself.*


## Device SDKs

| Language | Package                                                                | Source                                                  | Quickstarts                                                                                                                                    | Samples                                                                                  | Reference Docs                                                                                             | 
| -------- | ---------------------------------------------------------------------- | ------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| .NET     | [NuGet](https://www.nuget.org/packages/Microsoft.Azure.Devices.Client) | [GitHub](https://github.com/Azure/azure-iot-sdk-csharp) | [Connect to IoT Hub](https://learn.microsoft.com/en-us/azure/iot-develop/quickstart-send-telemetry-iot-hub?pivots=programming-language-csharp) | [Samples](https://github.com/Azure/azure-iot-sdk-csharp/tree/main/iothub/device/samples) | [Reference](https://learn.microsoft.com/en-us/dotnet/api/microsoft.azure.devices.client?view=azure-dotnet) |
| Python   | [pip](https://pypi.org/project/azure-iot-device/)                      | [GitHub](https://github.com/Azure/azure-iot-sdk-python) | [Connect to IoT Hub](https://learn.microsoft.com/en-us/azure/iot-develop/quickstart-send-telemetry-iot-hub?pivots=programming-language-python) | [Samples](https://github.com/Azure/azure-iot-sdk-python/tree/main/samples)               | [Reference](https://learn.microsoft.com/en-us/python/api/azure-iot-device/?view=azure-python)              |
 	 	 	 	 	

Device SDKs are further divided into:

1. **Provisioning**

	- How to provision (eg. create) a device identity on the Azure IoT Hub.

2. **Device Client**

	- Devices that send telemetry messages to Azure IoT Hub
	- Devices that receive Cloud-to-Device (C2D) messages from the Azure IoT Hub.
	- Devices that receive and respond to direct method invocations from the Azure IoT Hub.

3. **Module Client**

	- Mostly intended for communicating with Edge devices (**not covered in this course**). See [here](https://azure.microsoft.com/en-us/services/iot-edge/#iotedge-overview) for more.

#### Python Notes

By default, the Python device SDKs connect to an IoT Hub over MQTT with:

- **CleanSession** flag set to **0**
- **QoS 1** for message exchange with the IoT hub.

It's possible to connect a generic MQTT client (ex.: the `paho-mqtt` client) to the IoT Hub. For a manual MQTT connection, see [Communicate with your IoT hub using the MQTT protocol](https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-mqtt-support#main).


## Service SDKs

| Language | Package                                                                | Source                                                  | Samples                                                                                   | Reference Docs                                                                                      |
| -------- | ---------------------------------------------------------------------- | ------------------------------------------------------- | ----------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| .NET     | [NuGet](https://www.nuget.org/packages/Microsoft.Azure.Devices.Client) | [GitHub](https://github.com/Azure/azure-iot-sdk-csharp) | [Samples](https://github.com/Azure/azure-iot-sdk-csharp/tree/main/iothub/service/samples) | [Reference](https://learn.microsoft.com/en-us/dotnet/api/microsoft.azure.devices?view=azure-dotnet) |
| Python   | [pip](https://pypi.org/project/azure-iot-hub/)                         | [GitHub](https://github.com/Azure/azure-iot-hub-python) | [Samples](https://github.com/Azure/azure-iot-hub-python/tree/main/samples)                | [Reference](https://learn.microsoft.com/en-us/python/api/azure-iot-hub/?view=azure-python)          |


### Registry Manager

Some SDKs include an  **IoT Hub Registry Manager** service client in order to:

-   Provides CRUD operations for device on IoTHub
-   Get statistics about the IoTHub service and devices

Since this is a SDK to manage a cloud service (IoT Hub), it assumes bandwidth is not constrained and most calls are made over HTTPS.


### Event Hubs Service SDK

> Behind the scenes, IoT Hubs is an instance of another Azure service called [Event Hubs](https://docs.microsoft.com/en-us/azure/event-hubs/event-hubs-about).

Event Hubs is a highly scalable publish-subscribe service that can ingest millions of events per second and stream them to multiple destinations (clients and services).

Azure provides a Python SDK for publishing and consuming Event Hubs events. These events include device telemetry, state changes, new device registrations, etc.

| Language | Package | Samples                                                                                                                                                                                          | Reference Docs                                                                                                  |
| -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------- |
| Python   | [pip](https://pypi.org/project/azure-eventhub/) | [Use EventHubConsumerClient to work with IoT Hub](https://learn.microsoft.com/en-us/python/api/overview/azure/eventhub-readme?view=azure-python#use-eventhubconsumerclient-to-work-with-iot-hub) | [Reference Docs](https://learn.microsoft.com/en-us/python/api/overview/azure/eventhub-readme?view=azure-python) | 

Details on the `azure.eventhub` package API can be found [here](https://azuresdkdocs.blob.core.windows.net/$web/python/azure-eventhub/latest/azure.eventhub.html#).
*More on Event Hubs in a later chapter.*


## IoT Hub Management

| Platform | Package                                                               | Code repository                                                                                | Reference                                                                                                     |
| -------- | --------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| .NET     | [NuGet](https://www.nuget.org/packages/Azure.ResourceManager.IotHub/) | [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/main/sdk/iothub)                      | [Reference](https://learn.microsoft.com/en-us/dotnet/api/microsoft.azure.management.iothub?view=azure-dotnet) |
| Python   | [pip](https://pypi.org/project/azure-mgmt-iothub/)                    | [GitHub](https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/iothub/azure-mgmt-iothub) | [Reference](https://learn.microsoft.com/en-us/python/api/azure-mgmt-iothub/?view=azure-python)                |


## Browse Code Samples

In addition to the sample code provided in each of the SDK's repositories, Azure also offers a catalogue of code samples for different  types of Azure services:

- [Browse Azure Code Samples](https://learn.microsoft.com/en-us/samples/browse/?products=dotnet%2Cazure%2Cvs-code&terms=iot)
