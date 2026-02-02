---
title: ReTerminal Kit
description: |
  List of hardware available for the course as well as their respective specifications and documentation.
date: 2026-02-01
blogpost: true
category: Hardware
tags: Hardware
location: Lecture
---

In this course, you are provided with a **reTerminal kit** containing hardware for experimenting with electrical devices on a portable Linux system.

This document will be a reference for any information you need to know about the various devices you have been provided.

## reTerminal

_Most of the information from the following sections was scraped from [@GettingStartedReTerminal2023]_

The [reTerminal](https://www.seeedstudio.com/ReTerminal-with-CM4-p-4904.html) is a
development board based on the Raspberry Pi Compute Module 4 (CM4) manufactured by Seeed
Studio.

> See [reTerminal Wiki page](https://wiki.seeedstudio.com/reTerminal/) for the complete specs
> and documentation

### Features

- Integrated modular design with high stability and expandability
- Powered by Raspberry Pi Computer Module 4 with 4GB RAM & 32GB eMMC
- 5-Inch IPS capacitive multi-touch screen at 1280 x 720 and 293 PPI
- Wireless connectivity with dual-band 2.4GHz/5GHz Wi-Fi and Bluetooth
  5.0 BLE
- High-speed expansion interface and rich I/O for more expandability
- Cryptographic co-processor with secure hardware-based key storage
- Built-in modules such as accelerometer, light sensor and RTC
- Gigabit Ethernet Port and Dual USB 2.0 Type-A ports
- 40-Pin header for IoT applications

See [Specifications](https://wiki.seeedstudio.com/reTerminal/#specifications) on the reTerminal wiki webpage for a complete table of device specifications.

### Chassis

The chassis of the reTerminal is the external "case" of the entire device.
The image below shows all of it features: a touch screen, buttons, LEDs, ports, and more.

:::{figure-md}

![](https://files.seeedstudio.com/wiki/ReTerminal/HW_overview.png)

The chassis of the reterminal CM4.

:::

### Motherboard

The "desktop" hardware of the reTerminal is shown in the figure below.
The usual desktop computer elements (CPU, RAM, Power, Ethernet, USB, etc.) are all here.

In addition, we can see reTerminal-specific features: touch screen interface, camera ports, an accelerometer, and more.

:::{figure-md}

![](https://files.seeedstudio.com/wiki/ReTerminal/hw-overview-internal-v1.3.jpg)

Motherboard diagram for the reTerminal CM4.

:::


### Compute Module 4

The
[raspberry pi Compute Module (CM) 4](https://www.raspberrypi.com/products/compute-module-4/?variant=raspberry-pi-cm4001000)
 made by the Raspberry Pi Foundation is the main computing device that powers the reTerminal.

:::{figure-md}

![](https://images.prismic.io/rpf-products/bfe15853-d10f-4ed9-b9f0-32540bd76e55_CM4%20Featured%20Image.jpg?ixlib=gatsbyFP&auto=compress%2Cformat&fit=max&q=50&w=600&h=400)

Raspberry PI CM 4

:::

RaspberryPi has published a very detailed [datasheet](https://datasheets.raspberrypi.com/cm4/cm4-datasheet.pdf) for the CM4 that we will refer to frequently in this course -- take a look!

### Pinout Diagram

The reTerminal offers a 40 pin interface for the GPIO ports of the raspberry pi CM4.
The "Pinout" diagram is a map indicating which port corresponds to which GPIO interface on the CM4.

:::{figure-md}

![](https://files.seeedstudio.com/wiki/ReTerminal/pinout-v2.jpg)

Pinout diagram for the reterminal CM4 GPIO ports.
Pay attention to the *orientation* of the reTerminal in
the above diagram.
The LCD and the onboard buttons are on the right-hand side of this image,
the back of reTerminal is on the left-hand side,
and the onboard buttons are on the top.

:::

### Block Diagram

We can also reTerminal features via a block diagram, shown below:

:::{figure-md}

![pir](https://files.seeedstudio.com/wiki/ReTerminal/reTerminal_block_diagram-v1.3.png)

Block diagram for the reTerminal,
indicating the communication protocols required for accessing each of the reTerminal features.
This diagram will be more useful once we study electronics communication protocols.

:::

## Grove Base Hat for Raspberry Pi

In a typical Raspberry Pi, sensors would be connected via the 40-pin GPIO.
To facilitate connections of the Grove sensors, this "Hat" (term for an add-on board of
the Raspberry Pi) includes the following types of connection:

- 6 Digital
- 4 Analog
- 3 I2C
- 1 PWM
- 1 UART

:::{figure-md}

![](https://files.seeedstudio.com/wiki/Grove_Base_Hat_for_Raspberry_Pi/img/main.jpg)

Grove Base Hat for GPIO connections

:::

See [Grove base hat Wiki](https://wiki.seeedstudio.com/Grove_Base_Hat_for_Raspberry_Pi/) for details.

## Power Supply for Raspberry Pi

The reTerminal requires a power supply that can provide a minimum of **3 Amps**.

:::{figure-md}

![](https://media.digikey.com/Photos/Raspberry%20Pi/MFG_RPI%20USB-C%20POWER%20SUPPLY%20BLACK%20US.jpg)

RPI power supply

:::

The official
[Raspberry Pi USB-C Power Supply](https://www.raspberrypi.com/products/type-c-power-supply/)
is included in your kit.

## Sensors

Sensors are devices that measure phenomenon in the external world.
We will work with many sensors in this course.

The sections below describe the sensors that are included in your reTerminal kit.

### AHT20 I2C Temperature & Humidity Sensor

The AHT20 is a combined temperature and humidity sensor that communicates over GPIO using the I2C protocol.

:::{figure-md}

![](https://files.seeedstudio.com/wiki/Grove-AHT20_I2C_Industrial_Grade_Temperature_and_Humidity_Sensor/101990644_4_.png)

AHT20 I2C temperature/humidity sensor

:::

See
[AHT20 I2C Industrial Grade Temperature & Humidity Sensor wiki](https://wiki.seeedstudio.com/Grove-AHT20-I2C-Industrial-Grade-Temperature&Humidity-Sensor/)
for details.

- Temperature measurement range -40 ~ 85°C, Humidity measurement range 0 ~ 100% RH.
- Digital output, Grove I2C interface.

## Actuators

**Actuators** are controllable devices that change phenomenon in the external world.
We will work with many actuators in this course.

The sections below describe the actuators that are included in your reTerminal kit.

### LED Socket

An LED in a removable socket with a potentiometer for power adjustment.
LED can be swapped with different colors.

::::{margin}
:::{figure-md}

![](https://files.seeedstudio.com/wiki/Raspi_wiki/img/red_led.jpg)

The LED socket actuator with a red LED in the socket.

:::
::::{margin}

See [LED wiki page](https://wiki.seeedstudio.com/Grove-Red_LED/) for details.

### Cooling Fan

5V Cooling Fan 40mm x 10mm with 2-pin JST connector.
See [product page here](https://abra-electronics.com/thermal-management/fans/dc-fans-5v/5v-cooling-fan-40mm-x-10mm.html).


::::{margin}

:::{figure-md}

![](https://abra-electronics.com/images/thumbnails/280/280/detailed/182/fan-3d-5v.png)

Cooling Fan

:::

::::

### Relay

A digital switch. Controls the on/off flow of electricity with a small digital signal.

- Operate voltage: 3.3V-5V
- Input current: 100mA
- Rated load: 5A@250VAC 5A@30VDC

::::{margin}
:::{figure-md}

![](https://files.seeedstudio.com/wiki/Grove-Relay/img/Twig-Relay.jpg)

Relay switch

:::
::::

See [relay wiki page](https://wiki.seeedstudio.com/Grove-Relay/) for details.

## Cables

The following cables are included in the base kit:

- [Grove Universal 4 Pin Buckled 5cm Cable](https://www.seeedstudio.com/Grove-Universal-4-Pin-Buckled-5cm-Cable-5-PCs-Pack.html).
- [Grove Universal 4 Pin Buckled 20cm Cable](https://www.seeedstudio.com/Grove-Universal-4-Pin-20cm-Unbuckled-Cable-5-PCs-Pack-p-749.html).
- [Grove 4 pin Female Jumper to Grove 4 pin Cable](https://www.seeedstudio.com/Grove-4-pin-Female-Jumper-to-Grove-4-pin-Conversion-Cable-5-PCs-per-PAck.html?queryID=7204536b9cc818771ed75f0d099829e7&objectID=2221&indexName=bazaar_retailer_products)
- [Grove 4 pin Male Jumper to Grove 4 pin Cable](https://www.seeedstudio.com/Grove-4-pin-Male-Jumper-to-Grove-4-pin-Conversion-Cable-5-PCs-per-Pack.html?queryID=9549a08ce2a46dc2ad12c0730ae087dd&objectID=1321&indexName=bazaar_retailer_products)
- 40-pin flat ribbon cable 20cm (female-female).
- [2-pin JST SM Plug](https://abra-electronics.com/interconnects/connectors/jst-connectors/sm/con-jst-sm-2a-2-pin-jst-sm-plug-receptacle-cable-set.html),
    one end open.
