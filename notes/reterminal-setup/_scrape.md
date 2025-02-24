
- **Step 1.** Connect one end of a USB Type-C cable to the reTerminal
  and the other end to a power adapter (5V/4A)

- **Step 2.** Once the Raspberry Pi OS is booted up, press **OK** for
  the **Warning** window

![pir](https://files.seeedstudio.com/wiki/ReTerminal/wiki1/setup-1-new-1.png)

- **Step 3.** In the **Welcome to Raspberry Pi** window, press **Next**
  to get started with the initial set up

![pir](https://files.seeedstudio.com/wiki/ReTerminal/wiki1/setup-2-new.png)

- **Step 4.** Choose your **country, language, timezone** and press
  **Next**

![pir](https://files.seeedstudio.com/wiki/ReTerminal/wiki1/setup-3-new.png)

- **Step 5.** To change the password, first click on **Raspberry Pi**
  icon, navigate to `Universal Access > Onboard` to open the on-screen
  keyboard

![pir](https://files.seeedstudio.com/wiki/ReTerminal/wiki1/setup-4-new.png)

- **Step 6.** Enter your desired password and click **Next**

![pir](https://files.seeedstudio.com/wiki/ReTerminal/wiki1/setup-5-new.png)

**Note:** If you want to keep the default password as **raspberry**, you
can leave this blank and click **Next**

- **Step 7.** Click **Next** for the following

![pir](https://files.seeedstudio.com/wiki/ReTerminal/wiki1/setup-6-new.png)

- **Step 8.** If you want to connect to a WiFi network, you can choose a
  network, connect to it and press **Next**. However, if you want to set
  it later, you can press **Skip**

![pir](https://files.seeedstudio.com/wiki/ReTerminal/wiki1/setup-7-new.png)

- **Step 9.** **This step is very important.** You should make sure to
  press **Skip** to skip updating the software. However, if you want to
  update the software, you can follow [this
  wiki](https://wiki.seeedstudio.com/reTerminal-FAQ/#q3-how-to-upgrade-raspberry-pi-os-and-the-installed-packages)

![pir](https://files.seeedstudio.com/wiki/ReTerminal/wiki1/setup-8-new.png)

- **Step 10.** Finally press **Done** to finish the set up

![pir](https://files.seeedstudio.com/wiki/ReTerminal/wiki1/setup-9-new.png)

**Note:** The button on the top left corner can be used to turn on the
reTerminal after shutting down using software

![pir](http://files.seeedstudio.com/wiki/ReTerminal/power-button-press.jpg)

**Tip:** If you want to experience the Raspberry Pi OS on a bigger
screen, you can connect a display to the micro-HDMI port of the
reTerminal and also connect a keyboard and a mouse to the USB ports of
the reTerminal.

### Flash Raspberry Pi OS/ 64-bit Ubuntu OS or Other OS to eMMC[​](index.html#flash-raspberry-pi-os-64-bit-ubuntu-os-or-other-os-to-emmc "Direct link to flash-raspberry-pi-os-64-bit-ubuntu-os-or-other-os-to-emmc")

We can flash **Raspberry Pi OS/ 64-bit Ubuntu OS or other OS** on to the
**eMMC storage** of the CM4 on the reTerminal. Once the necessary
drivers are installed, you just have to connect the USB Type-C port of
the reTerminal to your PC, and it will show as an external drive. Start
by removing the reTerminal back shell.

- **Step 1.** Remove the 4 rubber covers and open the reTerminal back
  shell unscrewing the 4 screws underneath

![pir](https://files.seeedstudio.com/wiki/ReTerminal/remove-screw-1.png)

- **Step 2.** Remove the 2 screws to disassemble the heatsink

![pir](https://files.seeedstudio.com/wiki/ReTerminal/wiki1/remove-screw-heatsink-2.jpg)

- **Step 3.** Flip down the **boot mode switch** according to the below
  diagram

Now let's move on to software set up. Follow the steps according to your
desired operating system

##### For Windows[​](index.html#for-windows "Direct link to For Windows")

- **Step 1.** Download the **rpiboot setup installer** by click **[this
  link](https://github.com/raspberrypi/usbboot/raw/master/win32/rpiboot_setup.exe)**
  to install the necessary drivers and the boot tool

- **Step 2.** Connect reTerminal to the PC via USB Type-C cable

Windows will now find the hardware and install the necessary drivers

- **Step 3.** Search for **rpiboot** tool that we installed before and
  open it

- **Step 4.** Open **file explorer** and you will see the eMMC of the
  Computer Module 4 shown as a **USB mass storage device**

- **Step 5.** Download **Raspberry Pi Imager** software by visiting
  **[this link](https://www.raspberrypi.org/software/)**

- **Step 6.** Open Raspberry Pi Imager software

![pir](https://files.seeedstudio.com/wiki/102110497/RPI_Imager.png)

- **Step 7.** Press **CTRL + SHIFT + X** on the keyboard to open
  **Advanced options** window

![pir](http://files.seeedstudio.com/wiki/ReTerminal/rpi-imager-advanced.png)

Here you can **set a hostname, enable SSH, set a password, configure
wifi, set locale settings** and more

- **Step 8.** Click **CHOOSE OS** and select your preferred OS

::: {.theme-admonition .theme-admonition-note .alert .alert--secondary .admonition_LlT9}
::: {.admonitionHeading_tbUL}
![](data:image/svg+xml;base64,PHN2ZyB2aWV3Ym94PSIwIDAgMTQgMTYiPjxwYXRoIGQ9Ik02LjMgNS42OWEuOTQyLjk0MiAwIDAgMS0uMjgtLjdjMC0uMjguMDktLjUyLjI4LS43LjE5LS4xOC40Mi0uMjguNy0uMjguMjggMCAuNTIuMDkuNy4yOC4xOC4xOS4yOC40Mi4yOC43IDAgLjI4LS4wOS41Mi0uMjguN2ExIDEgMCAwIDEtLjcuM2MtLjI4IDAtLjUyLS4xMS0uNy0uM3pNOCA3Ljk5Yy0uMDItLjI1LS4xMS0uNDgtLjMxLS42OS0uMi0uMTktLjQyLS4zLS42OS0uMzFINmMtLjI3LjAyLS40OC4xMy0uNjkuMzEtLjIuMi0uMy40NC0uMzEuNjloMXYzYy4wMi4yNy4xMS41LjMxLjY5LjIuMi40Mi4zMS42OS4zMWgxYy4yNyAwIC40OC0uMTEuNjktLjMxLjItLjE5LjMtLjQyLjMxLS42OUg4VjcuOTh2LjAxek03IDIuM2MtMy4xNCAwLTUuNyAyLjU0LTUuNyA1LjY4IDAgMy4xNCAyLjU2IDUuNyA1LjcgNS43czUuNy0yLjU1IDUuNy01LjdjMC0zLjE1LTIuNTYtNS42OS01LjctNS42OXYuMDF6TTcgLjk4YzMuODYgMCA3IDMuMTQgNyA3cy0zLjE0IDctNyA3LTctMy4xMi03LTcgMy4xNC03IDctN3oiIGZpbGwtcnVsZT0iZXZlbm9kZCIgLz48L3N2Zz4=)note
:::

::: {.admonitionContent_S0QG}
If you are attempting to install Raspbian OS, we have conducted tests
and found that both the *32-bit and 64-bit* versions of **Bullseye**
work well with reTerminal without encountering any [**black screen
issue**](https://wiki.seeedstudio.com/reterminal_black_screen/#flash-raspberry-pi-os-which-is-originally-shipped-with-reterminal).
Additionally, we have also tested the new **Bookworm** *64-bit* version,
and it functions smoothly on reTerminal.
:::
:::

![pir](https://files.seeedstudio.com/wiki/ReTerminal/OS-select.png)

**NOTE:** You can select other OS such as **64-bit Ubuntu** by
navigating into **Other general purpose OS**

![pir](https://files.seeedstudio.com/wiki/ReTerminal/Ubuntu-select.jpg)

- **Step 9.** Click **CHOOSE STORAGE** and select the connected eMMC
  drive

- **Step 10.** Finally, click **WRITE**

![pir](https://files.seeedstudio.com/wiki/102110497/RPI_Imager_Final.png)

Please wait a few minutes until the flashing process is complete.

- **Step 11.** Flip the **Boot Mode switch** back to the original
  position and assemble the reTerminal shell

Now you can skip to
**[here](index.html#log-in-to-raspberry-pi-os-ubuntu-os-or-other-os-using-ssh-over-wi-fi-ethernet)**

##### For MAC[​](index.html#for-mac "Direct link to For MAC")

::: {.theme-admonition .theme-admonition-caution .alert .alert--warning .admonition_LlT9}
::: {.admonitionHeading_tbUL}
![](data:image/svg+xml;base64,PHN2ZyB2aWV3Ym94PSIwIDAgMTYgMTYiPjxwYXRoIGQ9Ik04Ljg5MyAxLjVjLS4xODMtLjMxLS41Mi0uNS0uODg3LS41cy0uNzAzLjE5LS44ODYuNUwuMTM4IDEzLjQ5OWEuOTguOTggMCAwIDAgMCAxLjAwMWMuMTkzLjMxLjUzLjUwMS44ODYuNTAxaDEzLjk2NGMuMzY3IDAgLjcwNC0uMTkuODc3LS41YTEuMDMgMS4wMyAwIDAgMCAuMDEtMS4wMDJMOC44OTMgMS41em0uMTMzIDExLjQ5N0g2Ljk4N3YtMi4wMDNoMi4wMzl2Mi4wMDN6bTAtMy4wMDRINi45ODdWNS45ODdoMi4wMzl2NC4wMDZ6IiBmaWxsLXJ1bGU9ImV2ZW5vZGQiIC8+PC9zdmc+)caution
:::

::: {.admonitionContent_S0QG}
**You need to install [homebrew](https://brew.sh/) before proceed the
following steps.** Please open a terminal and type `brew -V` to check if
you have setup the correct homebrew environment, you should see the
version of the homebrew environment you have installed.
:::
:::

- **Step 1.** Clone the **usbboot** repository

::: {.language-sh .codeBlockContainer_Ckt0 .theme-code-block style="--prism-color:#F8F8F2;--prism-background-color:#282A36"}
::: {.codeBlockContent_biex}
``` prism-code
git clone --depth=1 https://github.com/raspberrypi/usbboot
cd usbboot
```

::: {.buttonGroup__atx}
![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvbkljb25feTk3TiIgdmlld2JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTksMjFIOFY3SDE5TTE5LDVIOEEyLDIgMCAwLDAgNiw3VjIxQTIsMiAwIDAsMCA4LDIzSDE5QTIsMiAwIDAsMCAyMSwyMVY3QTIsMiAwIDAsMCAxOSw1TTE2LDFINEEyLDIgMCAwLDAgMiwzVjE3SDRWM0gxNlYxWiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvblN1Y2Nlc3NJY29uX0xqZFMiIHZpZXdib3g9IjAgMCAyNCAyNCI+PHBhdGggZD0iTTIxLDdMOSwxOUwzLjUsMTMuNUw0LjkxLDEyLjA5TDksMTYuMTdMMTkuNTksNS41OUwyMSw3WiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)
:::
:::
:::

- **Step 2.** Install **libusb**

::: {.language-sh .codeBlockContainer_Ckt0 .theme-code-block style="--prism-color:#F8F8F2;--prism-background-color:#282A36"}
::: {.codeBlockContent_biex}
``` prism-code
brew install libusb
```

::: {.buttonGroup__atx}
![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvbkljb25feTk3TiIgdmlld2JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTksMjFIOFY3SDE5TTE5LDVIOEEyLDIgMCAwLDAgNiw3VjIxQTIsMiAwIDAsMCA4LDIzSDE5QTIsMiAwIDAsMCAyMSwyMVY3QTIsMiAwIDAsMCAxOSw1TTE2LDFINEEyLDIgMCAwLDAgMiwzVjE3SDRWM0gxNlYxWiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvblN1Y2Nlc3NJY29uX0xqZFMiIHZpZXdib3g9IjAgMCAyNCAyNCI+PHBhdGggZD0iTTIxLDdMOSwxOUwzLjUsMTMuNUw0LjkxLDEyLjA5TDksMTYuMTdMMTkuNTksNS41OUwyMSw3WiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)
:::
:::
:::

- **Step 3.** Install **pkg-config**

::: {.language-sh .codeBlockContainer_Ckt0 .theme-code-block style="--prism-color:#F8F8F2;--prism-background-color:#282A36"}
::: {.codeBlockContent_biex}
``` prism-code
brew install pkg-config
```

::: {.buttonGroup__atx}
![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvbkljb25feTk3TiIgdmlld2JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTksMjFIOFY3SDE5TTE5LDVIOEEyLDIgMCAwLDAgNiw3VjIxQTIsMiAwIDAsMCA4LDIzSDE5QTIsMiAwIDAsMCAyMSwyMVY3QTIsMiAwIDAsMCAxOSw1TTE2LDFINEEyLDIgMCAwLDAgMiwzVjE3SDRWM0gxNlYxWiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvblN1Y2Nlc3NJY29uX0xqZFMiIHZpZXdib3g9IjAgMCAyNCAyNCI+PHBhdGggZD0iTTIxLDdMOSwxOUwzLjUsMTMuNUw0LjkxLDEyLjA5TDksMTYuMTdMMTkuNTksNS41OUwyMSw3WiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)
:::
:::
:::

- **Step 4.** Build using make

::: {.language-sh .codeBlockContainer_Ckt0 .theme-code-block style="--prism-color:#F8F8F2;--prism-background-color:#282A36"}
::: {.codeBlockContent_biex}
``` prism-code
make
```

::: {.buttonGroup__atx}
![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvbkljb25feTk3TiIgdmlld2JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTksMjFIOFY3SDE5TTE5LDVIOEEyLDIgMCAwLDAgNiw3VjIxQTIsMiAwIDAsMCA4LDIzSDE5QTIsMiAwIDAsMCAyMSwyMVY3QTIsMiAwIDAsMCAxOSw1TTE2LDFINEEyLDIgMCAwLDAgMiwzVjE3SDRWM0gxNlYxWiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvblN1Y2Nlc3NJY29uX0xqZFMiIHZpZXdib3g9IjAgMCAyNCAyNCI+PHBhdGggZD0iTTIxLDdMOSwxOUwzLjUsMTMuNUw0LjkxLDEyLjA5TDksMTYuMTdMMTkuNTksNS41OUwyMSw3WiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)
:::
:::
:::

- **Step 5.** Run the binary

::: {.language-sh .codeBlockContainer_Ckt0 .theme-code-block style="--prism-color:#F8F8F2;--prism-background-color:#282A36"}
::: {.codeBlockContent_biex}
``` prism-code
sudo ./rpiboot
```

::: {.buttonGroup__atx}
![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvbkljb25feTk3TiIgdmlld2JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTksMjFIOFY3SDE5TTE5LDVIOEEyLDIgMCAwLDAgNiw3VjIxQTIsMiAwIDAsMCA4LDIzSDE5QTIsMiAwIDAsMCAyMSwyMVY3QTIsMiAwIDAsMCAxOSw1TTE2LDFINEEyLDIgMCAwLDAgMiwzVjE3SDRWM0gxNlYxWiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvblN1Y2Nlc3NJY29uX0xqZFMiIHZpZXdib3g9IjAgMCAyNCAyNCI+PHBhdGggZD0iTTIxLDdMOSwxOUwzLjUsMTMuNUw0LjkxLDEyLjA5TDksMTYuMTdMMTkuNTksNS41OUwyMSw3WiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)
:::
:::
:::

- **Step 6.** Connect reTerminal to the your Mac computer via USB Type-C
  cable

- **Step 7.** Download and Install **Raspberry Pi Imager** Application
  by visiting [this link](https://www.raspberrypi.org/software/)

- **Step 8.** Open the **Raspberry Pi Imager** Application

![pir](https://files.seeedstudio.com/wiki/102110497/RPI_Imager.png)

- **Step 9.** Press **CTRL + SHIFT + X** on the keyboard to open
  **Advanced options** window

![pir](http://files.seeedstudio.com/wiki/ReTerminal/rpi-imager-advanced.png)

Here you can **set a hostname, enable SSH, set a password, configure
wifi, set locale settings** and more

- **Step 10.** Click **CHOOSE OS** and select your preferred OS

![pir](https://files.seeedstudio.com/wiki/ReTerminal/OS-select.png)

**NOTE:** You can select OS such as **64-bit Ubuntu** by navigating into
**Other general purpose OS**

![pir](https://files.seeedstudio.com/wiki/ReTerminal/Ubuntu-select.jpg)

- **Step 11.** Click **CHOOSE STORAGE** and select the connected eMMC
  drive

- **Step 12.** Finally, click **WRITE**

![pir](https://files.seeedstudio.com/wiki/102110497/RPI_Imager_Final.png)

Please wait a few minutes until the flashing process is complete.

- **Step 13.** Flip the **Boot Mode switch** back to the original
  postion and assemble the reTerminal shell

Now you can skip to
**[here](index.html#log-in-to-raspberry-pi-os-ubuntu-os-or-other-os-using-ssh-over-wi-fi-ethernet)**

##### For Linux[​](index.html#for-linux "Direct link to For Linux")

We will use Git to obtain the **rpiboot** source code, so make sure Git
is installed

- **Step 1.** Open a **Terminal** window and type the following to
  update the **packages list**

::: {.language-sh .codeBlockContainer_Ckt0 .theme-code-block style="--prism-color:#F8F8F2;--prism-background-color:#282A36"}
::: {.codeBlockContent_biex}
``` prism-code
sudo apt-get update
```

::: {.buttonGroup__atx}
![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvbkljb25feTk3TiIgdmlld2JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTksMjFIOFY3SDE5TTE5LDVIOEEyLDIgMCAwLDAgNiw3VjIxQTIsMiAwIDAsMCA4LDIzSDE5QTIsMiAwIDAsMCAyMSwyMVY3QTIsMiAwIDAsMCAxOSw1TTE2LDFINEEyLDIgMCAwLDAgMiwzVjE3SDRWM0gxNlYxWiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvblN1Y2Nlc3NJY29uX0xqZFMiIHZpZXdib3g9IjAgMCAyNCAyNCI+PHBhdGggZD0iTTIxLDdMOSwxOUwzLjUsMTMuNUw0LjkxLDEyLjA5TDksMTYuMTdMMTkuNTksNS41OUwyMSw3WiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)
:::
:::
:::

- **Step 2.** Install **Git** by the following command

::: {.language-sh .codeBlockContainer_Ckt0 .theme-code-block style="--prism-color:#F8F8F2;--prism-background-color:#282A36"}
::: {.codeBlockContent_biex}
``` prism-code
sudo apt install git pkg-config make gcc libusb-1.0-0-dev
```

::: {.buttonGroup__atx}
![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvbkljb25feTk3TiIgdmlld2JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTksMjFIOFY3SDE5TTE5LDVIOEEyLDIgMCAwLDAgNiw3VjIxQTIsMiAwIDAsMCA4LDIzSDE5QTIsMiAwIDAsMCAyMSwyMVY3QTIsMiAwIDAsMCAxOSw1TTE2LDFINEEyLDIgMCAwLDAgMiwzVjE3SDRWM0gxNlYxWiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvblN1Y2Nlc3NJY29uX0xqZFMiIHZpZXdib3g9IjAgMCAyNCAyNCI+PHBhdGggZD0iTTIxLDdMOSwxOUwzLjUsMTMuNUw0LjkxLDEyLjA5TDksMTYuMTdMMTkuNTksNS41OUwyMSw3WiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)
:::
:::
:::

- **Step 3.** Git might produce an error if the date is not set
  properly. Type the following to correct this

::: {.language-sh .codeBlockContainer_Ckt0 .theme-code-block style="--prism-color:#F8F8F2;--prism-background-color:#282A36"}
::: {.codeBlockContent_biex}
``` prism-code
sudo date MMDDhhmm
```

::: {.buttonGroup__atx}
![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvbkljb25feTk3TiIgdmlld2JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTksMjFIOFY3SDE5TTE5LDVIOEEyLDIgMCAwLDAgNiw3VjIxQTIsMiAwIDAsMCA4LDIzSDE5QTIsMiAwIDAsMCAyMSwyMVY3QTIsMiAwIDAsMCAxOSw1TTE2LDFINEEyLDIgMCAwLDAgMiwzVjE3SDRWM0gxNlYxWiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvblN1Y2Nlc3NJY29uX0xqZFMiIHZpZXdib3g9IjAgMCAyNCAyNCI+PHBhdGggZD0iTTIxLDdMOSwxOUwzLjUsMTMuNUw0LjkxLDEyLjA5TDksMTYuMTdMMTkuNTksNS41OUwyMSw3WiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)
:::
:::
:::

**NOTE:** Where **MM** is the month, **DD** is the date, and **hh** and
**mm** are hours and minutes respectively.

- **Step 4.** Clone the **usbboot** tool repository

::: {.language-sh .codeBlockContainer_Ckt0 .theme-code-block style="--prism-color:#F8F8F2;--prism-background-color:#282A36"}
::: {.codeBlockContent_biex}
``` prism-code
git clone --depth=1 https://github.com/raspberrypi/usbboot
cd usbboot
```

::: {.buttonGroup__atx}
![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvbkljb25feTk3TiIgdmlld2JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTksMjFIOFY3SDE5TTE5LDVIOEEyLDIgMCAwLDAgNiw3VjIxQTIsMiAwIDAsMCA4LDIzSDE5QTIsMiAwIDAsMCAyMSwyMVY3QTIsMiAwIDAsMCAxOSw1TTE2LDFINEEyLDIgMCAwLDAgMiwzVjE3SDRWM0gxNlYxWiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvblN1Y2Nlc3NJY29uX0xqZFMiIHZpZXdib3g9IjAgMCAyNCAyNCI+PHBhdGggZD0iTTIxLDdMOSwxOUwzLjUsMTMuNUw0LjkxLDEyLjA5TDksMTYuMTdMMTkuNTksNS41OUwyMSw3WiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)
:::
:::
:::

- **Step 5.** Build and install the usbboot tool

::: {.language-sh .codeBlockContainer_Ckt0 .theme-code-block style="--prism-color:#F8F8F2;--prism-background-color:#282A36"}
::: {.codeBlockContent_biex}
``` prism-code
make
```

::: {.buttonGroup__atx}
![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvbkljb25feTk3TiIgdmlld2JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTksMjFIOFY3SDE5TTE5LDVIOEEyLDIgMCAwLDAgNiw3VjIxQTIsMiAwIDAsMCA4LDIzSDE5QTIsMiAwIDAsMCAyMSwyMVY3QTIsMiAwIDAsMCAxOSw1TTE2LDFINEEyLDIgMCAwLDAgMiwzVjE3SDRWM0gxNlYxWiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvblN1Y2Nlc3NJY29uX0xqZFMiIHZpZXdib3g9IjAgMCAyNCAyNCI+PHBhdGggZD0iTTIxLDdMOSwxOUwzLjUsMTMuNUw0LjkxLDEyLjA5TDksMTYuMTdMMTkuNTksNS41OUwyMSw3WiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)
:::
:::
:::

- **Step 6.** Run the usbboot tool and it will wait for a connection

::: {.language-sh .codeBlockContainer_Ckt0 .theme-code-block style="--prism-color:#F8F8F2;--prism-background-color:#282A36"}
::: {.codeBlockContent_biex}
``` prism-code
sudo ./rpiboot
```

::: {.buttonGroup__atx}
![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvbkljb25feTk3TiIgdmlld2JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTksMjFIOFY3SDE5TTE5LDVIOEEyLDIgMCAwLDAgNiw3VjIxQTIsMiAwIDAsMCA4LDIzSDE5QTIsMiAwIDAsMCAyMSwyMVY3QTIsMiAwIDAsMCAxOSw1TTE2LDFINEEyLDIgMCAwLDAgMiwzVjE3SDRWM0gxNlYxWiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvblN1Y2Nlc3NJY29uX0xqZFMiIHZpZXdib3g9IjAgMCAyNCAyNCI+PHBhdGggZD0iTTIxLDdMOSwxOUwzLjUsMTMuNUw0LjkxLDEyLjA5TDksMTYuMTdMMTkuNTksNS41OUwyMSw3WiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)
:::
:::
:::

- **Step 7.** Connect reTerminal to the PC via USB Type-C cable

- **Step 8.** Download **Raspberry Pi Imager** software by visiting
  [this link](https://www.raspberrypi.org/software/)

- **Step 9.** Open Raspberry Pi Imager software

![pir](https://files.seeedstudio.com/wiki/102110497/RPI_Imager.png)

- **Step 10.** Press **CTRL + SHIFT + X** on the keyboard to open
  **Advanced options** window

![pir](http://files.seeedstudio.com/wiki/ReTerminal/rpi-imager-advanced.png)

Here you can **set a hostname, enable SSH, set a password, configure
wifi, set locale settings** and more

- **Step 11.** Click **CHOOSE OS** and select your preferred OS

![pir](https://files.seeedstudio.com/wiki/ReTerminal/OS-select.png)

**NOTE:** You can select OS such as **64-bit Ubuntu** by navigating into
**Other general purpose OS**

![pir](https://files.seeedstudio.com/wiki/ReTerminal/Ubuntu-select.jpg)

- **Step 12.** Click **CHOOSE STORAGE** and select the connected eMMC
  drive

- **Step 13.** Finally, click **WRITE**

![pir](https://files.seeedstudio.com/wiki/102110497/RPI_Imager_Final.png)

Please wait a few minutes until the flashing process is complete.

- **Step 14.** Flip the **Boot Mode switch** back to the original
  postion and assemble the reTerminal shell

### Log in to Raspberry Pi OS/ Ubuntu OS or Other OS using SSH over Wi-Fi/ Ethernet[​](index.html#log-in-to-raspberry-pi-os-ubuntu-os-or-other-os-using-ssh-over-wi-fi-ethernet "Direct link to Log in to Raspberry Pi OS/ Ubuntu OS or Other OS using SSH over Wi-Fi/ Ethernet")

If you want to log in to the Raspberry Pi OS using **SSH over Wi-Fi/
Ethernet**, you can follow the steps below. First set up Wi-Fi/Ethernet
on the reTerminal and then SSH using Windows/Mac/Linux.

**Note:** If you have configured WiFi and enabled SSH using Raspberry Pi
Imager, you can skip steps 1 - 4

- **Step 1.** If you have a **Wi-Fi connection**, click the **Wi-Fi
  icon** on the top right corner of the Raspberry Pi OS Desktop, select
  your Wi-Fi network and enter the password using the on-screen virtual
  keyboard

**Note:** The location of the Wi-Fi setting might be different for other
OS

- **Step 2.** If you don't have a **Wi-Fi connection**, you can connect
  an ethernet cable from your router to the ethernet port of the
  reTerminal

**Note:** Make sure the reTerminal and your computer is connected to the
same network

- **Step 3.** Touch on the Raspberry Pi icon at the top left corner and
  navigate to `Preferences > Raspberry Pi Configuration` and click on
  **Interfaces** tab

- **Step 4.** Select **Enable** which is next to **SSH** and click
  **OK**

![pir](https://files.seeedstudio.com/wiki/ReTerminal/ssh-select-2.jpg)

Now let's configure the software on the computer. Please follow
according to your operating system

##### For Windows[​](index.html#for-windows-1 "Direct link to For Windows")

- **Step 1.** Open **Command Prompt** and type the following

::: {.language-sh .codeBlockContainer_Ckt0 .theme-code-block style="--prism-color:#F8F8F2;--prism-background-color:#282A36"}
::: {.codeBlockContent_biex}
``` prism-code
ssh [email protected]
```

::: {.buttonGroup__atx}
![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvbkljb25feTk3TiIgdmlld2JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTksMjFIOFY3SDE5TTE5LDVIOEEyLDIgMCAwLDAgNiw3VjIxQTIsMiAwIDAsMCA4LDIzSDE5QTIsMiAwIDAsMCAyMSwyMVY3QTIsMiAwIDAsMCAxOSw1TTE2LDFINEEyLDIgMCAwLDAgMiwzVjE3SDRWM0gxNlYxWiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvblN1Y2Nlc3NJY29uX0xqZFMiIHZpZXdib3g9IjAgMCAyNCAyNCI+PHBhdGggZD0iTTIxLDdMOSwxOUwzLjUsMTMuNUw0LjkxLDEyLjA5TDksMTYuMTdMMTkuNTksNS41OUwyMSw3WiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)
:::
:::
:::

- **Step 2.** Type **yes** for the prompt

![pir](http://files.seeedstudio.com/wiki/ReTerminal/ssh-windows-prompt.png)

- **Step 3.** Enter the password as follows

::: {.language-sh .codeBlockContainer_Ckt0 .theme-code-block style="--prism-color:#F8F8F2;--prism-background-color:#282A36"}
::: {.codeBlockContent_biex}
``` prism-code
raspberry
```

::: {.buttonGroup__atx}
![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvbkljb25feTk3TiIgdmlld2JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTksMjFIOFY3SDE5TTE5LDVIOEEyLDIgMCAwLDAgNiw3VjIxQTIsMiAwIDAsMCA4LDIzSDE5QTIsMiAwIDAsMCAyMSwyMVY3QTIsMiAwIDAsMCAxOSw1TTE2LDFINEEyLDIgMCAwLDAgMiwzVjE3SDRWM0gxNlYxWiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvblN1Y2Nlc3NJY29uX0xqZFMiIHZpZXdib3g9IjAgMCAyNCAyNCI+PHBhdGggZD0iTTIxLDdMOSwxOUwzLjUsMTMuNUw0LjkxLDEyLjA5TDksMTYuMTdMMTkuNTksNS41OUwyMSw3WiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)
:::
:::
:::

- **Step 4.** If you have sucessfully logged into the Raspberry Pi OS,
  you will see the following output

![pir](http://files.seeedstudio.com/wiki/ReTerminal/ssh-windows.png)

##### For Mac/Linux[​](index.html#for-maclinux "Direct link to For Mac/Linux")

- **Step 1.** Open **Terminal** on the computer and type the following

::: {.language-sh .codeBlockContainer_Ckt0 .theme-code-block style="--prism-color:#F8F8F2;--prism-background-color:#282A36"}
::: {.codeBlockContent_biex}
``` prism-code
ssh [email protected]
```

::: {.buttonGroup__atx}
![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvbkljb25feTk3TiIgdmlld2JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTksMjFIOFY3SDE5TTE5LDVIOEEyLDIgMCAwLDAgNiw3VjIxQTIsMiAwIDAsMCA4LDIzSDE5QTIsMiAwIDAsMCAyMSwyMVY3QTIsMiAwIDAsMCAxOSw1TTE2LDFINEEyLDIgMCAwLDAgMiwzVjE3SDRWM0gxNlYxWiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvblN1Y2Nlc3NJY29uX0xqZFMiIHZpZXdib3g9IjAgMCAyNCAyNCI+PHBhdGggZD0iTTIxLDdMOSwxOUwzLjUsMTMuNUw0LjkxLDEyLjA5TDksMTYuMTdMMTkuNTksNS41OUwyMSw3WiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)
:::
:::
:::

- **Step 2.** Type **yes** for the following message

::: {.language-sh .codeBlockContainer_Ckt0 .theme-code-block style="--prism-color:#F8F8F2;--prism-background-color:#282A36"}
::: {.codeBlockContent_biex}
``` prism-code
ECDSA key fingerprint is SHA256:XXXXXXX.
Are you sure you want to continue connecting (yes/no/[fingerprint])?
```

::: {.buttonGroup__atx}
![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvbkljb25feTk3TiIgdmlld2JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTksMjFIOFY3SDE5TTE5LDVIOEEyLDIgMCAwLDAgNiw3VjIxQTIsMiAwIDAsMCA4LDIzSDE5QTIsMiAwIDAsMCAyMSwyMVY3QTIsMiAwIDAsMCAxOSw1TTE2LDFINEEyLDIgMCAwLDAgMiwzVjE3SDRWM0gxNlYxWiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvblN1Y2Nlc3NJY29uX0xqZFMiIHZpZXdib3g9IjAgMCAyNCAyNCI+PHBhdGggZD0iTTIxLDdMOSwxOUwzLjUsMTMuNUw0LjkxLDEyLjA5TDksMTYuMTdMMTkuNTksNS41OUwyMSw3WiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)
:::
:::
:::

- **Step 3.** When it asks for the password, type the following

::: {.language-sh .codeBlockContainer_Ckt0 .theme-code-block style="--prism-color:#F8F8F2;--prism-background-color:#282A36"}
::: {.codeBlockContent_biex}
``` prism-code
raspberry
```

::: {.buttonGroup__atx}
![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvbkljb25feTk3TiIgdmlld2JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTksMjFIOFY3SDE5TTE5LDVIOEEyLDIgMCAwLDAgNiw3VjIxQTIsMiAwIDAsMCA4LDIzSDE5QTIsMiAwIDAsMCAyMSwyMVY3QTIsMiAwIDAsMCAxOSw1TTE2LDFINEEyLDIgMCAwLDAgMiwzVjE3SDRWM0gxNlYxWiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvblN1Y2Nlc3NJY29uX0xqZFMiIHZpZXdib3g9IjAgMCAyNCAyNCI+PHBhdGggZD0iTTIxLDdMOSwxOUwzLjUsMTMuNUw0LjkxLDEyLjA5TDksMTYuMTdMMTkuNTksNS41OUwyMSw3WiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)
:::
:::
:::

- **Step 4.** If you have sucessfully logged into the Raspberry Pi OS,
  you will see the following output

![pir](https://files.seeedstudio.com/wiki/102110497/SSH_WiFi_Linux.png)

### Install reTerminal drivers after flashing new Raspberry Pi OS/ Ubuntu OS or Other OS[​](index.html#install-reterminal-drivers-after-flashing-new-raspberry-pi-os-ubuntu-os-or-other-os "Direct link to install-reterminal-drivers-after-flashing-new-raspberry-pi-os-ubuntu-os-or-other-os")

reTerminal comes with the necessary drivers pre-installed out-of-the-box
so you don't need to install any additional drivers. However, if you
flash new OS by yourself, you need to install the necessary drivers
separately. The hardware that need drivers include the **5-inch LCD,
touch panel, accelerometer, light sensor, user LEDs, user buttons, RTC,
buzzer, cryptographic co-processor**.

- **Step 1.** Clone the following repo

::: {.language-sh .codeBlockContainer_Ckt0 .theme-code-block style="--prism-color:#F8F8F2;--prism-background-color:#282A36"}
::: {.codeBlockContent_biex}
``` prism-code
sudo apt install git -y
git clone --depth 1 https://github.com/Seeed-Studio/seeed-linux-dtoverlays
```

::: {.buttonGroup__atx}
![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvbkljb25feTk3TiIgdmlld2JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTksMjFIOFY3SDE5TTE5LDVIOEEyLDIgMCAwLDAgNiw3VjIxQTIsMiAwIDAsMCA4LDIzSDE5QTIsMiAwIDAsMCAyMSwyMVY3QTIsMiAwIDAsMCAxOSw1TTE2LDFINEEyLDIgMCAwLDAgMiwzVjE3SDRWM0gxNlYxWiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvblN1Y2Nlc3NJY29uX0xqZFMiIHZpZXdib3g9IjAgMCAyNCAyNCI+PHBhdGggZD0iTTIxLDdMOSwxOUwzLjUsMTMuNUw0LjkxLDEyLjA5TDksMTYuMTdMMTkuNTksNS41OUwyMSw3WiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)
:::
:::
:::

- **Step 2.** Enter the repo

::: {.language-sh .codeBlockContainer_Ckt0 .theme-code-block style="--prism-color:#F8F8F2;--prism-background-color:#282A36"}
::: {.codeBlockContent_biex}
``` prism-code
cd seeed-linux-dtoverlays
```

::: {.buttonGroup__atx}
![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvbkljb25feTk3TiIgdmlld2JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTksMjFIOFY3SDE5TTE5LDVIOEEyLDIgMCAwLDAgNiw3VjIxQTIsMiAwIDAsMCA4LDIzSDE5QTIsMiAwIDAsMCAyMSwyMVY3QTIsMiAwIDAsMCAxOSw1TTE2LDFINEEyLDIgMCAwLDAgMiwzVjE3SDRWM0gxNlYxWiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvblN1Y2Nlc3NJY29uX0xqZFMiIHZpZXdib3g9IjAgMCAyNCAyNCI+PHBhdGggZD0iTTIxLDdMOSwxOUwzLjUsMTMuNUw0LjkxLDEyLjA5TDksMTYuMTdMMTkuNTksNS41OUwyMSw3WiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)
:::
:::
:::

::: {.theme-admonition .theme-admonition-note .alert .alert--secondary .admonition_LlT9}
::: {.admonitionHeading_tbUL}
![](data:image/svg+xml;base64,PHN2ZyB2aWV3Ym94PSIwIDAgMTQgMTYiPjxwYXRoIGQ9Ik02LjMgNS42OWEuOTQyLjk0MiAwIDAgMS0uMjgtLjdjMC0uMjguMDktLjUyLjI4LS43LjE5LS4xOC40Mi0uMjguNy0uMjguMjggMCAuNTIuMDkuNy4yOC4xOC4xOS4yOC40Mi4yOC43IDAgLjI4LS4wOS41Mi0uMjguN2ExIDEgMCAwIDEtLjcuM2MtLjI4IDAtLjUyLS4xMS0uNy0uM3pNOCA3Ljk5Yy0uMDItLjI1LS4xMS0uNDgtLjMxLS42OS0uMi0uMTktLjQyLS4zLS42OS0uMzFINmMtLjI3LjAyLS40OC4xMy0uNjkuMzEtLjIuMi0uMy40NC0uMzEuNjloMXYzYy4wMi4yNy4xMS41LjMxLjY5LjIuMi40Mi4zMS42OS4zMWgxYy4yNyAwIC40OC0uMTEuNjktLjMxLjItLjE5LjMtLjQyLjMxLS42OUg4VjcuOTh2LjAxek03IDIuM2MtMy4xNCAwLTUuNyAyLjU0LTUuNyA1LjY4IDAgMy4xNCAyLjU2IDUuNyA1LjcgNS43czUuNy0yLjU1IDUuNy01LjdjMC0zLjE1LTIuNTYtNS42OS01LjctNS42OXYuMDF6TTcgLjk4YzMuODYgMCA3IDMuMTQgNyA3cy0zLjE0IDctNyA3LTctMy4xMi03LTcgMy4xNC03IDctN3oiIGZpbGwtcnVsZT0iZXZlbm9kZCIgLz48L3N2Zz4=)note
:::

::: {.admonitionContent_S0QG}
For **32bit OS** you will need to add following step before execute
`sudo ./scripts/reTerminal.sh`.After completing the installation,
remember to **reboot** reTerminal for the changes to take effect.

::: {.codeBlockContainer_Ckt0 .theme-code-block style="--prism-color:#F8F8F2;--prism-background-color:#282A36"}
::: {.codeBlockContent_biex}
``` prism-code
echo arm_64bit=0 | sudo tee -a /boot/config.txt
sudo reboot
```

::: {.buttonGroup__atx}
![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvbkljb25feTk3TiIgdmlld2JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTksMjFIOFY3SDE5TTE5LDVIOEEyLDIgMCAwLDAgNiw3VjIxQTIsMiAwIDAsMCA4LDIzSDE5QTIsMiAwIDAsMCAyMSwyMVY3QTIsMiAwIDAsMCAxOSw1TTE2LDFINEEyLDIgMCAwLDAgMiwzVjE3SDRWM0gxNlYxWiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvblN1Y2Nlc3NJY29uX0xqZFMiIHZpZXdib3g9IjAgMCAyNCAyNCI+PHBhdGggZD0iTTIxLDdMOSwxOUwzLjUsMTMuNUw0LjkxLDEyLjA5TDksMTYuMTdMMTkuNTksNS41OUwyMSw3WiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)
:::
:::
:::
:::
:::

- **Step 3.** Type the following to install the drivers

::: {.language-sh .codeBlockContainer_Ckt0 .theme-code-block style="--prism-color:#F8F8F2;--prism-background-color:#282A36"}
::: {.codeBlockContent_biex}
``` prism-code
sudo ./scripts/reTerminal.sh
```

::: {.buttonGroup__atx}
![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvbkljb25feTk3TiIgdmlld2JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTksMjFIOFY3SDE5TTE5LDVIOEEyLDIgMCAwLDAgNiw3VjIxQTIsMiAwIDAsMCA4LDIzSDE5QTIsMiAwIDAsMCAyMSwyMVY3QTIsMiAwIDAsMCAxOSw1TTE2LDFINEEyLDIgMCAwLDAgMiwzVjE3SDRWM0gxNlYxWiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvblN1Y2Nlc3NJY29uX0xqZFMiIHZpZXdib3g9IjAgMCAyNCAyNCI+PHBhdGggZD0iTTIxLDdMOSwxOUwzLjUsMTMuNUw0LjkxLDEyLjA5TDksMTYuMTdMMTkuNTksNS41OUwyMSw3WiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)
:::
:::
:::

::: {.theme-admonition .theme-admonition-note .alert .alert--secondary .admonition_LlT9}
::: {.admonitionHeading_tbUL}
![](data:image/svg+xml;base64,PHN2ZyB2aWV3Ym94PSIwIDAgMTQgMTYiPjxwYXRoIGQ9Ik02LjMgNS42OWEuOTQyLjk0MiAwIDAgMS0uMjgtLjdjMC0uMjguMDktLjUyLjI4LS43LjE5LS4xOC40Mi0uMjguNy0uMjguMjggMCAuNTIuMDkuNy4yOC4xOC4xOS4yOC40Mi4yOC43IDAgLjI4LS4wOS41Mi0uMjguN2ExIDEgMCAwIDEtLjcuM2MtLjI4IDAtLjUyLS4xMS0uNy0uM3pNOCA3Ljk5Yy0uMDItLjI1LS4xMS0uNDgtLjMxLS42OS0uMi0uMTktLjQyLS4zLS42OS0uMzFINmMtLjI3LjAyLS40OC4xMy0uNjkuMzEtLjIuMi0uMy40NC0uMzEuNjloMXYzYy4wMi4yNy4xMS41LjMxLjY5LjIuMi40Mi4zMS42OS4zMWgxYy4yNyAwIC40OC0uMTEuNjktLjMxLjItLjE5LjMtLjQyLjMxLS42OUg4VjcuOTh2LjAxek03IDIuM2MtMy4xNCAwLTUuNyAyLjU0LTUuNyA1LjY4IDAgMy4xNCAyLjU2IDUuNyA1LjcgNS43czUuNy0yLjU1IDUuNy01LjdjMC0zLjE1LTIuNTYtNS42OS01LjctNS42OXYuMDF6TTcgLjk4YzMuODYgMCA3IDMuMTQgNyA3cy0zLjE0IDctNyA3LTctMy4xMi03LTcgMy4xNC03IDctN3oiIGZpbGwtcnVsZT0iZXZlbm9kZCIgLz48L3N2Zz4=)note
:::

::: {.admonitionContent_S0QG}
Type the following if you don't want to upgrade the kernel at the same
time:

::: {.language-sh .codeBlockContainer_Ckt0 .theme-code-block style="--prism-color:#F8F8F2;--prism-background-color:#282A36"}
::: {.codeBlockContent_biex}
``` prism-code
sudo ./scripts/reTerminal.sh --keep-kernel
```

::: {.buttonGroup__atx}
![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvbkljb25feTk3TiIgdmlld2JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTksMjFIOFY3SDE5TTE5LDVIOEEyLDIgMCAwLDAgNiw3VjIxQTIsMiAwIDAsMCA4LDIzSDE5QTIsMiAwIDAsMCAyMSwyMVY3QTIsMiAwIDAsMCAxOSw1TTE2LDFINEEyLDIgMCAwLDAgMiwzVjE3SDRWM0gxNlYxWiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvblN1Y2Nlc3NJY29uX0xqZFMiIHZpZXdib3g9IjAgMCAyNCAyNCI+PHBhdGggZD0iTTIxLDdMOSwxOUwzLjUsMTMuNUw0LjkxLDEyLjA5TDksMTYuMTdMMTkuNTksNS41OUwyMSw3WiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)
:::
:::
:::
:::
:::

You will see the following output if you have successfully installed the
drivers

![pir](http://files.seeedstudio.com/wiki/ReTerminal/driver-success.png)

- **Step 4.** Reboot the reTerminal

::: {.language-sh .codeBlockContainer_Ckt0 .theme-code-block style="--prism-color:#F8F8F2;--prism-background-color:#282A36"}
::: {.codeBlockContent_biex}
``` prism-code
sudo reboot
```

::: {.buttonGroup__atx}
![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvbkljb25feTk3TiIgdmlld2JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTksMjFIOFY3SDE5TTE5LDVIOEEyLDIgMCAwLDAgNiw3VjIxQTIsMiAwIDAsMCA4LDIzSDE5QTIsMiAwIDAsMCAyMSwyMVY3QTIsMiAwIDAsMCAxOSw1TTE2LDFINEEyLDIgMCAwLDAgMiwzVjE3SDRWM0gxNlYxWiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)![](data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iY29weUJ1dHRvblN1Y2Nlc3NJY29uX0xqZFMiIHZpZXdib3g9IjAgMCAyNCAyNCI+PHBhdGggZD0iTTIxLDdMOSwxOUwzLjUsMTMuNUw0LjkxLDEyLjA5TDksMTYuMTdMMTkuNTksNS41OUwyMSw3WiIgZmlsbD0iY3VycmVudENvbG9yIiAvPjwvc3ZnPg==)
:::
:::
:::

### Flash Raspberry Pi OS with drivers from seeed to eMMC[​](index.html#flash-raspberry-pi-os-with-drivers-from-seeed-to-emmc "Direct link to Flash Raspberry Pi OS with drivers from seeed to eMMC")

- **Step 1.** As with normal mirror burning steps, you need to select
  the device model first:

![pir](https://files.seeedstudio.com/wiki/ReTerminal/wiki1/01.png)

- **Step 2.** When choosing an operating system, you need to download
  the system you need, unzip it in the local folder, and then select it.

- **Download the Raspberry Pi OS by visiting the links below**

| Version                                                                                                                                                                    | Description                                        | TAG     |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------|---------|
| [2024-03-14-Raspbian-reTerminal-arm64](https://files.seeedstudio.com/wiki/ReTerminal/RPiOS_Images/2024-03-14-Raspbian-reTerminal/2024-03-14-Raspbian-reTerminal-arm64.zip) | 64bit Debian12(bookworm) Linux version 6.6.20      | lastest |
| [2024-03-14-Raspbian-reTerminal-armhf](https://files.seeedstudio.com/wiki/ReTerminal/RPiOS_Images/2024-03-14-Raspbian-reTerminal/2024-03-14-Raspbian-reTerminal-armhf.zip) | 32bit Debian12(bookworm) Linux version 6.6.20      | lastest |
| [2022-07-21-Raspbian-reTerminal-arm64](https://files.seeedstudio.com/wiki/ReTerminal/RPiOS_Images/2022-07-21-Raspbian-reTerminal-arm64/64bit-20220721T012743Z-001.zip)     | 64bit Debian11(Bullseye) Linux version 5.15.32-v7+ | release |
| [2022-07-21-Raspbian-reTerminal-armhf](https://files.seeedstudio.com/wiki/ReTerminal/RPiOS_Images/2022-07-21-Raspbian-reTerminal-arm64/32bit-20220721T012743Z-001.zip)     | 32bit Debian11(Bullseye) Linux version 5.15.32-v7+ | release |

  

![pir](https://files.seeedstudio.com/wiki/ReTerminal/wiki1/02.png)

Select the OS you downloaded, it should end in **.img**.

  

![pir](https://files.seeedstudio.com/wiki/ReTerminal/wiki1/03.png)

::: {.theme-admonition .theme-admonition-caution .alert .alert--warning .admonition_LlT9}
::: {.admonitionHeading_tbUL}
![](data:image/svg+xml;base64,PHN2ZyB2aWV3Ym94PSIwIDAgMTYgMTYiPjxwYXRoIGQ9Ik04Ljg5MyAxLjVjLS4xODMtLjMxLS41Mi0uNS0uODg3LS41cy0uNzAzLjE5LS44ODYuNUwuMTM4IDEzLjQ5OWEuOTguOTggMCAwIDAgMCAxLjAwMWMuMTkzLjMxLjUzLjUwMS44ODYuNTAxaDEzLjk2NGMuMzY3IDAgLjcwNC0uMTkuODc3LS41YTEuMDMgMS4wMyAwIDAgMCAuMDEtMS4wMDJMOC44OTMgMS41em0uMTMzIDExLjQ5N0g2Ljk4N3YtMi4wMDNoMi4wMzl2Mi4wMDN6bTAtMy4wMDRINi45ODdWNS45ODdoMi4wMzl2NC4wMDZ6IiBmaWxsLXJ1bGU9ImV2ZW5vZGQiIC8+PC9zdmc+)caution
:::

::: {.admonitionContent_S0QG}
If you install the latest bookworm version of the image. Do not going to
configure by clicking the advance option button. Do not enter this
interface for any initial configuration. Otherwise, unexpected driver
error situations may occur!!!

![pir](https://files.seeedstudio.com/wiki/ReTerminal/wiki1/notice.png)

If you accidentally make an advanced configuration and get a screen flip
error, you'll need to [reinstall the driver](index.html#jump1) to fix
the problem.
:::
:::

- **Step 3.** For other operations, refer to the [preceding
  steps](index.html#jump2). After the image is installed, you do not
  need to install the driver to use it. (The image we provide includes
  the driver file)

![pir](https://files.seeedstudio.com/wiki/ReTerminal/wiki1/04.png)

### reTerminal Disassemble Guide[​](index.html#reterminal-disassemble-guide "Direct link to reTerminal Disassemble Guide")

Please check the video below on how to disassemble reTerminal:

\>

## FAQ[​](index.html#faq "Direct link to FAQ")

For Frequently Asked Questions, [click
here](https://wiki.seeedstudio.com/reTerminal-FAQ) to visit the FAQs for
reTerminal Usage wiki

## Resources[​](index.html#resources "Direct link to Resources")

- **\[PDF\]** [reTerminal Schematics
  v1.6](https://files.seeedstudio.com/wiki/ReTerminal/reTerminal-v1.6_SCH.pdf)

- **\[ZIP\]** [reTerminal Schematics
  v1.6](https://files.seeedstudio.com/wiki/ReTerminal/reTerminal-v1.6_SCH.zip)

- **\[PDF\]** [reTerminal Schematics
  v1.3](https://files.seeedstudio.com/wiki/ReTerminal/reTerminal-v1.3_SCH.pdf)

- **\[ZIP\]** [reTerminal Schematics
  v1.3](https://files.seeedstudio.com/wiki/ReTerminal/reTerminal-v1.3_SCH.zip)

- **\[STP\]** [reTerminal 3D
  Model](https://files.seeedstudio.com/wiki/ReTerminal/resources/reTerminal-3d-model.stp)

- **\[PDF\]** [Raspberry Pi Compute Module 4
  Datasheet](https://datasheets.raspberrypi.org/cm4/cm4-datasheet.pdf)

- **\[Web Page\]** [Raspberry Pi Official
  Documentation](https://www.raspberrypi.org/documentation/)

## Tech Support & Product Discussion[​](index.html#tech-support--product-discussion "Direct link to Tech Support & Product Discussion")

Thank you for choosing our products! We are here to provide you with
different support to ensure that your experience with our products is as
smooth as possible. We offer several communication channels to cater to
different preferences and needs.

::: {.button_tech_support_container}
[](https://forum.seeedstudio.com/)[](https://www.seeedstudio.com/contacts)
:::

::: {.button_tech_support_container}
[](https://discord.gg/eWkprNDMU7)[](https://github.com/Seeed-Studio/wiki-documents/discussions/69)
:::
:::

::: {.theme-doc-footer-edit-meta-row .row}
::: {.col}
[![](data:image/svg+xml;base64,PHN2ZyBhcmlhLWhpZGRlbj0idHJ1ZSIgY2xhc3M9Imljb25FZGl0X1o5U3ciIGZpbGw9ImN1cnJlbnRDb2xvciIgaGVpZ2h0PSIyMCIgdmlld2JveD0iMCAwIDQwIDQwIiB3aWR0aD0iMjAiPjxnPjxwYXRoIGQ9Im0zNC41IDExLjdsLTMgMy4xLTYuMy02LjMgMy4xLTNxMC41LTAuNSAxLjItMC41dDEuMSAwLjVsMy45IDMuOXEwLjUgMC40IDAuNSAxLjF0LTAuNSAxLjJ6IG0tMjkuNSAxNy4xbDE4LjQtMTguNSA2LjMgNi4zLTE4LjQgMTguNGgtNi4zdi02LjJ6IiAvPjwvZz48L3N2Zz4=)Edit
this
page](https://github.com/Seeed-Studio/wiki-documents/blob/docusaurus-version/docs/Edge/Raspberry_Pi_Devices/HMI/reTerminal/reTerminal.md)
:::

::: {.col .lastUpdated_vwxv}
Last updated on **Jan 31, 2023** by **jianjing Huang**
:::
:::
