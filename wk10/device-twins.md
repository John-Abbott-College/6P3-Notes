# Device Twins
_Device twins_ are **JSON documents** that store device state information including metadata, configurations, and conditions.

Azure IoT Hub maintains a device twin for each device that you connect to IoT Hub.

Device twins store device-related information that:

-   Store device metadata from your solution back end.    

-   Report current state information such as available capabilities and conditions, for example, the connectivity method used, from your device app.

-   Synchronize the state of long-running workflows, such as firmware and configuration updates, between a device app and a back-end app.
-   Query your device metadata, configuration, or state.


Note that **Device Twins is not appropriate for high-frequency communication** such as sending telemetry data from device to cloud. For this, use D2C messages.

>Device twins are automatically created and deleted when a device identity is added or removed from the IoT Hub.

## Device Twin Anatomy

The device twin JSON document has the following structure:

-   **Device identity properties**. Read-only properties from the corresponding device identity stored in the [identity registry](https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-devguide-identity-registry).

-   **Tags**. The solution back end can read from and write to. Tags are not visible to device apps.

-   **Desired properties**. Used along with reported properties to synchronize device configuration or conditions. **The solution back end can set desired properties, and the device app can read them.** The device app can also receive notifications of changes in the desired properties.
   
-   **Reported properties**. Used along with desired properties to synchronize device configuration or conditions. **The device app can set reported properties, and the solution back end can read and query them.**
   

