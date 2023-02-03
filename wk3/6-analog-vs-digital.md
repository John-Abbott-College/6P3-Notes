# Analog & Digital Signals

We will use analog and digital signals to communicate with sensors.

This section briefly compares these two types of signals and illustrates how we might encounter while using IoT hardware.

To compare analog and digital signals, let's look at how we can track 3 different sources of information:

- Temperature
- Sound
- Electricity (voltages)


## Analog: the natural world

We live in an analog world. Most of the naturally occurring events that we experience happen in an analog form.

> Analog signals varies continuously in time and amplitude.
> 
> This means that changes happen over a range of values with infinite "in between" steps. 

For example, the following events have an infinite number of transitions. It only depends on how accurately you can track them:

- The colors in a rainbow.
- The position of a swinging pendulum.
- The exact time of the day.


### Temperature

The A/C and heating systems in a house are typically activated once the temperature reaches some minimum and maximum values.

The chart below is tracking the temperature in a room as the A/C and heating systems are activated over a few days.

![](assets/6-analog-digital-analog-temperature.png)
<p class=img-info>
	<a href="https://info.sparkfun.com/hubfs/Poster%20Downloads/Analog%20vs%20Digital/Concept%20Poster%20Analog%20vs%20Digital%20WEB.pdf"> Temperature changes over time </a>&nbsp; Adapted from poster: Analog and Digital Signals by Digikey.
</p>

Let's say the maximum temperature reached in the room is 30C and the minimum temperature is 15C. A person in the room would have observed every possible temperature in between that range (15.01, 15.0101, 15.0102, 15.01021, etc).

The change in temperature produces analog information since it is changing over an infinite range of values.


### Sound

Sound is also an example of an analog signal.

When a volume of air is displaced quickly, air molecules are compressed against each other creating a high-pressure region. The high pressure region expands and compresses the air in the neighbouring area. Sound can travel thanks to this "chain effect".

> By observing how the air pressure changes over time, we can draw a sound wave.
>
> This is how speakers and microphones interact with air to generate sound.

