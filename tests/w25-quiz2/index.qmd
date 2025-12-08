---
title: Quiz 2
subtitle: >
  Two questions covering some key course material in a short, open-book quiz.
categories: [bash, linux, python, iot]
date: 2025-05-05
format: pdf
---

## Questions

For each of the questions below, write the answer on the sheet provided.

### Analog to digital conversion

The graph below shows the voltage measured on the y-axis of an Analog Joystick.
The signal is being sampled in a program at **0.5Hz (1 time every 2 seconds)** with the help of an ADC that has an **8-bit** resolution.
This ADC can handle up to 8V signals.

![Graph for exercise 1: Y-axis voltage as a function of time. For example, the voltage reading after 0.5 seconds is 4V.](assets/6-analog-digital-exercise1.png)

\newpage

::: {.callout-note}
## Q1. Starting from Time 0, what are the readings measured in volts?
\vspace{0.25in}
:::

::: {.callout-note}
## Q2. Starting from Time 0, what values does the ADC convert these readings to?
\vspace{0.25in}
:::

::: {.callout-note}
## Q3. Draw on the provided graph the values of the ADC readings
(your answer should be on the graph itself).
:::

::: {.callout-note}
## Q4. Using the drawing you've made, you should see that the ADC has not captured the movement of the joystick accurately. Why not? What fix can be made to the program reading the signal?
\vspace{0.9in}
:::

::: {.callout-note}
## Q5. There is no way that these measurements could have been taken on our reTerminal -- why not?
\vspace{0.9in}
:::

::: {.callout-note}
## Q6. If these readings were to be used in an IoT system, why would MQTT be a better choice than HTTP for the communication protocol? Give a few reasons.
\vspace{0.9in}
:::


## Practical exercise

The following exercises are meant to see if you've been making use of the `bash`, `python`, and `venv` skills we've learned in class.

1. Complete the following steps:

    1. Create a new folder on your developer environment (WSL or OSX) named `quiz2`
    1. Use a virtual environment to install the following libraries:
        - [grove.py](https://github.com/Seeed-Studio/grove.py) -- install the source code from github.
    1. Create a file called `config.sh`. This file should:
        - contain the key/value pair `USER=<your username>`
    1. Create a file called `script.py`. This file should:
        - be executable and have a shebang that uses the environment python
        - have a `main` function that runs when you run `python script.py`
        - read the values from `config.sh` and use the USER key to determine:
            - if `USER==<your username>`:
                - run a `grove.adc` that returns random values at a sampling frequency of 1Hz.
            - In any other case
                - run a `grove.adc` that returns the result of reading the ADC at address 0x04 and bus 1 at a sampling frequency of 1Hz.
    1. Create a `requirements.txt` containing any dependencies you installed for this project.

1. Create a compressed `tar.gz` archive of your solutions for the above exercise. Include the following files:

    1. `config.sh`
    1. `script.py`
    1. `requirements.txt`
    1. DO NOT include the virtual environment!

1. Submit the `tar.gz` file on Moodle (Quiz 2).



### Hints

- With a sampling frequency of 0.5Hz, and a total time of 5 seconds, there should be **3** readings (including time 0).
- The ADC will convert 0 to 0, and the maximum voltage (8V) to the largest number it can fit in its resolution (8-bits).
- A hint for drawing the ADC conversion on the graph will be provided in class
- Assume the program doing the readings is written in python, with a loop that takes a reading that waits for some amount of time to pass using the `time.sleep()` function.
- Hints about useful course material to review for both parts of this quiz will be provided in class on the whiteboard.