![Screenshot of device twin properties](https://docs.microsoft.com/en-us/azure/iot-hub/media/iot-hub-devguide-device-twins/twin.png)
<p class=img-info>
    <a href="https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-devguide-device-twins"> Structure of a Device Twin Json document </a>&nbsp; Understand and use device twins in IoT Hub.
</p>

> Notice how the back-end has **read/write access** to the *Desired* properties but only has **read access** to the *Reported* properties.
> 
> The inverse is true for the device app.


The following example shows a device twin JSON document:

```json
{
    "deviceId": "devA",
    "etag": "AAAAAAAAAAc=", 
    "status": "enabled",
    "statusReason": "provisioned",
    "statusUpdateTime": "0001-01-01T00:00:00",
    "connectionState": "connected",
    "lastActivityTime": "2015-02-30T16:24:48.789Z",
    "cloudToDeviceMessageCount": 0, 
    "authenticationType": "sas",
    "x509Thumbprint": {     
        "primaryThumbprint": null, 
        "secondaryThumbprint": null 
    }, 
    "version": 2, 
    "tags": {
        "$etag": "123",
        "deploymentLocation": {
            "building": "43",
            "floor": "1"
        }
    },
    "properties": {
        "desired": {
            "telemetryConfig": {
                "sendFrequency": "5m"
            },
            "$metadata" : {...},
            "$version": 1
        },
        "reported": {
            "telemetryConfig": {
                "sendFrequency": "5m",
                "status": "success"
            },
            "batteryLevel": 55,
            "$metadata" : {...},
            "$version": 4
        }
    }
}
```


## High-level Flow

The use of Device Twins typically involves the back-end application trying to update the state of a device.

In this case we have the following information flow:


1. A desired property is set by a back-end application into the IoT Hub.
2. The desired property is read by a device.
3. The device processes the desired property
4. The device sets a reported property into the IoT Hub.
5. The device's reported property is read by the back-end application.
 
> Notice that a tag can be set by a back-end application and is never sent to the device. Tags are used to organize and query devices.


![Information flow for a desired property change](assets/device-twins-desired-flow.png)
<p class=img-info>
    <a href="https://docs.microsoft.com/en-us/azure/iot-hub/tutorial-device-twins"> Information flow for a desired property change from a back-end app </a>&nbsp; Tutorial: Configure your devices from a back-end service.
</p>

## Desired Properties Example

Consider the property `telemetryConfig` which is used to configure telemetry collection on the device.

### Information Flow

**Step 1:** The solution back-end sets the desired property with the desired configuration value. Below is the portion of the document with the desired property:

```json
"desired": {
    "telemetryConfig": {
	    "sendFrequency": "5m"
    },
	... other properties and metadata if applicable ...
},
```


**Step 2a:** If the device is connected, it is notified of the change immediately.

**Step 2b:** If the device is not connected, the must follow the [device reconnection flow](https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-devguide-device-twins#device-reconnection-flow) to receive the full desired properties document and to subscribe to new notifications.

**Step 3:** the device processes the desired property according to the application logic.

**Step 4:** the device reports the updated configuration as a reported property (or an error condition using the `status` property). Below is the portion of the document with the reported property:

```json
"reported": {
    "telemetryConfig": {
        "sendFrequency": "5m",
        "status": "success"
    }
    ... other properties and metadata if applicable ...
}
```

**Step 5:** the back-end reads and tracks the results of the configuration operation. 

> Note that a back-end service can set and track device twin properties across many devices at once by [querying](https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-devguide-query-language) device twins (more on querying later).


### Device Implementation

> An excellent tutorial is provided in [Get started with device twins (Python) - Create the device app](https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-python-twin-getstarted#create-the-device-app)
> 
> Additionally, there are two examples in the Github repository:
> *azure-iot-sdk-python/azure-iot-device/samples/*[*sync-samples*](https://github.com/Azure/azure-iot-sdk-python/tree/main/azure-iot-device/samples/sync-samples)
> - [get_twin.py](https://github.com/Azure/azure-iot-sdk-python/blob/main/azure-iot-device/samples/sync-samples/get_twin.py "get_twin.py")
> - [update_twin_reported_properties.py](https://github.com/Azure/azure-iot-sdk-python/blob/main/azure-iot-device/samples/sync-samples/update_twin_reported_properties.py "update_twin_reported_properties.py")

#### Implementation Summary

1. Install the Azure IoT Hub Device SDK for Python:
```bash
pip install azure-iot-device
```

2. Import the class `IoTHubDeviceClient`
```python
from azure.iot.hub import IoTHubDeviceClient
```

3. Instantiate a `IoTHubDeviceClient` from the Device connection string and connect to the IoT Hub.
```python
device_client = IoTHubDeviceClient.create_from_connection_string(conn_str)
device_client.connect()
```

4. Get the Device Twin document from the device instance and parse it if connecting for the first time (see the [device reconnection flow](https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-devguide-device-twins#device-reconnection-flow)).
```python
twin = device_client.get_twin()
```

5. Define a callback function for newly received Device Twin updates (patches).
```python
def twin_patch_handler(twin_patch):
	print(f"Twin patch received: {twin_patch}")

device_client.on_twin_desired_properties_patch_received = twin_patch_handler
```

6. Prepare your Reported Properties dictionary and send it to the IoT Hub
```python
reported_patch = {"telemetry_interval": 20}
device_client.patch_twin_reported_properties(reported_patch)
```

7. Disconnect the client.
```python
device_client.shuthdown()
```


### Back-end Implementation

> An excellent tutorial is provided in [Get started with device twins (Python) - Create the service app](https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-python-twin-getstarted#create-the-service-app)

#### Shared Access Policy

The connection string required for the Device Twins back-end is specific to a shared access policy that has *Registry Read* and *Service Connect* permissions.

>This is not your Event Hub compatible endpoint connection string.

![](assets/device-twins-access-permission.png)


#### Implementation Summary

1. Install the Azure IoT Hub Service SDK for Python:
```bash
pip install azure-iot-hub
```

2. Import the classes `IoTHubRegistryManager`, `Twin` , and `TwinProperties`
```python
from azure.iot.hub import IoTHubRegistryManager
from azure.iot.hub.models import Twin, TwinProperties
```

3. Instantiate a `IoTHubRegistryManager` from the IoT Hub connection string and get the Device Twin reference from the device is:
```python
iothub_registry_manager = IoTHubRegistryManager(IOTHUB_CONNECTION_STRING)        twin = iothub_registry_manager.get_twin(DEVICE_ID)
```

4. Create a `TwinProperties` object with the `desired` attribute set to a dictionary of your desired properties.
```python
desired_properties= TwinProperties(desired={'fan_speed' : 3000, 'telemtry_interval': 5})
```

5. Create a Device Twin patch. A patch is a section of the Device Twin document that you want to update with your desired properties (created above).
	Note: You can also include any new Tags as a dictionary in this step.
```python
twin_patch = Twin(properties = desired_properties)
```

6. Send the Device Twin update
```python
twin = iothub_registry_manager.update_twin(DEVICE_ID, twin_patch)
```


## Query Language for Device Twins

IoT Hub provides a powerful SQL-like language to retrieve information about device twins.

> This query language is particularly useful for **back-end applications** when managing multiple devices.

To use queries inside a back-end application, importing the following classes:
```python
from azure.iot.hub.models import QuerySpecification, QueryResult
```

A query would then be performed in the following way:
```python
query_spec = QuerySpecification(query="SELECT * FROM devices WHERE tags.location.plant = 'Redmond43'")

query_result = iothub_registry_manager.query_iot_hub(query_spec, None, 100)
```


> The guide [IoT Hub query language for device and module twins, jobs, and message routing](https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-devguide-query-language) provides a detailed introduction to the query syntax.


You can experiment by using the *Queries* tool in the *Device Management* menu.

![](assets/device-twins-query-tool.png)


For example, to retrieve device twins located in the US and configured to send telemetry less than every minute, use the following query:
```sql
SELECT * FROM devices
  WHERE tags.location.region = 'US'
    AND properties.reported.telemetryConfig.sendFrequencyInSecs >= 60
```


For instance, to retrieve device twins that define the `connectivity` property use the following query:
```sql
SELECT * FROM devices
  WHERE is_defined(properties.reported.connectivity)
```


## References

Most of the content in this lesson was extracted from:
- [Understand and use device twins in IoT Hub](https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-devguide-device-twins) by Microsoft Docs.
- [Get started with device twins (Python)](https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-python-twin-getstarted) by Microsoft Docs.


### Video Reference

<iframe width="560" height="315" src="https://www.youtube.com/embed/D3LWBFegqF8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
