# Using EventHubs with .NET

By default, Device to Cloud (D2C) messages are exposed to external applications via the build-in endpoints of the IoT Hub.

The IoT Hub is also an instance of an Azure EventHub, and thus, the Azure EventHub SDK is used to ready D2C messages.

> For overview of what is an EventHub and its terminology, refer to:
> [**Features and terminology in Azure Event Hubs**](https://docs.microsoft.com/en-us/azure/event-hubs/event-hubs-features) 


## Classes for Reading Messages

There are two classes provided for reading EventHub Messages:

- `EventProcessorClient` included in the `Azure.Messaging.EventHubs.Processor` package.
	- Supports reading events from all partitions with the call-back methods `ProcessEventAsync` and `ProcessErrorAsync` (recommended for production).
	
- `EventHubConsumerClient` included in the `Azure.Messaging.EventHubs` package.
	- Supports reading events from a single partition with the method `ReadEventsFromPartitionAsync` (suitable for production).
	- Supports reading from all partitions with the method `ReadEventsAsync` (not recommended for production).


## References & Samples

Below are the references for both packages mentioned above:

| Nuget Package  | Reference | Samples |
| ------- | -----  | ---- |
| [Azure.Messaging.EventHubs](https://www.nuget.org/packages/Azure.Messaging.EventHubs)                     | [API Reference for Azure.Messaging.EventHubs](https://docs.microsoft.com/dotnet/api/azure.messaging.eventhubs?view=azure-dotnet)           | [Samples for Azure.Messaging.EventHubs](https://github.com/Azure/azure-sdk-for-net/tree/main/sdk/eventhub/Azure.Messaging.EventHubs/samples) |
| [Azure.Messaging.EventHubs.Processor](https://www.nuget.org/packages/Azure.Messaging.EventHubs.Processor) | [API Reference for Azure.Messaging.EventHubs.Processor](https://docs.microsoft.com/dotnet/api/azure.messaging.eventhubs?view=azure-dotnet) | [Samples for Azure.Messaging.EventHubs.Processor](https://github.com/Azure/azure-sdk-for-net/tree/main/sdk/eventhub/Azure.Messaging.EventHubs.Processor/samples) |


When going through the sample code, the following order is recommended:

1. `EventProcessorClient`
	1. [Sample01_HelloWorld.md](https://github.com/Azure/azure-sdk-for-net/blob/main/sdk/eventhub/Azure.Messaging.EventHubs.Processor/samples/Sample01_HelloWorld.md)
	2. [Sample04_ProcessingEvents.md](https://github.com/Azure/azure-sdk-for-net/blob/main/sdk/eventhub/Azure.Messaging.EventHubs.Processor/samples/Sample04_ProcessingEvents.md)

2. `EventHubConsumerClient`
	1. [Sample01_HelloWorld.md](https://github.com/Azure/azure-sdk-for-net/tree/main/sdk/eventhub/Azure.Messaging.EventHubs/samples)
	2. [Sample05_ReadingEvents.md](https://github.com/Azure/azure-sdk-for-net/tree/main/sdk/eventhub/Azure.Messaging.EventHubs/samples)

3. Run the "Quickstart" code [Read device-to-cloud messages](https://github.com/Azure-Samples/azure-iot-samples-csharp/tree/main/iot-hub/Quickstarts/ReadD2cMessages)


## Cancellation Tokens

Many of examples listed above make use of Cancellation Tokens to manage Tasks.

> To learn more about Cancellation Tokesn, see:
> [How to use CancellationTokens to cancel tasks in the Azure SDK for .NET](https://devblogs.microsoft.com/azure-sdk/how-to-use-cancellationtokens-to-cancel-tasks-in-the-azure-sdk-for-net/)

