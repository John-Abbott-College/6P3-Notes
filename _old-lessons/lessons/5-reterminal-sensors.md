# Using reTerminal's Sensors


## reTerminal connection w/ hostname

During lab 1, you could connect to the reTerminal via SSH using two "addresses":

- Device's IP address.
- Device's hostname (*eg. my-pi.local*)

> If you use the **hostname**, you don't need to know the device's IP address, which can change every time you connect to the network.
> 
> - Hostnames **must be unique**, otherwise you might connect to the wrong device.


## Raspberry Pi OS and Debian

The Raspberry Pi OS (previously called *Raspbian OS*) used in the reTerminal is a variation of the **Debian OS**, with optimizations for the Raspberry Pi hardware.

> **Debian OS** is the base Linux system for many other distributions such as:
> - Ubuntu, Mint, PopOS, KDE, etc.


Many of the commands and configuration for Raspberry Pi OS can be taken directly from Debian's documentation.


## Package Managers

### Apt: Debian Package Manger

During [Lab 1](https://docs.google.com/document/d/1bCz4dMqU0cIyYCnULchFBm_1WU4uRC4tVO-DC2QWZ3U/edit?usp=sharing), you updated, upgraded and installed some packages in the Raspberry Pi OS using the **apt command**


For example:

| Command                 | Description                                                        |
| ----------------------- | ------------------------------------------------------------------ |
| `sudo apt update`       | Update all packages within the same major version (eg v2.1 -> v2.2) |
| `sudo apt full-upgrade` | Upgrade major versions of all packages (eg. v2.1 -> v3.0)          |
| `sudo apt install vim`  | Install package Vim                                                |


The command `apt` is the default package manager of Debian.

> A **package manager** is a software tool responsible for automating the installation, removal, configuration and removal of computer programs.


Managing packages could technically be done manually, however, it is very time consuming and error prone: tracking package dependencies and compatibility with the current system. 

Note: `apt` is a newer package manager API meant to replace the older API  `apt-get`. However, they both accomplish the same. See [Debian docs](https://www.debian.org/doc/manuals/debian-handbook/sect.apt-get.en.html) for details.


### Pip: Python Package Manager

[`pip`](https://pip.pypa.io/en/stable/) is python's own package manager, which is independent from `apt`. 

> Pip installs packages from the [Python Package Index repository (pypi.org)](https://pypi.org/)

To use it for python 3, call the command `pip3`

```bash
pip3 install emoji
```

This will install the a python library emoji which will create emoji from text descriptions.

> Note: it is not recommended that you run `pip` as `sudo` because `pip` could overwrite system files that are managed by `apt`.


Once a python module has been installed, it is available to be imported in your python script:

```python
import emoji

message = emoji.emojize('Howdy :sun_with_face:')
print(message)
```

Output:

```bash
Howdy 🌞
```

It is also possible to give an alias to the newly imported module:

```python
import emoji as em

message = em.emojize('Howdy :sun_with_face:')
print(message)
```

Finally, you can import only a specific function and give it an alias:

```python
from emoji import emojize as emz
message = emz('Howdy :sun_with_face:')
print(message)
```


## Reading sensor data in Linux

*This section is based on the official documentation for the reTerminal: [Hardware and Interfaces Usage](https://wiki.seeedstudio.com/reTerminal-hardware-interfaces-usage/#3-user-programmable-leds)*

> In Linux, everything is a file stream that can be read and/or written to.

For example, keyboard inputs and communication over web-sockets are all read as a file streams.

The reTerminal has 3 programmable LED's and a light sensor that can be **controlled like a regular file**.

![](../lessons/assets/5-reterminal-buttons-light-sensor.png)


### Missing Files Bug

The latest release of the Raspberry Pi OS for the reTerminal has a bug where the LEDs and Buzzer files are missing in the file system 🐞

A GitHub issue about this bug can be [found here](https://github.com/Seeed-Studio/seeed-linux-dtoverlays/issues/42).

> Before we can control the LEDs and Buzzer, we change the reTerminal's configuration:
>
> - Wiki FAQ - [Q12: LEDs and Buzzer do not work after installing reTerminal drivers](https://wiki.seeedstudio.com/reTerminal-FAQ/#q12-leds-and-buzzer-do-not-work-after-installing-reterminal-drivers)


### Programmable LEDs

There are 3 programmable LEDs in the reTerminal:

- **STA** light can be turned on as **red or green**.
- **USR** light can only be turned on as **green**.


![](../lessons/assets/5-reterminal_leds.png ':size=400')

The lights can be controlled at the OS level in the following way:

1. Enter the following directory

```bash
cd /sys/class/leds
```

2. Enter the following directory to control the **Green Color USR LED**

```bash
cd usr_led0
```


We will need to write to file `brightness`. Listing the permissions for this file we get:

```bash
pi16@pi16:/sys/class/leds/usr_led0 $ ls -all
total 0            
drwxr-xr-x 3 root root    0 Jan 25 20:33 .               
drwxr-xr-x 8 root root    0 Jan 25 20:33 ..                                                                                                                                                                         
-rw-r--r-- 1 root root 4096 Jan 26 22:02 brightness                                                                                                                                                                 
```

![Unix Permissions cheatsheet py Julia Evans](../lessons/assets/5-unix-permissions-cheatsheet.png)
<p class=img-info>
    <a href="https://drawings.jvns.ca/permissions/"> Unix File Permissions,</a>&nbsp; Julia Evans.
</p>

> We are about to modify a system file located in `/sys/class/leds/urs_led0`
> 
> **Note:** We'll run the next command as root because the file we want to write belongs the system (`root` user, rather than to the user `pi`.

3. Enable root account privileges (take the identity of the root user)

```bash
sudo -i
```

Your shell should now display `root@raspberrypi:~# `

4. Turn on the LED with maximum brightness

```bash
echo 255 > brightness
```

5. Turn off the LED

```bash
echo 0 > brightness
```

Similarly, you can control  `usr_led1` and `usr_led2` and even the buzzer on `/sys/class/leds/usr_buzzer`


### Luminosity Sensor

The digital light sensor can read the surrounding light levels.

1. Enter the following directory

```bash
cd /sys/bus/iio/devices/iio:device0
```

2. Read the following file to obtain the light intensity value in **Lux**

```bash
cat in_illuminance_input 
```

Output:
```bash
pi@raspberrypi:/sys/bus/iio/devices/iio:device0 $ cat in_illuminance_input 
2719
```

**Note:** We don't need to be root to read this file. Its permissions are set to let all users read it, even-though it belongs to the root user:

```bash
rw-r--r-- 1 root root 4096 Jan 30 22:16 in_illuminance_input
```

## Python Library for reTerminal

Seeed Studio provided a python library to access most of the sensors and actuators of the reTerminal.


Install the library `seeed-python-reterminal` (see official [Github repo](https://github.com/Seeed-Studio/Seeed_Python_ReTerminal)) using `pip`:

```bash
sudo pip3 install seeed-python-reterminal
```

> **Installing pip libraries as root is not recommended.**
>
> **However**, this library needs to access system files (see previous section) and will have to be executed as root.
>
> There are workarounds, however, for simplicity we will install this package as root. See section *ModuleNotFoundError* below for more context.

Now you can import it to a test script (eg. *buzz.py*)

```python
import seeed_python_reterminal.core as rt
import time

print("BUZZER ON")
rt.buzzer = True
time.sleep(1)

print("BUZZER OFF")
rt.buzzer = False
```

This will sound the buzzer of the reTerminal for 1 second.

To run the script:
```bash
sudo python3 buzz.py
```

Alternatively, first elevate your shell, then execute the script normally:
```bash
pi@raspberrypi:~ $ sudo -i
root@raspberrypi:~# python3 buzz.py
```

> **Note:** this library is simply a wrapper to the OS operations we did in the previous section.
> Some files need to be accessed by python as root. In this case, it is necessary to run `sudo -i` **before running** the python script.


See the official `seeed-python-reterminal` [Github repo](https://github.com/Seeed-Studio/Seeed_Python_ReTerminal) for API reference on how to control:

- LED's
- Accelerometer
- Programmable Buttons
- Light Sensor (requires manual updating)


### ModuleNotFoundError

When trying to import the  `seeed-python-reterminal`  library, you might get the following error:

```bash
ModuleNotFoundError: No module named 'seeed_python_reterminal'
```

The python interpreter is not able to find the module even though it is installed.

You can run the checks described below.

#### Check library location

Check the location of where the module was installed with `pip3 show <module-name>`:

```bash
pi@raspberrypi:~ $ pip3 show seeed-python-reterminal

Name: seeed-python-reterminal
Version: 0.2
Summary: seeed-python-reterminal
Home-page: https://github.com/Seeed-Studio/Seeed_Python_ReTerminal
Author: Takashi Matsuoka (matsujirushi)
Author-email: matsujirushi@live.jp
License: MIT License
Location: /usr/local/lib/python3.7/dist-packages      # Library location
Requires: evdev
Required-by: 
```

The library is installed at: `Location: /usr/local/lib/python3.7/dist-packages`


#### Check python's library paths

Similarly to Linux, there are environmental variables that determine where python will look for installed modules/libraries.

See the paths where python is looking for libraries with `sys.path`.

```python
pi@raspberrypi:~ $ python3

>>> import sys      # Exposes configuration used by the python interpreter.
>>> sys.path        # Lists all paths where interpreter looks for modules.
[
 '',
 '/usr/lib/python37.zip',
 '/usr/lib/python3.7',
 '/usr/lib/python3.7/lib-dynload',
 '/home/pi/.local/lib/python3.7/site-packages',
 '/usr/local/lib/python3.7/dist-packages',
 '/usr/lib/python3/dist-packages'
]
```

If the output of `pip3 show seeed-python-reterminal` is not in this list, python will not find it when you import it.

> **Note:** the python shell above was started as the user `pi`.
> If you start python as **root**, `sys.path` might have different paths.

Below, python was started as **root**:

```python
pi@raspberrypi:~ $ sudo -i
root@raspberrypi:~# python3

>>> import sys
>>> sys.path
[
'',
'/usr/lib/python37.zip',
'/usr/lib/python3.7',
'/usr/lib/python3.7/lib-dynload',
'/usr/local/lib/python3.7/dist-packages',
'/usr/lib/python3/dist-packages'
]
```

Note that the user `pi` does not have permission to add content inside `/usr`.
Thus, all `pip` installations as the regular user go into `/home/pi/.local/lib/python3.7/site-packages`.

**Conclusion:** if you install a python library as `root`, it might go to a different directory compared to installing it as the regular user `pi`.

This is the main reason why we chose to install the `seeed-python-reterminal` as root, rather than the regular user `pi`.

### Making user's library available to root (optional)

If you would like to make a library installed as the user `pi` available when running the script as `root`, you will need to export an environmental variable named `PYTHONPATH` pointing to the library location.

For example, assuming that a library installed under the user `pi` is located in `/home/pi/.local/lib/python3.7/site-packages`, do the following:

```bash
# Elevate the shell to the root user
pi@raspberrypi:~ $ sudo -i
root@raspberrypi:~#

# Export the PYTHONPATH environment variable
root@raspberrypi:~# export PYTHONPATH="/home/pi/.local/lib/python3.7/site-packages"

# Start python as root and run the script that imports the library
root@raspberrypi:~# python3 my_script.py
```

#### Related articles

- [How to change default install location for pip](https://stackoverflow.com/questions/24174821/how-to-change-default-install-location-for-pip), stackoverflow.com
- [Where does pip install its packages?](https://stackoverflow.com/questions/29980798/where-does-pip-install-its-packages), stackoverflow.com
- [Pip documentation: Configuration](https://pip.pypa.io/en/stable/topics/configuration/), pip.pypa.io
