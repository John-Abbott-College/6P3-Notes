# reTerminal Install Guide

How to setup a reTerminal device from scratch to be fully functional for the final project.

1. Install the Raspberry Pi OS image.
	1. Follow Seeed reTerminal Wiki.
	2. Must disassemble, flip the memory switch and use `usbboot/rpiboot` script to prepare internal memory.
	3. Use Raspberry Pi Image Flasher to flash new image.

2. Update system according to reTerminal Wiki.
	1. Must install kernel headers

3. Install `git` and `vim`

4. Install hardware drivers according to reTerminal Wiki.

5. Comment out `reTerminal-bridge` in `/boot/config.txt`

6. Install the python packages globaly (might require root):
	1. reTerminal
	2. gpiozero

