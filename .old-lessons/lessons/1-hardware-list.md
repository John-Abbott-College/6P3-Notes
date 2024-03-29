# Hardware List
List of hardware available for the course as well as their respective specifications and documentation.

## Base Kit

### reTerminal
The [reTerminal](https://www.seeedstudio.com/ReTerminal-with-CM4-p-4904.html) is a development board based on the Raspberry Pi Compute Module 4 (CM4) manufactured by Seeed Studio.

![](assets/1-hardware-reterminal.png ':size=300')

Notable features:
-   Compute Module 4 with 4GB RAM & 32GB eMMC
-   5-Inch IPS capacitive multi-touch screen at 1280 x 720 and 293 PPI
-   Wireless connectivity with dual-band 2.4GHz/5GHz Wi-Fi and Bluetooth 5.0 BLE
-   Cryptographic co-processor with secure hardware-based key storage
-   Built-in modules such as accelerometer, light sensor, and RTC

> See [reTerminal Wiki page](https://wiki.seeedstudio.com/reTerminal/) for detailed specs and documentation

#### Power Supply
![RPI USB-C POWER SUPPLY BLACK US](https://media.digikey.com/Photos/Raspberry%20Pi/MFG_RPI%20USB-C%20POWER%20SUPPLY%20BLACK%20US.jpg ':size=250')
The reTerminal requires a power supply that can provide a minimum of 3 Amps.
The official [Raspberry Pi USB-C Power Supply](https://www.raspberrypi.com/products/type-c-power-supply/) in included in the kit.

### Compute Module 4
![](https://images.prismic.io/rpf-products/bfe15853-d10f-4ed9-b9f0-32540bd76e55_CM4%20Featured%20Image.jpg?ixlib=gatsbyFP&auto=compress%2Cformat&fit=max&q=50&w=600&h=400 ':size=300')
The [Compute Module 4](https://www.raspberrypi.com/products/compute-module-4/?variant=raspberry-pi-cm4001000) (CM4) made by the Raspberry Pi Foundation is powering the reTerminal.

Notable features:
- Processor: Broadcom BCM2711 quad-core Cortex-A72 (ARM v8) 64-bit SoC @ 1.5GHz

 > See [CM4 datasheet](https://datasheets.raspberrypi.com/cm4/cm4-datasheet.pdf) for details.

 See [Difference Between ARM64, ARMel, and ARMhf](https://linuxhint.com/about-arm64-armel-armhf/) for more info on the different ARM architectures.

#### Grove Base Hat for Raspberry Pi

![](https://files.seeedstudio.com/wiki/Grove_Base_Hat_for_Raspberry_Pi/img/main.jpg ':size=300')

In a typical Raspberry Pi, sensors would be connected via the 40-pin GPIO. 

To facilitate connections of the Grove sensors, this "Hat" (term for an add-on board of the Raspberry Pi) includes the following types of connection:
- 6 Digital  
- 4 Analog  
- 3 I2C  
- 1 PWM  
- 1 UART

> See [Grove base hat Wiki](https://wiki.seeedstudio.com/Grove_Base_Hat_for_Raspberry_Pi/) for details.




 ### Sensors

#### AHT20 I2C Temperature & Humidity
![](https://files.seeedstudio.com/wiki/Grove-AHT20_I2C_Industrial_Grade_Temperature_and_Humidity_Sensor/101990644_4_.png ':size=300')
See [AHT20 I2C Industrial Grade Temperature & Humidity Sensor wiki](https://wiki.seeedstudio.com/Grove-AHT20-I2C-Industrial-Grade-Temperature&Humidity-Sensor/) for details.
-   Temperature measurement range -40 ~ 85°C, Humidity measurement range 0 ~ 100% RH.
-   Digital output, Grove I2C interface.

**AHT20 Libraries**
The main module for this sensor is provided by Seeed in [this Github repository](https://github.com/Seeed-Studio/grove.py/blob/master/grove/grove_temperature_humidity_aht20.py) and can be installed with the `grove.py` library.

Follow official [Step by step installation](https://wiki.seeedstudio.com/Grove_Base_Hat_for_Raspberry_Pi/#installation) for python 3 (see below).
Don't use the one-click installation or it will install to the wrong location

```bash
git clone [https://github.com/Seeed-Studio/grove.py](https://github.com/Seeed-Studio/grove.py)
cd grove.py  
sudo pip3 install .
```

Alternatively, it's also possible to use Adafruit's `adafruit-circuitpython-ahtx0` library to communicate with the sensor (see [library's Pypi page](https://pypi.org/project/adafruit-circuitpython-ahtx0/)).
However, to instantiate the provided sensor class, you will need to pass it an I2C bus instance. To instantiate an I2C bus instance, install and use the `adafruit-extended-bus` library (see [Pypi page](https://pypi.org/project/adafruit-extended-bus/)).


 ### Actuators & Motors

#### LED Socketed

![](https://files.seeedstudio.com/wiki/Raspi_wiki/img/red_led.jpg ':size=300')

LED in a removable socket and potentiometer for power adjustment.
LED can be swapped with different colors.

See [LED wiki page](https://wiki.seeedstudio.com/Grove-Red_LED/) for details.


 #### Cooling Fan
 ![](https://abra-electronics.com/images/detailed/158/FAN-PI_1__lbhv-3b.jpg ':size=250')
 5V Cooling Fan 40mm x 10mm with 2-pin JST connector.
 - See [product page here](https://abra-electronics.com/thermal-management/fans/dc-fans-5v/5v-cooling-fan-40mm-x-10mm.html).


 #### Relay

![](1-hardware-relay.png ':size=300')

 A digital switch. Controls the on/off flow of electricity with a small digital signal.
-   Operate voltage: 3.3V-5V
-   Input current: 100mA
-   Rated load: 5A@250VAC 5A@30VDC

See [relay wiki page](https://wiki.seeedstudio.com/Grove-Relay/) for details.

### Cabling
The following cables are included in the base kit:

- [Grove Universal 4 Pin Buckled 5cm Cable](https://www.seeedstudio.com/Grove-Universal-4-Pin-Buckled-5cm-Cable-5-PCs-Pack.html).
- [Grove Universal 4 Pin Buckled 20cm Cable](https://www.seeedstudio.com/Grove-Universal-4-Pin-20cm-Unbuckled-Cable-5-PCs-Pack-p-749.html).
- [Grove 4 pin Female Jumper to Grove 4 pin Cable](https://www.seeedstudio.com/Grove-4-pin-Female-Jumper-to-Grove-4-pin-Conversion-Cable-5-PCs-per-PAck.html?queryID=7204536b9cc818771ed75f0d099829e7&objectID=2221&indexName=bazaar_retailer_products)
- [Grove 4 pin Male Jumper to Grove 4 pin Cable](https://www.seeedstudio.com/Grove-4-pin-Male-Jumper-to-Grove-4-pin-Conversion-Cable-5-PCs-per-Pack.html?queryID=9549a08ce2a46dc2ad12c0730ae087dd&objectID=1321&indexName=bazaar_retailer_products)
- 40-pin flat ribbon cable 20cm (female-female).
- [2-pin JST SM Plug](https://abra-electronics.com/interconnects/connectors/jst-connectors/sm/con-jst-sm-2a-2-pin-jst-sm-plug-receptacle-cable-set.html), one end open.