![Animation of acoustic wave travelling in air](http://resource.isvr.soton.ac.uk/spcg/tutorial/tutorial/Tutorial_files/longipatm.gif)
<p class=img-info>
	<a href="http://resource.isvr.soton.ac.uk/spcg/tutorial/tutorial/Tutorial_files/Web-basics-sound.htm"> Sound waves travelling through air </a>&nbsp; - Waves and Acoustics Animations by isvr.
</p>

Sound waves are also an example of an analog signal because the amplitude of the wave transitions through the entire range of possible values between the Min and Max.


### Analog Signals Graphs

A signal varies over time. It's helpful to plot it on a graph where time is plotted on the horizontal, _x_-axis, and the value being tracked on the vertical, _y_-axis.

Looking at a graph of a signal is usually the easiest way to identify if it's analog or digital.

> When dealing with electricity we track voltage levels (amplitude).
> 
> A time-versus-voltage graph of an analog signal should be **smooth** and **continuous**.


[![Analog Sine Wave](https://cdn.sparkfun.com/assets/3/7/6/6/0/51c48875ce395f745a000000.png)](https://cdn.sparkfun.com/assets/3/7/6/6/0/51c48875ce395f745a000000.png)

While these signals may be limited to a **range** of maximum and minimum values, there are still an infinite number of possible values within that range.

For example, the analog voltage coming out of your wall socket oscillates between -120V and +120V. As you increase the resolution more and more, you discover an infinite number of values that the signal can actually be (64.4V, 64.42V, 64.424V, and other increasingly precise values).


## Digital: discrete values

Digital signals are discrete, which means that at any given moment, the signal strength must be represented by a integer number. There are no half numbers.

Typically, digital signals will be one of **two values**, a high voltage and a low voltage.

> The specific values of the **high** and **low** voltages depend on the hardware being used.

Below is a the timing graph of a signal whose **low voltage is 0 volts** and **high voltage is 5 volts**.

This type of signal is also known as a **square waves**.

[![Square wave signal. Two values, either 0V or 5V.](https://cdn.sparkfun.com/assets/c/8/5/b/e/51c495ebce395f1b5a000000.png)](https://cdn.sparkfun.com/assets/c/8/5/b/e/51c495ebce395f1b5a000000.png)
<p class=img-info>
	<a href="https://learn.sparkfun.com/tutorials/analog-vs-digital/all"> 0 to 5 volt "pulses" forming a square ware </a>&nbsp; - Analog vs. Digital by Digikey.
</p>

### Digital Simulating Analogue

A digital signal might be a discrete representation of an analog waveform.

Viewed from afar, the wave function below may seem smooth and analog, but when you look closely there are tiny discrete **steps** as the signal tries to approximate analog values.


[![Digital Sine Wave](https://cdn.sparkfun.com/assets/0/2/8/4/6/51c85fbece395fbc03000000.png)](https://cdn.sparkfun.com/assets/0/2/8/4/6/51c85fbece395fbc03000000.png)
<p class=img-info>
	<a href="https://learn.sparkfun.com/tutorials/analog-vs-digital/all"> Oscillating voltage from -120V to 120V represented as a digital signal </a>&nbsp; - Analog vs. Digital by Digikey.
</p>

The number of **discrete steps** that a digital signal can use depends on how many bits are available for each recorded value. This is also called **bit resolution** (see *Sampling* below).

For example, if a data point can only use one bit of definition, then it can only track on/off states, resulting in the red square wave seen above.

However, if a data point can use 8 bits to store a value, then it can represent a value ranging from 0 to 255 (see the green sinusoidal voltage wave above).


## Analog to Digital Conversion (ADC)

If most natural events are analog, how do we represent them in digital format?
For example, if audio is analog, how can we get a computer to play music?

> An **analog to digital converter (ADC)** is a device that can read a analog signal and generate a digital representation of this signal.

ADC's are specific to the type of analog signal they are trying to read (sound, voltage, temperature, light, etc).

Referring to the room temperature example used earlier, if we used a digital thermometer to record the temperature, our graph might look like the following:

![](assets/6-analog-digital-temp-sampling.png)
<p class=img-info>
	<a href="https://info.sparkfun.com/hubfs/Poster%20Downloads/Analog%20vs%20Digital/Concept%20Poster%20Analog%20vs%20Digital%20WEB.pdf"> Temperature represented as a digital reading </a>&nbsp; Poster: Analog and Digital Signals by Digikey.
</p>

In the example above, a digital temperature reading was taken **every 3hr**.

> The digital signal representation of the temperature **is not smooth or accurate**. 
> 
> However, depending on the application **it might be sufficient**.

To make the signal smoother or more representative of the real analog signal we need to take samples more regularly (eg. every 1min).

The process of reading an analog signal over time to generate its digital representation is called **sampling.**


## Sampling

Sampling is the process of inspecting the value of an analog signal at regular time intervals.


When an ADC is sampling an analog signal, there are two variables that will characterize the digital output:

- Sampling rate.
- Bit resolution.


> **Music sampling**
> Some music genres like rap and hip-hop commonly sample song segments from other artists to play in the background.
> 
> - The term **sampling** is used because traditionally song segments were extracted from vinyl records which produce analog sound and saved in digital formats.


<iframe width="560" height="315" src="https://www.youtube.com/embed/hT_2kUx0AcQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>


### Sampling rate

The time between samples is the **sample period** (T, in seconds), and the number of samples taken per second is the **sample frequency or sample rate** (fs, in samples/second or Hz).

Basically, **sampling is taking snap-shot values of the analog signal at regular time intervals.** 

![Analog signal showing sample period and sample frequency](assets/6-analog-digital-sample-period.png)
<p class=img-info>
	<a href="https://www.usna.edu/ECE/ec312/Lessons/wireless/EC312_Lesson_20_Analog_to_Digital_Course_Notes.pdf"> Sample period and fequency for an electric signal </a>&nbsp; - US Naval Academy.
</p>

**Sampling period examples:**

- If a signal is sampled every half second (0.5s sampling period, ***T***), the sample frequency (***f****) is 1/0.5s = 2 Hz (times per second).
- If the sample frequency (***f***) is 2000 Hz, the sampling period (***T***) is = 1/2000Hz = 0.0005 secs (0.5 milliseconds).

The higher the sample rate, the more accurate the digital signal is.

![Signals of increasing sample rate](assets/6-analog-digital-increasing-sample-rate.png)
<p class=img-info>
	<a href="https://www.usna.edu/ECE/ec312/Lessons/wireless/EC312_Lesson_20_Analog_to_Digital_Course_Notes.pdf"> Same signal sampled with different sample rates </a>&nbsp; - US Naval Academy.
</p>

### Encoding & Bit resolution

Encoding is the process of mapping the sampled analog signal value to discrete binary numbers (digital information).

> ADC devices are characterized by the **number of bits available** to represent a signal.

For example, consider an electrical signal that ranges **from -1 volts to to +1 volts** and must be converted to a **3 bit number**.

### Encoding Procedure

To approximate the numeric conversion from a voltage signal to a digital output, follow the steps below:

1. Identify the minimum and maximum voltage values that can be observed in the input.
	- Example: -1 to +1 volts (2 volt range)

 
2. Identify the minimum and maximum binary values that can generated as the output. Note the amount of unique numbers represented by this range
	- Example: For a 3-bit number: 000 (decimal 0) is the minimum and 111 (decimal 7) is the maximum, making a total of 8 unique numbers. 

 
3. Divide the voltage range that will be observed (max voltage - min voltage) by the amount of unique binary numbers available. This will determine the voltage increment that each binary number represents.
	- Example: (+1V - (-1V)) / 8 = 2V/8 = 0.25V

 
4. Layout each binary number and their increments and read where the voltage values lie.


Assuming the ADC has a resolution of 3 bits, all voltage values (-1V to 1V) must be represented with at most 3 bits, or 2^3 = 8 unique values (0 is a unique value).

![voltage signal converted to a bit resolution of 3 bits](assets/6-analog-digital-bit-resolution.png)
<p class=img-info>
	<a href="https://www.usna.edu/ECE/ec312/Lessons/wireless/EC312_Lesson_20_Analog_to_Digital_Course_Notes.pdf"> Voltage signal between -1V and 1V converted to digital with a 3 bit resolution </a>&nbsp; - US Naval Academy.
</p>

In this case:
- 000 is assigned to the voltages from -0.75 V to -1.0 V,
- 001 is assigned to the voltages from -0.5 V to -0.749 V,
- 010 is assigned to the voltages from -0.25 V to -0.49 V,
- and so on.

The binary representation of the above signal is:

110 101 100 011 011 100 110 110 100 010 000 000 001

If the sampling is happening 2000 times per second (Hz) and for every sample we generate 3 bits, we are generating 2000 x 3 bits = 6000 bits/sec of information. This is also know as the bitrate.

If a song of 3 minutes is sampled with the same specs, how big will this file be in kB?

What is the [bitrate of music on Spotify](https://www.tunefab.com/tutorials/spotify-bitrate.html)?


### Sensor voltages & bit resolution

IoT systems typically work with electrical signals encoded in voltage levels.

Every hardware that converts from analog to digital (and vice-versa) needs to have an appropriate ACD device.

Microcontrollers are often used to process these signals because they often have an integrated ACD and they are very inexpensive.


## Exercises

### Exercise 1

Considering the analog signal below. The signal is being sampled in a program at 2Hz (2 times/sec) with the help of an ADC that has 6-bit resolution. The ADC can handle up to 8V signals.

A) What are the voltages being sampled by the ADC?

B) If the signal reached max voltage, what would be the integer number passed to the program by the ADC?


![Graph for exercise 1](assets/6-analog-digital-exercise1.png)


<details>  
<summary>Solution</summary>
<p>a) Sampled voltages: 4, 6, 6, 0, 2, 2, 2, 5, 6, 4</p>
<p>b) Since the ADC has a 6-bit resolution, it can represent values up to 63 (all 6 bits ON at the same time). Max voltage would result in the integer 63.</p>
</details>

## References
- [Analog vs. Digital](https://learn.sparkfun.com/tutorials/analog-vs-digital/all) by Sparkfun.
- [Lesson 20: Analog to Digital Conversion](https://www.usna.edu/ECE/ec312/), Course EC312, US Naval Academy.
- Lessons 4 and 5, Telecom course, Sandy Bultena.

### Video Reference

<iframe width="560" height="315" src="https://www.youtube.com/embed/64FSgQdWHrE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<!-- 
## Diving Deeper

### Is digital better?

#### Noise: digital can handle it -->

