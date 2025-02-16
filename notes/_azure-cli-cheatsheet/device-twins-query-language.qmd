## Query Language for Device Twins

IoT Hub provides a powerful SQL-like language to retrieve information about device twins.

> This query language is particularly useful for **back-end applications** when managing multiple devices.

To use queries inside a back-end application, import the following classes.
```python
from azure.iot.hub.models import QuerySpecification, QueryResult
```

A query would then be performed in the following way.
```python
query_spec = QuerySpecification(query="SELECT * FROM devices WHERE tags.location.plant = 'Redmond43'")

query_result = iothub_registry_manager.query_iot_hub(query_spec, None, 100)
```


> The guide [IoT Hub query language for device and module twins, jobs, and message routing](https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-devguide-query-language) provides a detailed introduction to the query syntax.


You can experiment by using the *Queries* tool in the *Device Management* menu.

![](assets/17-device-twins-query-tool.png)


For example, to retrieve device twins located in the US and configured to send telemetry greater than or equal to every minute, use the following query:
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