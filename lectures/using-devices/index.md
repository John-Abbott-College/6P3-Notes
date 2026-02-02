---
title: Using devices
description: |
  TODO
date: 2026-03-01
blogpost: true
location: Lecture
category: Hardware
tags: Hardware
---

## TODO

todo

## Sensors

### AHT20 Libraries

TODO: these notes are incorrect, but could serve as a useful template for a device reference.

The main module for this sensor is provided by Seeed in
[this Github repository](https://github.com/Seeed-Studio/grove.py/blob/master/grove/grove_temperature_humidity_aht20.py)
and can be installed with the `grove.py` library.

Follow official
[Step by step installation](https://wiki.seeedstudio.com/Grove_Base_Hat_for_Raspberry_Pi/#installation)
for python 3 (see below). Don't use the one-click installation or it will install to the
wrong location

```bash
git clone [https://github.com/Seeed-Studio/grove.py](https://github.com/Seeed-Studio/grove.py)
cd grove.py
sudo pip3 install .
```

Alternatively, it's also possible to use Adafruit's `adafruit-circuitpython-ahtx0` library
to communicate with the sensor (see
[library's Pypi page](https://pypi.org/project/adafruit-circuitpython-ahtx0/)). However,
to instantiate the provided sensor class, you will need to pass it an I2C bus instance. To
instantiate an I2C bus instance, install and use the `adafruit-extended-bus` library (see
[Pypi page](https://pypi.org/project/adafruit-extended-bus/)).
