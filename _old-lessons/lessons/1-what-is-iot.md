# Intro to the Internet of Things

![Artificial intelligence can revolutionize the Internet of Things.](https://d3i2s57s2jetfw.cloudfront.net/wp-content/uploads/2022/01/98273dcb77c1fbf47f9cfe09a939fc4f-1200x0-c-default.jpeg)
Image: © Irina Strelnikova / Adobe Stock

## Internet of Things (IoT)

The **Internet of Things (IoT)** is comprised of equipment, machines, products, and devices that are connected to the cloud and **periodically collect, send and/or receive data.**

> **IoT** refers to the **entire network** of:
> 
> - physical devices,
> - tools,
> - equipment, and
> - smart objects
> 
> These objects have the capability to **collect and share data** about:
> 
> - how they are used
> - the environment around them
>
> IoT devices can also **receive commands or updates** via the cloud.


## Why collect all this data?

By analyzing the data collected by these connected objects, users and organisations can make informed decisions in near real-time and automate tightly integrated processes. This avoids decision making based on limited or out-dated data. 

This data can create quick feedback loops for automation. Data from one object can trigger actions or control several other objects with timing and precision that could not be achieved by humans.  

## IoT Examples

The use of IoT can be organised in two fields of application:

- **Industrial IoT (IIoT)**
- **Consumer IoT**

![Examples of industrial and consumer iot applications](1-iot-intro-industrial-vs-consumer.png)
<p class=img-info>
<a href="https://www.kuritaamerica.com/the-splash/the-internet-of-things-and-its-benefit-to-us-water-customers"> The Internet of Things and its Benefit to U.S. Water Customer </a> &nbsp; in kuritaamerica.com</p>

### Consumer IoT

Examples of consumer IoT are:

- **Home Security**: Sensors, alarms, cameras, lights, and microphones provide 24/7 security and surveillance. All of which can be controlled from a smart phone.

- **Smart Home**: Smart lighting, heating and sound systems can be automated to detect human present or receive instructions remotely. Voice Assistants can also control house appliances or and provide information.

- **Wearables:** Smartwatches and fitness trackers can monitor blood pressure or heart rate, and physical activity and suggest workouts, breaks or medical assistance.

- **Appliances:** Smart fridges can keep track of food quantities and expiry dates and create shopping lists accordingly. Smart outlet plugs can measure electrical consumption and turn other appliances on/off.


### Industrial IoT (IIoT)

Most people tend to first think of IoT as consumer devices. However, **their main value added happens in industrial applications.** 

![](https://miro.medium.com/max/1400/1*VKScdttTvAJZ7n663OwGPw.jpeg)

<p class=img-info>
<a href="https://medium.com/@jaydev_21091/how-industrial-internet-of-things-are-impacting-our-lives-8af4163530ce">How Industrial Internet of Things are impacting our lives</a> by Bluechip Infocorp Pvt Ltd via Medium.
</p>

Industrial IoT Examples:

- **Equipment Maintenance:** [Rolls-Royce’s Total Care](https://www.rolls-royce.com/media/press-releases/2016/11-07-2016-rr-takes-totalcare-digital-with-microsoft-and-singapore-airlines.aspx) provides a suite of predictive maintenance and repair services for its jet engines, including monitoring engine health, and modifying engines to increase reliability and durability.

- **Farming:** [John Deere](https://www.iotforall.com/ces-2021-john-deere) is building intelligence into its large tractors and sprayers through sensors that make the machines into mobile platforms capable of self-driving.

- **Heavy Machinery & Transportation:** [Rio Tinto](https://www.iotforall.com/iot-is-reshaping-heavy-industry), a global mining company uses a remote command center to orchestrate the actions of huge drills, excavators, trains, and trucks across multiple mining sites.

- **Renewable Energies:** [Iberdrola and Siemens](https://www.nsenergybusiness.com/features/iot-wind-power/) are using IoT to optimize the operation and maintenance of offshore wind power farms, the lifetime extension of wind turbines and the reducing the cost of energy.

- **Facilities Management:** Monitoring of buildings, infrastructure, and other spaces, allow to improve energy efficiency, space utilization, productivity, and safety. These insights may help:
	- save money by automating lighting or optimizing heating and cooling cycles.
	- Increase employee or occupant satisfaction by keep equipment running or ensuring that supplies are stocked.


## High-level Components of an IoT System

IoT systems are compromised of five high-level components:

1.  **Sensors**:
	- Collect data from the device's environment (eg. velocity, GPS coordinates, temperature, etc).
	- Sensors might use different communication protocols.

2. **IoT Devices** are computing devices that have:
	- Ability to securely register with the cloud;
	- Connectivity options for sending and receiving data with the cloud.

3. **Cloud Gateway / Hub**:
	- Securely ingests and sends data or commands to devices;
	- Offers device management (provisioning) services (add, remove, update, group, etc).

4. **Data Processing:** 
	- Data validation;
	- Integrate with **business processes** (check thresholds, send alerts, trigger action)
	- Place data in **Storage**;
	- Retrieve data from **Storage** for deeper / long-term analysis;

5.  **User Interface:**
	- Data visualization;
	- Trigger manual actions;
	- Configure automatic actions;
	- Facilitate device management.


![Icons of IoT High level components](../assets/iot-high-components.png)


## IoT Cloud Service Providers

Since IoT objects typically move around, connectivity and data collection need to happen over wide geographical areas.

Most companies do not want to deal with setting-up the **physical infrastructure and software** required to have this level of distributed connectivity and reliability (servers, databases, backup systems, networking, container orchestration, etc).

It is typically far more practical and cost-effective to use the services of an established IoT Cloud Service Provider.

The three main Cloud Service Providers in the IoT space are: 

- **Amazon Web Services (AWS)**
- **Microsoft Azure**
- **Google Cloud**

![](1-iot-intro-cloud-service-providers.png)

There are many other Cloud providers such as [IBM Cloud IoT](https://www.ibm.com/cloud/internet-of-things) and [Oracle IoT](https://www.oracle.com/internet-of-things/).

> In this course we will focus on **Microsoft Azure**.
> However, all three platforms offer similar functionality.


## Exercises

1. Read the Microsoft training module [**Examine the architecture of an IoT solution**](https://learn.microsoft.com/en-us/training/modules/introduction-iot-solution-architecture/)  and complete the Moodle quiz on the module.


## Diving Deeper

Video (15:19): **The 7 Principles of the IoT by Tom Bradicich**

- In depth explanation of the integration between IoT sub-systems and opportunities from a technical and business perspective.

<iframe width="560" height="315" src="https://www.youtube.com/embed/u3IaXvjDiOE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>


## References
1. [What is IoT](https://azure.microsoft.com/en-us/overview/internet-of-things-iot/what-is-the-internet-of-things/) by Microsoft Azure.
2. [How Industrial Internet of Things are impacting our lives](https://medium.com/@jaydev_21091/how-industrial-internet-of-things-are-impacting-our-lives-8af4163530ce) by Bluechip Infocorp Pvt Ltd via Medium.
3. [An Introduction to the Internet of Things](https://www.freecodecamp.org/news/introduction-to-iot-internet-of-things/) by Pier Paolo Ippolito via FreeCodeCamp Blog.
