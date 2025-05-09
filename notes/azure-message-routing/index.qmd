---
title: Message Routing
subtitle: "How to specify custom endpoints for azure messages"
date: 2025-05-08
categories: [iot]
---

It is possible to route messages to different end-points according to the type of message and the content of the message.


Message routing involves the following steps:

1. Create a custom endpoint (if not using the built-in  `events` endpoint which catches all events).
	- Choose between Storage or Event Hubs (the Service Buses are not covered in this course).
	- Create a Storage account if necessary.
2. Add a new route and associate it with the endpoint created above.
3. Set a routing query that will "catch" the message into the route.
	- The default routing query is `true`, which matches all messages.

::: {#fig-message-routing .column-margin}

![](assets/storage-message-routing.png)

The IoT Hub setting for configuring message routing on the Azure portal.

:::

 > See **[Azure Storage as a routing endpoint](https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-devguide-messages-d2c#azure-storage-as-a-routing-endpoint)** for details on how to to configure an endpoint with a storage account.
 > 
 > Additionally, you can follow the tutorial [**Set up message routing**](https://docs.microsoft.com/en-us/azure/iot-hub/tutorial-routing#set-up-message-routing) for a step by step guide.
 >- Skip the steps for the Service Buses (not covered in this course).


## Free Account Limitation

Unfortunately the free tier of the IoT Hub is limited to **only one additional endpoint** (see [Quotas and throttling](https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-devguide-quotas-throttling)).

In this lesson we will create and delete multiple endpoints to illustrate their capabilities.


## Routing Queries

A message event can be routed according to its type. Messages can be of the following types:

- device life-cycle events,
- device telemetry messages,
- device twin change events.

For telemetry messages, it's possible to query on:
- System properties,
- Application properties,
- Message body.

> See [**Create and read IoT Hub messages**](https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-devguide-messages-construct#system-properties-of-d2c-iot-hub-messages) for a list of message properties.


Consider the following message:

```json
{ 
  "message": { 
    "systemProperties": { 
      "contentType": "application/json", 
      "contentEncoding": "UTF-8",
      "iothub-connection-device-id": "myDevice-1"
      "iothub-message-source": "deviceMessages", 
      "iothub-enqueuedtime": "2017-05-08T18:55:31.8514657Z" 
    }, 
    "appProperties": { 
      "processingPath": "{cold | warm | hot}", 
      "verbose": "{true, false}", 
      "severity": 1-5, 
      "testDevice": "{true | false}" 
    }, 
    "body": "{\"Weather\":{\"Temperature\":50}}" 
  } 
} 
```

This message includes system properties, application properties and a body (payload).

To query on the application property `processingPath` and the system property `iothub-connection-device-id` we would write the following query:

```sql
processingPath = 'hot' AND $connectionModuleId = 'myDevice-1'
```

> See [**IoT Hub message routing query syntax**](https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-devguide-routing-query-syntax#main) for the query syntax and examples.


Note that in order for the message body to be stored in plain text, the following properties must be set on the message prior to sending the message:

```json
"contentType": "application/json", 
"contentEncoding": "UTF-8"
```

With the Python SDK, these properties would be set with:

```python
msg = Message(payload)
msg.content_encoding = 'utf-8'
msg.content_type = 'application/json'
```

