# Publish to data topic (fire & forget)

from paho.mqtt import client as mqtt
from mock_thermostat import Thermostat
import json

common_key = 'd5a4d5e6-d597'
light_topic_name = common_key + '/lights/bedroom'
temp_topic_name = common_key + '/temp'
client_name = common_key + 'publisher'


def on_connect(client, userdata, flags, rc):
    print("MQTT connected!")


def on_message(client, userdata, message: mqtt.MQTTMessage):
    print(f"Received from {message.topic}: {message.payload}")


mqtt_client = mqtt.Client(client_name)
mqtt_client.on_connect = on_connect
mqtt_client.on_message = on_message

mqtt_client.connect('test.mosquitto.org')
mqtt_client.loop_start()
mqtt_client.subscribe(light_topic_name)

thermo = Thermostat()

while True:
    temp_str = input("Please set new temperature: ")
    payload = json.dumps({'temperature': temp_str})
    info = mqtt_client.publish(temp_topic_name, payload)