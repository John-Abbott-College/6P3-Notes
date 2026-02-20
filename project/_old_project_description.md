**NOTES:**

- The document below is a copy of the Final Project we ran in Winter 2025  
- Some goals:  
  - (obviously) MAUI \-\> React  
  - Move away from Google Docs (discoverability for students and teacher)  
    - Connected Objects milestones will be here: [https://john-abbott-college.github.io/6P3-Notes/project/](https://john-abbott-college.github.io/6P3-Notes/project/)   
    - App Dev milestones will be: ?  
    - Connected Objects device information wil be here: [https://john-abbott-college.github.io/6P3-Notes/lectures](https://john-abbott-college.github.io/6P3-Notes/lectures)   
  - Reword for big picture  
    - This project used to be “make sustainability containers” project, and is now somewhere between that and a completely open-ended “make an phone app and a reterminal app”  
    - Idea: 4 month internship-style project with exploration/prototyping/conception/delivering built in  
    - E.g. the User Profiles section could be more flexible to not be “2 different types of users” but some defined differentiation between categories of users  
  - Milestone deliverable reworking  
    - Project Setup and Proposal: should include github repository workshops, setting up CI/CD, documentation instead of producing a proposal document  
    - Connected objects side: needs to be clearer the distinction/difference between A1/A2 and M4/M5  
    - Presentation and Project Wrapup: what do we want to see delivered in the end?  
      - idea for presentation:   
        - team of 3 should have 3 reterminals and the app should work on all of their devices (android/IOS)  
        - Michael & Vik should be able to add a 4th reterminal by following student instructions documentation, and download the app on their phone to use it  
          

# Final Project : Internet of Things 

1. 📝 **Worth:**   

   35 % Connected Objects

   50% Application Development III

2. **📅 Due:** Multiple milestones across March \- May 2025  
3. 📥 **Submission**: Live Demos \+ Submission through Github  
4. 🤝👥: Team work (team size : 3\)   
5. 🤓 **Teachers:** Michael Haaf & Youmna Badawy

---

[**Introduction	4**](#introduction)

[**Overall requirements	4**](#overall-requirements)

[Cloud infrastructure	4](#cloud-infrastructure)

[User profiles	5](#user-profiles)

[Mobile App	5](#mobile-app)

[Hardware requirements	6](#hardware-requirements)

[Hardware List	6](#hardware-list)

[**Project Milestones	8**](#project-milestones)

[Milestone 1: Initial project setup (March 10\)	10](#milestone-1:-initial-project-setup-\(march-10\))

[Repository & Team Contact	10](#repository-&-team-contact)

[Project Idea Brainstorm	10](#project-idea-brainstorm)

[Milestone 2: Project proposal (March 24\)	11](#milestone-2:-project-proposal-\(march-24\))

[Context	11](#context)

[User needs	11](#user-needs)

[Proposed solution	11](#proposed-solution)

[Hardware subsystems	11](#hardware-subsystems)

[Screen Design	11](#screen-design)

[Epic User Stories	12](#epic-user-stories)

[Rubric	12](#rubric)

[Milestone 3: App Design (April 7\)	13](#milestone-3:-app-design-\(april-7\))

[Introduction	13](#introduction-1)

[App Setup	13](#app-setup)

[Link to GitHub	13](#link-to-github)

[Project Organization	13](#project-organization)

[What you do not need to implement	13](#what-you-do-not-need-to-implement)

[Project Tracking	14](#project-tracking)

[Architecture	14](#architecture)

[Models	14](#models)

[Views	14](#views)

[Data Repos	15](#data-repos)

[Code Quality	15](#code-quality)

[Testing on iOS	15](#testing-on-ios)

[Comments and Documentation	15](#comments-and-documentation)

[Deliverables	16](#deliverables)

[Video Submission	16](#video-submission)

[Grading Rubric	16](#grading-rubric)

[Milestone 4: Subsystem implementation (May )	17](#milestone-4:-subsystem-implementation-\(may-\))

[Milestone 5: IoT Hub App integration (May 16\)	17](#milestone-5:-iot-hub-app-integration-\(may-16\))

[Book time Demo IoT Hub connection	17](#book-time-demo-iot-hub-connection)

[Introduction	17](#introduction-2)

[Pre-requisites	18](#pre-requisites)

[Authentication	18](#authentication)

[Connection to Azure IoT Hub	18](#connection-to-azure-iot-hub)

[Fixed Values	19](#fixed-values)

[Handling multiple devices	19](#handling-multiple-devices)

[Use of Data Repositories	19](#use-of-data-repositories)

[Use of View Models (if applicable)	20](#use-of-view-models-\(if-applicable\))

[Error handling	20](#error-handling)

[Update of Data Models	20](#update-of-data-models)

[Display of Data	20](#display-of-data)

[Code Quality & Comments	21](#code-quality-&-comments)

[Deliverables	21](#deliverables-1)

[Grading Rubric (20 points)	21](#grading-rubric-\(20-points\))

[**Milestone 6: Final Presentation (May 20-22)	23**](#milestone-6:-final-presentation-\(may-20-22\))

      [Booking Link Final Demo 45 min	23](#booking-link-final-demo-45-min)

[Deliverables	23](#deliverables-2)

[App Dev III milestone	23](#app-dev-iii-milestone)

[IoT Hub Communication	23](#iot-hub-communication)

[App Advanced Views	24](#app-advanced-views)

[App should display all basic telemetry data. This includes any missed data in Milestone 5 or sensor which wasn’t functioning properly.	24](#heading)

[Display of historical data:	24](#heading)

[● Since saving data in a storage is optional, you may use events in the Event Hub partition as historical data.	24](#heading)

[● Finalize all views that display historical data. Data can be displayed in different formats depending on your app design. Here are some examples:	24](#heading)

[○ Graphs.	24](#heading)

[○ Data grids.	24](#heading)

[○ Maps.	24](#maps.)

[**Documentation (Due on May 28\)	24**](#documentation-\(due-on-may-28\))

[1\. This may also include automated rules when certain readings reach thresholds to automatically activate a given actuator.	25](#this-may-also-include-automated-rules-when-certain-readings-reach-thresholds-to-automatically-activate-a-given-actuator.)

[Grading Rubric	26](#grading-rubric-\(total-30\))

# Introduction {#introduction}

In this capstone project, you will work on prototyping a complete IoT solution which will include connected hardware with an app that will solve a particular need. You must first start by identifying a need that could be resolved using the technology stack learnt in the courses. You must then segment the project into sub-parts that you will spend the remaining weeks implementing and testing with your team. 

# Overall requirements  {#overall-requirements}

The IoT solution will use the following tech stack:

* reTerminal as the computing device (IoT "thing").  
* Python as the on-device programming language.  
* Microsoft Azure as the cloud infrastructure and IoT gateway.  
* .NET and Maui for developing a user interface application for both Android and iOS

## Cloud infrastructure  {#cloud-infrastructure}

The hardware (reTerminal and other devices) and the mobile application will connect using Azure infrastructure as illustrated below:  
![][image1]  
*Figure 1: Cloud infrastructure used for the final project*

## 

## User profiles {#user-profiles}

Your project must include at least two different user profiles that will operate the system. Each user profile will have different needs and will have access to only the functionalities that suit those needs. Each user will view, control and use different sensors and actuators based on their needs.   
For example, if you are designing a smart indoor farming solution, there is the farmer taking care of the plants, and there is the owner or administrator focusing on the security of the farm. 

## Mobile App {#mobile-app}

As shown in Figure 1, in the Cloud Infrastructure section, the mobile app represents the backend of the developed IoT solution. The objective is to provide access to the various operations possible to the different users. Below is a summary of the functionalities the mobile app must provide:

* Remote access and control of the various hardware components  
* Provide different access based on the user profile  
* Allow personalization by the user (saving user preferences, notifications, alerts, monitoring rules, etc)  
* Dashboard to display overall activities registered by the sensors, registered events, etc.  
* Data representation in an intuitive way: view and track data changes over time about the various systems  
* If your solution includes monitoring certain values (for example water levels) , it must allow the user to set those preferences and save them.   
* Support iOS and Android Stores. 


## 

## Hardware requirements  {#hardware-requirements}

Your solution must include 3 independent sub-systems, each responsible for controlling and reading a set of actuators and sensors. Each sub-system should be responsible for a set of actuators and sensors. The following section includes an extensive list of sensors.

## Hardware List {#hardware-list}

The following list contains most of the available hardware, but additional devices might be also available. 

| Component & DocumentationRefer to these for hardware specifications and circuit/pin/bus reference. Software may not be relevant. | Interface Type | Relevant Libraries Refer to these for suggested python libraries to use to interface with the device | Examples Refer to these for similar examples to us in class (python on Raspberry Pi). This is a better starting point than other online sources, since the sensors/actuators we use are used on a wide variety of hardware.  |
| :---- | :---- | :---- | :---- |
| [Water Level Sensor \*](https://www.waveshare.com/wiki/Liquid_Level_Sensor) | Analog | [ADC library for Grove Base Hat](https://github.com/Seeed-Studio/grove.py/blob/master/grove/adc.py) (Github) | See use of ADC in [Lab 3](https://docs.google.com/document/d/1-H11p5e-HsdLQ4isPcim3jEzQ005bsckOcPwPpzzdTI/edit?usp=sharing) |
| [Soil Moisture Sensor \*](https://wiki.seeedstudio.com/Grove-Capacitive_Moisture_Sensor-Corrosion-Resistant/) | Analog | [ADC library for Grove Base Hat](https://github.com/Seeed-Studio/grove.py/blob/master/grove/adc.py) (Github) | See use of ADC in [Lab 3](https://docs.google.com/document/d/1-H11p5e-HsdLQ4isPcim3jEzQ005bsckOcPwPpzzdTI/edit?usp=sharing) |
| [RGB Led Stick](https://wiki.seeedstudio.com/Grove-RGB_LED_Stick-10-WS2813_Mini/#docusaurus_skipToContent_fallback) | PWM | [grove\_ws2813\_rgb\_led\_strip.py](https://github.com/Seeed-Studio/grove.py/blob/master/grove/grove_ws2813_rgb_led_strip.py) module from Grove.py package. | See module source code.Alternatively, see [NeoPixels on Raspberry Pi](https://learn.adafruit.com/neopixels-on-raspberry-pi/overview) for using NeoPixel CircuitPython library with the Blinka compatibility layer. |
| [Cooling Fan](https://abra-electronics.com/thermal-management/fans/dc-fans-5v/5v-cooling-fan-40mm-x-10mm.html) | Digital | Controlled via relay module | See [fan and relay in Lab 4](https://docs.google.com/document/d/1M3LKarz0A299S5vM3ysqtHiEnGWiEEBzVWy4iCj3lYc/edit?usp=sharing) |
| [AHT20 Temp & Humidity Sensor \*](https://wiki.seeedstudio.com/Grove-AHT20-I2C-Industrial-Grade-Temperature%26Humidity-Sensor/) | I2C | [Grove\_temperature\_humidity\_aht20.py](https://github.com/Seeed-Studio/grove.py/blob/master/grove/grove_temperature_humidity_aht20.py) from Grove | See use of [AHT20 Lab 4](https://docs.google.com/document/d/1M3LKarz0A299S5vM3ysqtHiEnGWiEEBzVWy4iCj3lYc/edit?usp=sharing) |
| [GPS (Air530)](https://wiki.seeedstudio.com/Grove-GPS-Air530/)  | Serial | [pyserial](https://pythonhosted.org/pyserial/shortintro.html) to read serial data. [pynmea2](https://github.com/Knio/pynmea2) to parse gps messages | [Location tracking](https://github.com/microsoft/IoT-For-Beginners/tree/main/3-transport/lessons/1-location-tracking) by Microsoft This is a general summary of how long/lat measurement works, the important/relevant example is in a sublink called “[Single-board computer \- Raspberry Pi](https://github.com/microsoft/IoT-For-Beginners/blob/main/3-transport/lessons/1-location-tracking/pi-gps-sensor.md)” |
| [USB Power Bank](https://www.amazon.ca/INIU-Portable-External-Powerbank-Compatible/dp/B07G34JZG2/ref=sr_1_5?crid=R0AZJWGG4977&dchild=1&keywords=usb+battery+pack&qid=1635955800&sprefix=usb+battery+%2Caps%2C188&sr=8-5) | N/A | N/A | N/A |
| [reTerminal’s built-in accelerometer](https://wiki.seeedstudio.com/reTerminal-hardware-interfaces-usage/#accelerometer) | I2C | [acceleration.py](https://github.com/Seeed-Studio/Seeed_Python_ReTerminal/blob/main/seeed_python_reterminal/acceleration.py) in [Seeed\_Python\_ReTerminal](https://github.com/Seeed-Studio/Seeed_Python_ReTerminal) | [Accelerometer Test](https://github.com/Seeed-Studio/Seeed_Python_ReTerminal#accelerometer-test) and [Accelerometer and Buttons Test](https://github.com/Seeed-Studio/Seeed_Python_ReTerminal#accelerometer-and-buttons-test) (async) |
| [reTerminal’s built-in buzzer](https://wiki.seeedstudio.com/reTerminal-hardware-interfaces-usage/#buzzer) | I2C (I/O expander) | [core.py](https://github.com/Seeed-Studio/Seeed_Python_ReTerminal/blob/main/seeed_python_reterminal/core.py) in [Seeed\_Python\_ReTerminal](https://github.com/Seeed-Studio/Seeed_Python_ReTerminal) | [Buzzer Test](https://github.com/Seeed-Studio/Seeed_Python_ReTerminal#buzzer-test) |
| [PIR Motion Sensor](https://wiki.seeedstudio.com/Grove-Adjustable_PIR_Motion_Sensor/) \* | Digital | None needed. [grove\_mini\_pir\_motion\_sensor.py](https://github.com/Seeed-Studio/grove.py/blob/master/grove/grove_mini_pir_motion_sensor.py) can be used. | [*Play With Arduino*](https://wiki.seeedstudio.com/Grove-Adjustable_PIR_Motion_Sensor/#play-with-arduino) from wiki. |
| [Magnetic door sensor reed switch](https://abra-electronics.com/electromechanical/switches/magnetic-reed-switches/sec-100-magnetic-door-sensor-no.html) | Digital | None needed, behaves like a button. [Button class](https://gpiozero.readthedocs.io/en/stable/recipes.html#button) from gpiozero. | [Blog post](https://www.electroniclinic.com/reed-switch-with-raspberry-pi-interfacing-and-python-programming/) by electroniclinic.com |
| [MG90S 180° Micro Servo](https://abra-electronics.com/electromechanical/motors/servo-motors/mg90s-metal-gear-micro-servo-rc-micro-servo.html) | PWM | [Servo class](https://gpiozero.readthedocs.io/en/stable/recipes.html#servo) from gpiozero | [Example \+ video](https://github.com/garyexplains/examples/tree/master/servo) by garyexplains |
| [Sound Sensor/ Noise Detector](https://wiki.seeedstudio.com/Grove-Loudness_Sensor/) | Analog | [ADC library for Grove Base Hat](https://github.com/Seeed-Studio/grove.py/blob/master/grove/adc.py) (Github) | See use of ADC in [Lab 3](https://docs.google.com/document/d/1-H11p5e-HsdLQ4isPcim3jEzQ005bsckOcPwPpzzdTI/edit?usp=sharing) |
| (Optional) Alternative  device |  |  | There are other sensors/actuators available to us in the lab. Instructions/examples will be available in a future Connected Objects milestone. |

# Project Milestones  {#project-milestones}

|  | Both courses |
| :---- | :---- |
|  | App Dev III |
|  | Connected Objects |

| Milestone | Brief Description | Dates | Length |
| :---: | ----- | ----- | ----- |
| 1 | **Team formation & project idea 2% (March 10\)**  Project idea  Github repo, team contract, & brainstorming In-class check-in with teacher (\<5 mins) | Feb 28 to Mar 10 | 10 days |
| 2 | **Project Proposal 8% (March 24\)**  Context User needs Proposed solution  Brief description of the idea Decomposition into Subsystems  Listing Additional Hardware  App design document **Demo :**  Hardware subsystems requirements Wireframe for UI and software requirements 5-10 min presentation each team | Feb 28 to Mar 24 | 14 days |
| 3 | **App Dev III 10%** \- Maui App skeleton (pages design, navigation) \- Testing on iOS simulators in P-322 \- Models and repos are functional and tested | TBA | 7 days |
| 4 | **Connected Objects 9%**  \- Classes for using and controlling sensors and actuators. \- Design OOP interface for hardware devices; adapt A1.  | TBA | 7 days |
| 5 | **Connected Objects 7%** ([Detailed instructions](https://docs.google.com/document/d/1Fo_EFjPdKK8b7WZ9257ih_uu9DmMGrO6YTTRkXtnPOw/edit?usp=sharing)) \- Subsystems merged to work simultaneously. \- Telemetry messages working (D2C). \- Finalise interface design for subsystem communication. | TBA | 7 days |
| 6 | **App Dev III 10%** \- Connect to the IoT Hub from the app \- App should be able to handle multiple subsystems  \- Authentication service implemented and functional  | TBA  | 7 days |
| 7 | **Connected Objects 7%** ([Detailed instructions](https://docs.google.com/document/d/1Fo_EFjPdKK8b7WZ9257ih_uu9DmMGrO6YTTRkXtnPOw/edit?usp=sharing)) \- All actuators can be controlled via the IoT Hub. | TBA | 7 days |
| 6 | **IoT Hub Application integration 10%** Authentication Service implementation Connection to Azure IoT Hub | TBA | 7 days |
| 7 | **App Dev 20% :**  App controls IoT Hub settings Display of historic data Data Visualization  (optional) database integration  **Combined:** Final documentation  | TBA | 6 days |

## Milestone 1: Initial project setup (March 10\) {#milestone-1:-initial-project-setup-(march-10)}

Your team must create a project repository, a *Team Contract*, and an initial brainstorm of project ideas that could be developed given the hardware and app requirements listed on the previous pages.

### Repository & Team Contact {#repository-&-team-contact}

- Choose a team name   
- Accept and create a github repository using the Github link provided below.   
- Additional team members should accept the assignment and simply join the created team.

🔗 [Link to GitHub Classrooms assignment](https://classroom.github.com/a/sPOThK-e)

In the cloned repository, a template for the *Team Contract* can be found in the *docs/* directory. It must be completed by your team **before March 10th.** 

### Project Idea Brainstorm {#project-idea-brainstorm}

Once you have created the repository and completed the *Team Contract*, your team must brainstorm ideas for how you will use the hardware available to you to create an interesting final project.

In the cloned repository, a template for Milestone 1 brainstorming can be found in the *docs/* folder. It must be completed by your team before March 10th. 

At the milestone deadline, an in-class check-in will be done with each team to validate your team’s ideas. 

Note: we may be able to provide additional sensors and actuators. Please let us know if you have ideas or requests, though not all ideas will be possible.

Note: project ideas may be suggested to you to ensure your project meets the balance of “complex enough to be interesting” and “not too complex that it goes beyond the scope and time of this class”.

## 

## Milestone 2: Project proposal (March 24\) {#milestone-2:-project-proposal-(march-24)}

Once your project idea has been approved by the teachers, you must create a complete project proposal and a wireframe design for the app. This should be documented in a document in the folder */docs/milestone2,*  and present it **briefly** within 5-10 minutes in class.  [Here is](https://docs.google.com/presentation/d/1HOXBHxM1Wf3iUwRaCZHZ4qoBHXxRaSVD_GhH8SgVU9E/edit#slide=id.g33822c9e93b_0_201) an example of what level of detail is expected in the proposal.

### Context  {#context}

Explain the context behind this project idea. What is the current state of affairs? 

### User needs {#user-needs}

In this section, you must provide a detailed explanation of the various users, their needs and how these could translate into different user profiles. 

### Proposed solution {#proposed-solution}

Brief description of the idea and the IoT solution, used sensors and actuators for the project.  

- Functional Overview   
- Design Overview


  
**Connected Objects**

### Hardware subsystems {#hardware-subsystems}

Split the various sensors and actuators required by your solution into 2-3 independent subsystems. You should list any additional sensor or actuator required by your project.

**App Dev III**

### Screen Design {#screen-design}

Create a wireframe for each screen: draw how you expect each screen to look like. Include buttons, text, and images that the user will see and use.

- Sketching\\Drawing manually: an easy way to start this process is to sketch the screens using index cards to emulate a phone’s screen size.   
- Digital design: there are different tools that can help you achieve the same task digitally:  
- [https://www.figma.com/](https://www.figma.com/)  
- [https://www.justinmind.com/free-wireframe-tool](https://www.justinmind.com/free-wireframe-tool)  
- [https://balsamiq.com/](https://balsamiq.com/)  
- Microsoft PowerPoint

Draw arrows and add notes that show how a user navigates between the screens. 

### Epic User Stories {#epic-user-stories}

Write 3-4 epic user stories that should be fulfilled by the end of the project, which must be added as Github Issues within your Github repo.  

### Rubric {#rubric}

| Element | Criteria | Points |
| :---- | :---- | :---- |
| Oral Presentation  | The presentation is well-structured, providing a clear overview of the project context, concept, user needs and proposed solution. It includes a concise summary of the hardware subsystem and app design. | 5 |
| Functional and design overview | The text effectively connects the problem’s context, user needs, and proposed solution, offering sufficient concrete details about the implementation. | 5 |
| Hardware Subsystems | The project proposal features three independent hardware subsystems, each equipped with a defined set of sensors and actuators. Every subsystem plays a key role in the solution and demonstrates an appropriate level of complexity for the project | 15 |
| Application Screen Design | The app’s various screens are described and illustrated, along with their relationships. The design aligns well with the user needs, ensuring a clear distinction in layout for different user types.  | 10 |
| Epic User Stories | Each epic user story is well-defined, clearly describing the feature or functionality, its purpose, and the user’s goal. The scope is appropriate for an epic (not too broad or too narrow). | 5 |

# 

## Milestone 3: App Design (April 7\) {#milestone-3:-app-design-(april-7)}

### Introduction {#introduction-1}

In milestone 2, you have created a project proposal which represents a storyboard of how you want your app to function. It will be your roadmap as you proceed to the next step. It is perfectly normal as you proceed in this and the upcoming milestones to have changes and updates on the app design and features. This milestone will serve a skeleton app for the project. 

### Project Organization {#project-organization}

Create different folders within the app project to keep all the files organized. Use what is relevant to your project from the list below and add any needed ones.

* Models  
* Repos  
* ViewModels  
* Views  
* Resources  
* Images  
* Files

### What you do not need to implement {#what-you-do-not-need-to-implement}

* Service classes  
* IoT Hub connection   
* Authentication service   
* Databases

### Project Tracking {#project-tracking}

At this point, new tasks taken on by team members should be organised and tracked using [GitHub issues](https://github.com/features/issues) in the respective Epic Milestones. 

At the end of each sprint and deliverable presentation, the team will show their backlog, boards and task assignment.

### Architecture  {#architecture}

You are free to select the app architecture that you prefer, but a layered architecture is expected where the UI aspect of the app has to be separated from the Business logic. Your app should use event-based programming and data binding. Your classes should be logically and coherently designed, ideally respecting the [separation of concerns](https://en.wikipedia.org/wiki/Separation_of_concerns)  principle and the [single responsibility](https://en.wikipedia.org/wiki/Single-responsibility_principle) principle. 

### Models {#models}

Based on the provided project requirements and your project proposal, the app should have **at least 3 models** one for each subsystem. Always refer back to your design document and feature list as you might need to have more models.

As you are adding fields and properties to your models, **do not forget**:

* **Validation**: Your model is not aware of the View and therefore should validate the value provided to the setters.   
* **OOP Encapsulation** : avoid exposing unnecessary information  
* **OOP Abstraction**: Hide unnecessary details to other classes. For example if you have a method which updates

If you are still unsure of how the data will come in, include a *TODO* in the code and add a user story to come back on this technical debt later on.

### Views {#views}

Use the wireframe layouts created in milestone 1 to start the page design in `xaml`. Build the pages and add basic (stacked) navigation to be able to examine the look and feel of the app.

If a page cannot be created at this stage because it is dependent on a on a story or a feature that is still not introduced or available, simply add a placeholder for it.

As you are designing your Views, **do not forget**:

* Reduce the logic from the code behind as much as possible.  
* Use data binding whenever you can  
* Prioritize having all the essential features (you will have time to go back and improve the look and feel of the app)

Feel free to use a ViewModel to improve the 

### Data Repos {#data-repos}

At this stage of the project, you still do not have access to a back-end server to get real time data. Create test repositories that would provide your app with **dummy data** to be able to test different view designs and over all app navigation. Similar to what was done in Labs 1, 2 and 3\.

### Code Quality {#code-quality}

You are expected to use good coding practices:

* Code Reusability  
* Variable naming conventions  
* Descriptive naming  
* Indentation  
* Use of constants

### Testing on iOS {#testing-on-ios}

* In this milestone, we will set up the iOS simulator in P322 on **April 4** to get your app deployed to iOS.   
* [Testing on iOS](https://john-abbott-college.github.io/6A6-Notes/#/labs/Lab_Testing_iOS) steps. 

### Comments and Documentation {#comments-and-documentation}

* Use the `.NET` official documentation style [XML Documentation Comments](https://msdn.microsoft.com/en-us/library/b2s063f7.aspx) for all the `C#` files. Include the `<param>` and `<returns>` tags for methods. The XML comments provide the ability to automatically create documentation files from these comments at compile time.  
* Each class file should include a header with the following information:  
  * Team name and number  
  * Semester information and date  
  * Course name  
  * High level description of the class  
* Add additional comments on any non-trivial code.  
* The `.xaml` files do not need to include any documentation unless you have used code of the internet and need to provide credit to the author.

### Deliverables {#deliverables}

* A class diagram to show your classes and their interactions with each other.   
* Create a short video (8-10 minutes) that will show the different page designs, navigation and models.  
  * **In each explained page or model, state the name of the team member who worked on it.**  
* Provide a narration describing  
  * Each page: its task, name, role.. etc.  
  * Navigation: what is the next page you will be navigating to.  
  * Any additional information you think is relevant.

  *Example: This is the main landing page. It holds a general dashboard that includes settings from all subsystems. If we click on this button we will navigate to the GPS location page...*

* Once done with the pages, go to Visual Studio to show your models in the video.  
  * Mention any details you believe are relevant for the model design.  
    

### Video Submission {#video-submission}

* Using powerpoint screen capture or Windows 11 snipping tool video capture film a short 10 minutes video of your app running on the Android Emulator   
* Use [WeTransfer](https://wetransfer.com/) to send me a link to your video  by MIO. 

### Grading Rubric {#grading-rubric}

| Element | Evaluation Criteria  | Worth (points) |
| :---- | :---- | :---- |
| **Project Folder** |  The MAUI project is created and well structured. | **1**  |
| **Models** | Class design respects the separation of concerns  Each class has a clearly defined single responsibility OOP Pillars are used in the design of each class. | **4**  |
| **Views**  | Pages Design  Use of data binding Navigation | **2.5** |
| **Data Repos** | Use of data repositories to keep the data separated from the views.  | **1**  |
| **Project Tracking** |  User stories for this milestone have been added to the epic milestones  | **1**  |
| **Documentation** | File headers Methods summaries Class diagram | **0.5** |

## Milestone 4: Subsystem implementation (May ) {#milestone-4:-subsystem-implementation-(may-)}

TBA

## Milestone 5: IoT Hub App integration (May 16\) {#milestone-5:-iot-hub-app-integration-(may-16)}

📝**Worth**: 10%

📅 **Due:** May 16

📥 **Submission:** Code pushed on Repo \+ Short demo in class:

###### [**Book time Demo IoT Hub connection**](https://outlook.office.com/owa/calendar/FinalProjectW25@JohnAbbott.onmicrosoft.com/bookings/s/2d2xXNP6YU6J3OTnGaxUqQ2?ismsaljsauthenabled)    {#book-time-demo-iot-hub-connection}

### Introduction {#introduction-2}

In milestone 3, you have laid the foundation of your app. You created your models and most of your views. In this milestone you will connect and retrieve data from the IoT Hub.

By the end of Milestone 5 your team should deliver the following:

* `.Net Maui` app connects to Azure IoT hub and retrieves data.  
* Models updated as per the telemetry.  
* Basic data displayed in views.  
* The user authentication is implemented

**Notes**

* **The code organization statements stated below are suggestions to have a better and clean code.**  
* **Your code design could adapt the concepts as is or change them as needed.**

### Pre-requisites  {#pre-requisites}

Before starting this milestone, ensure that you have the following steps completed:

* Azure subscription   
* Event hub namespace setup  
* (optional) Azure storage account and blob container  
* Hardware subsystems are completed and sending telemetry data on the IoT Hub


### Authentication {#authentication}

In this milestone your Login page should be fully functional, allowing a user to be authenticated. You do not have to implement a sign up page, but this is a nice nice to have if time permits it.

You should also route the user according to who they are (based on user profile). You may simply serialize the repo of users with their type (see [this](https://john-abbott-college.github.io/6A6-Notes/#/labs/Lab3?id=exercise-5-serialization) example of C\# class serializations). Implementing a database of users and/or devices is nice to have. Here is an [example](https://john-abbott-college.github.io/6A6-Notes/#/labs/Lab4?id=lab4-part-2) on how to implement a firebase database with CRUD operations. 

Provide the user credentials in your README.md file to allow me to test your app.

### Connection to Azure IoT Hub {#connection-to-azure-iot-hub}

You should start the process of connecting your app to `Azure IoT Hub`. The key objective in this step is to keep the **code as organized as possible**.

Here is a suggestion on how to organize the code:

* Inspect the sample projects provided by Microsoft:

  📌[Receiving D2C message in the C\# app](https://www.nuget.org/packages/Azure.Messaging.EventHubs.Processor)

  📌[Sending commands to device using C\# app](https://github.com/Azure/azure-iot-sdk-csharp/blob/main/iothub/device/samples/getting%20started/SimulatedDevice/Program.cs)

* Create a service class to connect with the IoT Hub  
* Ensure that you have central repos to receive the telemetry data

![][image2]

#### Fixed Values {#fixed-values}

* Any fixed data values such as *connection strings*, *server settings*, *credentials*, etc. should be inside an `appsettings.json` file. You should have a `Config` or `Settings` class which helps deserialize the json.  
* This class (`Config` or `Settings`) should probably be static or instantiated in the `App` class, **so the values can be easily accessed throughout the app.**  
* Follow variable naming conventions in .NET  
* Provide meaningful names.  
* Use constants where applicable.

#### Handling multiple devices {#handling-multiple-devices}

* The app should be able to support multiple devices even if the demo is done on a single device.   
* Each device will have a different device id to be stored either in a local embedded file or a database.   
* The app should be designed in a way to be able to handle **connections to all three devices at once**. 

#### Use of Data Repositories {#use-of-data-repositories}

* Retrieving data from any source should be done through a data repository class. (similar to the databases example lab)  
* Your app will eventually receive the telemetry data of each subsystem. Start planning for this as you design the repo.  
* **Keep in mind the OOP abstraction pillar: a single class should describe a single entity and should not include unrelated code.**  
* **A single instance of the data repos should exist, you can either use singletons or create a static instance.**

#### Use of View Models (if applicable) {#use-of-view-models-(if-applicable)}

* Ensure that your view models are not containing the data, but rather providing public accessors for the data repositories and models.  
* If a view model depends on a data repository, it should be passed through its constructor.  
* Ensure that the view model of each page is set as its binding context (similar to the assignment)  
* It's also preferable to register the View Model and the View as singletons as per [Microsoft's documentation](https://learn.microsoft.com/en-us/dotnet/maui/fundamentals/dependency-injection?view=net-maui-8.0) and similar to what was done in previous assessments. 

### Error handling {#error-handling}

**Defensive Programming**: *is a form of defensive design intended to ensure the continuing function of a piece of software under unforeseen circumstances. ([Wikipedia](https://en.wikipedia.org/wiki/Defensive_programming))*

* As you are starting to interact with the cloud, remember that your app should be ready **to handle disruptions**  
* Similar to the authentication lab, you should make sure that the user is notified of incorrect credentials and network disruptions.  
* Additionally, data retrieval is dependent on accessing the network.   
* Similar to the assignment, make sure your code adds `try` and `catch` clauses where needed and raises the appropriate error to display to the user.  
* Refer to [`Network Connectivity`](https://learn.microsoft.com/en-us/dotnet/maui/platform-integration/communication/networking?view=net-maui-7.0&tabs=android) documentation (and the lab on authentication) to check if the network is available before proceeding to connect to any network resource.  
* You are encouraged to unit test the parsing of the telemetry payload and the models correct updates on data being received, if time permits it.  

### Update of Data Models {#update-of-data-models}

In the current `Connected Objects` milestone, the telemetry payload is being well established and **clearly formed**. Revisit the `Models` created in the previous milestone and make any needed adjustments.

### Display of Data {#display-of-data}

Start the process of connecting the backend, the data, with the frontend user interface.

* Use the data repository classes you have created to retrieve the data.  
* Use `Data Binding` to display the data into your views if you have not done it already.  
  * Display the basic data.  
  * Include the units of measurements so that if is at least relevant.  
  * Be mindful of real time updates, your views should be notified when the data is changing.  
  * You may start working on advanced views (if you have not already started).  
* As you are not required to include information about the actuators in your message, any UI control that is supposed to **send data back to the IoT hub is not required to function in this milestone.**

### Code Quality & Comments {#code-quality-&-comments}

Refer to Milestone 3 for the details of [Code Quality](#code-quality) and [Comments](#comments-and-documentation).

### Deliverables {#deliverables-1}

* Schedule a meeting with me to demonstrate your progress. The booking link will be provided at the start of the presentation week.   
* **All team members must attend the meeting.**  
* Your presentation should not **exceed 10 minutes.**  
* Your presentation should demonstrate:  
  * Login  
  * Connection to the IoT Hub  
  * Display of real or simulated D2C messages  
  * Error handling on network disruptions

### Grading Rubric (20 points) {#grading-rubric-(20-points)}

| Element | Evaluation Criteria | Points |
| :---- | :---- | :---- |
| Demo | Login functional | 1 |
|  | Connection to IoT Hub functional | 2 |
|  | Organized and prepared. | 0.5 |
|  | Respect the time limit. | 0.5 |
|  | Live updates of the data within views | 1  |
| App robustness  | Error Handling | 2  |
|  | Errors at authentication are handled | 0.5  |
|  | Errors during data retrieval are handled | 1.5  |
| App architecture  | Data retrieved within centralized repo | 1 |
|  | Repos are well organized and have a clear responsibility | 0.5 |
|  | Models updated to match telemetry data | 0.5 |
|  | Services class are divided up into various services with single responsabilities  | 3  |
| Code Quality | Authentication \- code quality | 1  |
|  | IoT Hub Connection \- code quality | 1  |
|  | IoT Hub Connection strings is centralized | 1  |
| Iteration of the project | Views & Models \- feedback from milestone 3 is implemented | 3  |

	

## 

## Milestone 6: Final Presentation (May 20-22) {#milestone-6:-final-presentation-(may-20-22)}

📝**Worth**: 20% (App Dev III) \+ 6% (Connected Objects)

📅 **Due:** May 20-21st

📥 **Submission:** 

- May 20-22: 45-min Demo in person   
- May 28: Final Code submission \+ Bug fixes \+ Documentation 

## [Booking Link](https://outlook.office.com/book/FinalProjectW251@JohnAbbott.onmicrosoft.com/s/2d2xXNP6YU6J3OTnGaxUqQ2) Final Demo 45 min {#booking-link-final-demo-45-min}

### Deliverables {#deliverables-2}

* **Team Demo**  
  * This is a 45 minute **live presentation**.  
  * All functional requirements (features) are expected to be working.  
* **Code and Documentation submission**:  
  * You may use the days after the presentation to **fix minor bugs, update your documentation and address any comments** given to you.  
  * The final version of your code is fully committed and pushed to GitHub before the deadline.  
  * Ensure to have merged all your branches on the main. **A penalty of 5% will be applied if we cannot find your final branch.**

## Team Demo \- Logistics 

1. Arrive **30 minutes** in advance to ensure that **all your devices are functional** and that the **app is running** and functional on the **presentation computer**.  
2. Demos will be held **in P327**. If your team is presenting right after another, please set up in **P326** while waiting.  
3. If you are presenting devices that require water or soil, bring the material required to demonstrate their proper functioning.  
4. You must present on the **large screen**.  
5. Lateness or lack of preparation will be **heavily penalized**.  
6. All devices, sensors, and actuators must be returned at the end of the day.  
7. At the start of the demo, state your team name, the subsystems and the kinds of users.  
8. After the demo, return **all hardware devices to Michael Haaf**   
   

### App Dev III milestone {#app-dev-iii-milestone}

This is the final Milestone for the project. By the end of this milestone, your team should deliver the following:

* App controls actuator devices via Azure IoT Hub.  
* App reads and sets Device Twin desired properties via Azure IoT Hub.  
* Advanced views finalized to display historical data.  
* App Documentation with app setup instructions, details and features.

#### IoT Hub Communication {#iot-hub-communication}

1. Controlling Actuator Devices  
   * The mobile app should communicate with IoT Hub to control the state of all actuators (fan, lights, buzzer and door lock).  
2. Device Twin Properties  
   * The mobile app should read and set the telemetry interval.  
3. The app could either use direct method or Device Twins properties to set any of the thresholds. Refer to this example from Microsoft’s documentation:

   📌[Sending commands to device using C\# app](https://github.com/Azure/azure-iot-sdk-csharp/blob/main/iothub/device/samples/getting%20started/SimulatedDevice/Program.cs)

   

#### App Advanced Views {#app-advanced-views}

## App should display all basic telemetry data. This includes any missed data in Milestone 5 or sensor which wasn’t functioning properly. {#heading}

## Display of historical data: {#heading}

* ## Since saving data in a storage is **optional**, you may use events in the Event Hub partition as historical data. {#heading}

* ## Finalize all views that display historical data. Data can be displayed in different formats depending on your app design. Here are some examples: {#heading}

  * ## Graphs. {#heading}

  * ## Data grids. {#heading}

  * ## Maps. {#maps.}

#### Documentation (Due on May 28\) {#documentation-(due-on-may-28)}

In the `README.md` file at the root of your GitHub repo, include the following sections:

**Team Information**

* Team name and  team members’ names and IDs.  
* (optional) team members photos

**Project Description**

* A brief description (200-300 words) of the project including the used hardware and the developed app.  
* This should be the second section in the document.

***Contributions*** section: create a table with team members' names and include the following:

* What did each team member do?  
* How was the work in the project divided?

***Connected Objects*** Section's required by the connected objects course.

##### Mobile App

**Include the following subsections in it:**

***App Overview***:

1. Provides a descriptive summary of the app (250 words maximum).  
   2. Features and functionality of the app (bullet point format)  
   3. This section includes snapshots of the final app showing different features.  
   4. Remember to add explanatory captions to the snapshots.

***App UML diagram***. Display an updated version of your UML diagram to explain your models:

5. Focus on the most **important classes**  
   6. Clearly identify public and private properties.  
   7. Clearly identify the nature of the links between models if it is important to understand your app.  
   8. No need to include Views, code behinds nor AppShell.xaml

***App Setup***: include all setup instructions and configurations needed to run the app **with any IoT hub.** This includes instructions on used connection strings and **how** to acquire them.

9. IoT Hub.  
   10. Authentication.  
   11. Database (if used).

***Future Work*** section:

12. Include any features from the Design Document from milestone 1 that you did not have a chance to work on.  
    13. State bugs that have not been resolved and have yet to be fixed but time does not permit to fix.

***Bonus Features*** section: Provide a brief explanation why such a feature is an added value to the product. Include snapshots with captions.

1. ## This may also include automated rules when certain readings reach thresholds to automatically activate a given actuator. {#this-may-also-include-automated-rules-when-certain-readings-reach-thresholds-to-automatically-activate-a-given-actuator.}

2. It may also include push notifications or email notifications to alert the user.  
3. It  may additionally include a 3D models or 3D printed parts which help turn your project into a prototype product. 

##  {#heading}

   

#### Grading Rubric (Total 30\) {#grading-rubric-(total-30)}

| Evaluation Criteria | Worth |
| :---- | :---- |
| Final Demo | **5%  (Total: 5 points)** |
| Well prepared and organized | 1 |
| Respecting the time limit | 1 |
| App is functional (no major crashes) | 2 |
| Clear explanation of design choices | 1 |
| **Project Documentation** | **5% Total (5 points)** |
| App Overview & future works | 1 |
| App Setup | 2 |
| UML diagram | 2 |
| App Dev III \- App implementation | **10%  (Total: 20 points)** |
| Team work: Self-assessment (added) | 2 |
| Team work: Peer-assessment (added | 3 |
| IoT Hub Communication | 5 |
| App Advance Views | 3 |
| App Robustness  App does not crash (Exceptions handled properly) App checks for connectivity  App provides proper informative error messages. | 3 |
| Would-like-to-have features Automated rules  Severity metrics/ Alerts Realtime database | 1 |
| User Roles (clear separation of views) | 1 |
| Code Quality & Comments | 2 |

[image1]: <data:image/png;base64,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>

[image2]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAloAAADzCAYAAABe17jlAABGYklEQVR4Xu2dB5jU1NfGZ5fepHdBFLGgIEWkqCBFAQsoCEqT3kRAsRc+sADqHwXsHUXFhggoIihlqSIqwrLAggqCUhcQEel7vzmZTTZzbqZlZndvkvd9nt8zueece7NM5s59STIzPh8EuVRpi/cVT1+6f+CWpRmZfgQAAHiXA2n+98Pb+fskBEFQ1Nq6NONH+c0FAABAKLamZCzi76UQBEGGtqQcGMnfOAAAAMTO1u8PnMXfYyEI8qi2puyfzd8kAAAAJIAlGQ/w91wIgjwgIUSy9IYAAAAgx+DvwxAEuVR88gMAAMgdfl96sC5/T4YgyCXasvRACp/0AAAAch+/kvh7NARBDtaWZRln+EQHAACQd2xdmvEzf6+GIMiB4pMbAACAKuzfwt+zIQhyiLakHGouT2oAAACqkfrd3or8PRyCIIWVnrJ/Fp/IAAAA1IW/j0MQpKjo53L4BAYAAKA+/P0cgiDFtGVZxgI+cQEAADgH/r4OQZAiSl92YAyfsAAAAJwHf3+HICiPlZaGy4UAAOAm+Ps8BEF5KD5BAQAAOB/+Xg9BUB6IT0wAAABu4UBn/p4PQVAuauuyjAfliQkAAMAt/L58/4X8vR+CoFwSn5AAAADcB3/vhyAoF8QnIgAAAHeydVnGS3wNgCAoB5Wesu89PhEBAAC4F74OQBCUg+ITEAAAgMtJ2b+HrwUQBOWAtqRkdJImIAAAANez6bs/y/I1AYKgBItPPAAAAN6BrwkQBCVQ6cv2j+KTDgAAgHfg6wIEQQkUn3DA3bRvdTO9qRp0vr67VBMtK75ICxrrmw9WSTXhMPd9YOgYKR8Kcz+eC4fe5+dvtkk5oljR4rbGjYT570302AAkgs0pB/r7IAjKGfEJB9yNjy36BK+JFj5OrGPZ7Wunj7nf5LFvSbl4xo2E3X8nALmJD4KgxGvLikP1+GQD7sbHFn0dXhcJ3j/WcXg/4tNX50l1VtjZn7lfbhot/m8kvnhroVQHQF6TliYK+iAISqz8k+sMn2zA3fgsFn6C10VC73d3/4dtjaPXd72xV8z9Y63n/fLaaCVyfAASRfrSjJM+CIISKz7RgPvxscVe3y5QoKBUG4qpz8+wHENvR6JkiVJx9Y+1nvfLLaO1YeEuY7wln/2S8PEBSDQ+CIISp61fi0J8kgH342OLPW9HA+/D25Hg9a8/PT2u/tGi95k89m0pF8+4oShWpHjQeO9M/MxoX3DexVI9AHmND4KgxMk/qfbxSQbcj4+ZiVfGTzPag3veLdVbodc/MHSs5ZiR0GvpU4s8dlaJklI9J9b98X65ZbSsxrOKhaJls+uk2vEPTQkaQ2flrI1SfzN8nM1L9kljEH1vu1PqC7yDD4KgxIlPMOANfKZFNVwsFFa1VrFQ9Oo80LI2ljFiqbXqlxtGq2/XIZZjlS5ZxohPmzxT6mem9gV1g8Yw/32h4GPomPMVy1eW+nF4f+ANflt+8HofBEGJEZ9gwBv4LBZTq1go9Lprml4rxWLpz2uLFilmxMc/OEXqF80YkdD75IbRCjXW5pTgM0m8nxmz0TLz6oQPjJpO7btFNZ6eT0pKMrZbX9XOyNMnIc3j3HHrIGkM4H62LstY44MgKDHiEwx4A5/Fotz5hu5GbGive6Q+OuXLVJD6hhrTivSU/UZdw7qNpXy040Rbx9H75KbROrfa+SFzkfZjZbR4DUEfZIhUE80470+ZFbEGuB8fBEGJEZ9cwBv4QiykoeLR1ISKcyLVRcrHWsfR++S00frm/VVhxzHvZ8N3u6S8DjdaPB9qTJ6LJq9TqGBho278Qy9IeeB+fBAEJUZ8cgFv4Aux4FYoV8mIp8xYJ/Uz9+U/2xNqTE6kurcnfmrkSxQ7S8pHO04o9D45bbQijfPRy18ZebpkyvM6/B6tcBQ0ndXiOULPNW/cWsqZ+e6jNUYtfQ0HzwP344MgKDHikwt4A18YE5ATOZ32LbN/Y5HnYh0rmhor9D65ZbSqVqom5XhNuH3FYrRefHKqUXtDq1ukvJ6LZLTMtdHsF7gPHwRBiRGfXMAb+MIsovnzFwiZ0+NnV64eMmfVL5aaaOuiqbFC75OTRqt2rTpRjVG5QlWjrl3LDlJeGysGo2U+E0Vj87yeg9ECkfBBEJQY8ckFvIEvwiKq52a8vkCKReoTKs9roqXN1ddL4/CxeC4cep9pk2dJuXjGDTVGLPBxiFiM1qrZm4zaSuWrSHk9B6MFIuGDICgx4pMLeANfhEXUKq+3y5UpL9WH6mNm3vsrg2pigY8Vzf5CofehL+vkuXjG1ZkzNUX6+6OFj0XEYrSmPP62Udvjlv5SXs9dDaMFIuCDICgx4pMLeANfhEXUKs/bHKs+ofL3Dfm/iJjrP3/j27DjLZj+g5S34vF7J4b9G/m4PBcNsf4721zd3qj/5JV50nixGK2a51wQtlbPRTJamxbvNWrD3agP3IsPgqDEiE8u4A18UZgJc02s9TxnzudLziflrPhl/o6wY679ZnvYvBXR1EdTEw47/cP1MRstq8uB0Y4TTd6qbv23O6U8cD8+CIISIz65gDfwRbHgmmt0ChcqItVZ1fPcOVXPM3LLZ26Q8qEINybPz357iZQ3U6hQ9ndDFSpYSMpbjclz0aD3pW9f57lQhNsn/x6tKxtdI9UQF5tuwA+1b/M4VvsiNi7aHbEGuB8fBEGJEZ9cwBv4olhIzZfZdELd1xRpzHC5cBQrWtzot3HxHilv/t4vItRXKfB/B8+HquW5SJh/P3Due8ulfCjovje9X4WyFYNy3GgRo0dOkMYw5zdZPFe8hiherETYGvPP8wBv4YMgKDHikwt4A59pMeW5UHUFw5wF4rWhcvUuuVzKRSLcuMSQnncH1USC9+fEUsvJib78Hi3+7+Fwo2a1D/PZvVCcXfkcqT/wDj4IghIjPrmAN/CZFlSes1MXrnbCQy9axqMl1Lhm+OWuUPB+VsRarzN57FtGv1rnXizlI2He70cvzzXi3GjxH6Q2c1ef+6VxrfZRplRZaZ8c3hd4Cx8EQYkRn1wAuIVwlzmdBDda8aCPU6NaTSkHgJnglQKCINvikwsAoBY5YbRoTJ4DwEzwSgFBkG3xyQUAUIucMFqNLmsq5QAwE7xSQBBkW3xyAQDUIieMVqtmbaUcAGaCVwoIgmyLTy4AgFrAaIG8IHilgCDItvjkAgCoBYwWyAuCVwoIgmyLTy4AgHrQbw8m6lOUiRoHuBu+VkAQZFN8cgEAAAB8rYAgyKb45AIAAAD4WgFBkE3xyQUAAADwtQKCIJvikwsAAADgawUEQTbFJ5dXmffROvHwg1PFffe+CXKB++97U3z85nLpOAAA1ICvFRAE2RSfXF5i7fydouKlt4iql90i7h7eTRxdN1CI9EEgFzizeZCYNK6nqNmok3YMFs/cJB0fED933/Oa9vyCvKdD19HS8VEZvlZAEGRTfHJ5BXrj+3PFAMkAgLyDjgk/TsAe9FxWa3CbmPTpr0AhGt14n2Ne53ytgCDIpvjk8gL0RscXeaAGdGw2LNwtHTMQPfQc8gUeqIUTzBZfKyAIsik+udwOvcFlbpYXeKAOTliEVIWeuzGv/yAt7EAtJn60WfnXOV8rIAiyKT653EzVy26VFnWgJo3bDJOOHwhP1cu6aAs4X9SBuqhstvhaAUGQTfHJ5WZwydA5qLwAqQouGTqPRjfeKx1HVeBrBQRBNsUnl1tJW7RHHN+ATxU6hbVz+4lXnv9aOo7Ams+nfi8t4sAZdLxNzU8j8rUCgiCb4pPLrUx44lNpMQdqk5dnte7oPEhMHP2aFLeLf6qJT1/9RoonCpzNci55+ToPB18rIAiyKT653Er9a+SFHKhNqAVow8JdmnEheC4Sej9OqDoetwuNBaMFrAj1Os9rspYICILiFZ9cbkX1+7P8h8IydujHPiHzbifUAkTPxeSxb9kyQlZ9ChUsbBlPJDS+14zWy1/8Lkg8Trww47eQuUhE0+9MZqY4evy0FFeRUK/zvCZ7lYAgKC7xyeVWnGq0eMxLWC1AFcpWTLjR0uNJSUlS3Mwr494X1zS9Vnzwwpyg+AdTZhvbt3foLZ4f84bUl8bnRmvhxz+KG1rfIrrf3C8oPv2lr6T+4eKEikbr0JGT4uSpM+LosdNSjnT8xBkpHg0wWrmDaZmAICge8cnlVlQ3Ws8/3FQ8OKie0U796tYgo8W3k5OTRIH8yUZ8WI9LpBrz+HqbHosUzi+KFysgrrvq7KAa1eALEBkN+vtpO9FG69ILLwvK5cuXX1x9Raugfi2bXadt39C6k3jq/klBucb1r9QeB3Qbrj0SaQt3BdWYjRa1L6/bWMz/cLW4sU1nrb38iw1Gjv+dt17fXYqZUdVokZmyMkakf5kB27j9Hy1Oeuur7VI9aeFP+7RHq9yJU9nGjRstXfPX7A3qqwL8da4KPgiCEiM+udyK6kaL8B+OoO3nHmoq5ejLVi+/tHxQ/MmRl1v2J0NF29sXBxZpXqM6fAGiv31wz5HadqKN1sTHXg3KWRkt3sec43keo21+RovX62fU5r63POJ4HJWNlt/zaCZKj3+y6E8x/budQUZr8mfZZ6o+WLBD29bN1j9HT4mD/5zUtukMmV5HkF6bvU3b3rnvP/Htj/u0bbPRIk2bv0PbPmbzLFpOwl/nquCDICgx4pPLrTjRaFnlRtxxqUj7uovYs7KXxtSnrzFyvL85vvTDDsb2Ta3OkfatIuYFKPW7P4OMRqKN1hvPfBSUszJas95aJPXTc++/kH35kDirRMmg8Wg7ktHi9Tz/8Suhv+5CZaNF29wc0aPZaJnzRMbhE0aM5/T2FIv7vPQ2N1rmGtWA0YIgl4tPLrfiBKNVtEh+Uaxofu0yoi/LJOnobR43M37UFdpjvnxJ4lhq/5B9jmflGlxSThpDJcwLEP295uOZaKN1We2GQTlutPS+Ojz+vuk+LaLBpVcE1dG22WiN6Pdg0Hh83MvrNjHOcOXPX0DaJ8cpRmvZugxjO5zRem9e4KyWVU5vvz13u7bNRblQlw7N46gCjBYEuVx8crkVJxgtwpe14FrF6fH0xoGi/60XSXmdKhWKGrX0SGfA8udPlurMY6oKN1qhqFi+snS8Q0H1PGYeX29bGS1i/YKdWl3xYiWC+nKjVaXi2UHj0bZutFbN3iT9HXz/ekx/bFL/qqAcR3WjNWfFbrHv0PEgsxPOaK3ZfMiI8ZzefmPONimnw40W8cXSXSHr8xIYLQhyufjkcituMVrmGroHix5/mJH9b+P9+VjmflMntJD2oxLhFqBEntFq37KjFk9P2W/EQhktq3H055zn8+fPH9TWjVb9SxtZ1lvFKleoKsWtUN1oEbr0ttloLVuffaZLr6X7tmj71OlMkb7ziLZNn2DkdeZ9Ui09mo2Wfn+XVb0KhHud5yU+CIISIz653IpTjBbIJtwC9OKT70oGhNo8xqF8uTIVxNmVqxv1xKJPfg6qMxutOzoP1GrmTVsppk2epW23bXFT0Jh0mS85OVk8N/p1y7+D2vyM1thR/xOp3/0lKpSrZNknX758WqxggYJBcStUNFrbdh8Vuw8cM9qkqV//YbTp5nVz/eGjp7QaKzOka/XGg1LeLLpvi2L7/z4hdmSNT0ZLFx9XBcK9zvMSHwRBiRGfXG4FRst5hFuApj73mWRMOl7XRYpxfL4kkUT4jVGxosXFja07STVE4UJFRJur2hvtMqXKGmaobOlybEyfeGX8++Ks4oEb4JOTkqXxKP7FWwuN9rQpAcNG0GXGzhZf35C2aLcWW/ftTmk8jopGC0RHuNd5XpK1REAQFK/45HIrMFrOQ9UFiOOfRuK9STOleLw8++jLkvkKBYyWc1H1dc7XCgiCbIpPLrcCo+U8VF2AOP5pJD58Mfjb4hMBjUvwuBUwWs5F1dc5WyogCLIrPrncCoyW81B1AeL4ctBoPX7vRCluBYyWc1H1dc7XCgiCbIpPLrcCo+U8VF2AVARGy7mo+jrnawUEQTbFJ5dbgdFyHlYL0IJPU6UYgNFyMlavcxXgawUEQTbFJ5dbgdFyHlYLkFUMwGg5GVVf03ytgCDIpvjkciswWs6DL0DU5jEQAEbLuaj6muZrBQRBNsUnl1uB0XIe5gUo9btdovmQr5RdlPIaGC3nouprmq8VEATZFJ9cbgVGy3mYFyDabjNqubKLUl4Do+VcVH1N87UCgiCb4pPLrcBoOQ99AdJNFoxWaGC0nIuqr2m+VkAQZFN8crkVGC3nQcds9rQ1ovU9S2G0IgCj5VxUfU3ztQKCIJvik8utwGg5Dzpm5rNZutECweivb76AA2egH0PV4GuF60UH4t4xrwAb0HPHn08oW3xyuRV6HfCFHKgNHTOzyQIyMFrOB0ZLEWmLBGRLMFrhxSeXW4HRch4wWpGB0XI+MFqKCEbLvmC0wotPLrcCo+U86JhVvqyrZCxAMPrrmy/gwBnox1A1+FrhetGBgOyJnjv+fELZ4pPLrWhzyGIxB+pCx2zR5xtFq5FLpDM4IBgYLeei6muarxWuF4yWfcFohRefXG4FRst5mM/WwGiFB0bLuaj6muZrhesFo2VfMFrhxSeXW4HRch76AvTz/J2ieuMBMFphgNFyLqq+pvla4XrBaNkXjFZ48cnlVmC0nId5AZr8zGwYrTDAaDkXVV/TfK1wvWC07AtGK7z45HIrMFrOgy9A1OYxEABGy7mo+prma4XrBaNlXzBa4cUnl1uB0XIeVguQVQzAaDkZVV/TfK1wvWC07AtGK7z45HIrMFrOw2oB6tFnghQDMFpOxup1rgJ8rXC9YLTsC0YrvPjkciswWs5D1QVIRWC0nIuqr3O+VrheMFr2BaMVXnxyuRUYLeeh6gKkIjBazkXV1zlfK1wvGC37gtEKLz653AqMlvNQdQFSERgt56Lq65yvFa4XjJZ9wWiFF59cbgVGy3mougCpCIyWc1H1dc7XCtcLRsu+YLTCi08ut3JZ8wHSQg7URtUFSEVgtPIGet7jfe5VfZ3ztcL1gtGyLxit8OKTy62MHf2htJADtVF1AVKRsY99IC3gIGd5+MVlolar+0Xru1PEU++slfLRourrnK8VrheMln3BaIUXn1xuZvvS/tJiDtTk/x7uIeZOXysdQxCaph0fkhZxkHPQ2mL+DU6ej4YRE+ZKx1EV+FrhesFo2ReMVnjxyeVmtHlksagD9VD1f/kqY3exB7Fzy5CXDJOlU6lOZ6kuEiq/zvla4XrBaNkXjFZ48cnlZirX7Swt6EBN6jYfIB0/EJ6183fCbOUS5rNZOudddZdUF46aTXuLcWM/lo6jKvC1wvWC0bIvGK3w4pPL7eCslvrE8r/8Gg1vl2JeZuPivTBbOYyVyYr1EiLVLZyRJh0/leBrhesFo2VfMFrhxSeXF4DZUhc6NmvmbZeOGadn36e12lhMmZeg5+V/0zdLCzyIj+c+3iKuHjRbMlg69W99Udw85EWpXzZbtWNDZx/5MVMNvla4XjBa9gWjFV58cnkFel2c06CTtNCDvOH+Ud2jMk2V6nQSFf3QonbN8G+lPMhGP7tFVK57q6hyWRcQJ/RccnPFqVQ3uE/ly241jsNP3+yQjpOq8LXC9XKi0frxt6Ni1Ae7ouYePxlHTvNh4haMVnjxyeUlvp6+Vnt91GzUSUyd0ksc3yAbAJAzZG4eJL56r7e4ql1gEZr8zGzp+Jipd81AUb1xv6AFLRpjBkCiqNW4p2GYdJoPmWu8Fjm8v9Pga4Xr5USjdeXjv4qkERtF0vCN2qPvrsCjhCm/eNO/fJi4BaMVXnxyeZUPXk8RrTvc51/4R4Bc4Or2I8XE8TOl48CZNW2NcQaLc3a9LlI9ALnFtFeXGEZL9fut7MDXCtfLiUar+ZO/BUzU8CyTRY/DsoyVCT3m87MERivXxScXAKpRo9lQyWTRR+lrXdFTqgUgt4DRcpnywmh1e32HOO/+zaLM3ZtE7Ue2iHEz9/KSsDIbLY0ssxUKMmMwWrkvPrkAUA2aw9xo6VS8tJOWT1u0R+oHQE4Co+Uy5abROnbijPD1Wm9pjpqN3crLQ0oyWmb0cdn4MFq5Lz65AFCNCU98Kq4cMNMwVy1HLJQMV8B03SJqX9lH6g9ATgCj5TLlptHq+sL27HunsjAu7/mN0fiv9vEulmoz3m+0hqYZ+IaYHu9Mk8wXLh3mjfjkAkBFzGe1aFv79GGIM116nj51x8cBIFHEa7Tmf7haLJuZKsVVga8VMSrZTz8ejCC+zydYO2eVW0br+MkzwtfD+myWbrYufmQL72apM5mZ4o+9x8Uf+04E448t3XjEGB/3aOWt+OQCQEXMpqpa/a5B8UBumWS4qtS7Xfs1AD4WAInArtHKly8frUlB8JpI8P52xwmHvkbY1Gs+2ThFkrm+d1Z7kCmWs8oto7Vu21HhG5AqmSxqGze0907l3WLWhh3/SfvAPVp5Iz65AFCR9d/9ZZyt4jmdbNNlfZbr3Mu7SX0AsItdozX+wSlBbZ8Nk2TV5/waF2qxzUv2SfV2CFoockd5sc9s5ZbR2nvwpPDdkXVGy2SAzIar2IiNvFvMMhstw8DBaOWJ+OQCQFXo04d0SZDHOZWzLiu2vmepZLjoyyQpl6jFCHgXu0aL47MwTZEI1SdfcuBsGY+np+wXP8/bJjaG+NDI5iV7xcrZm8TmlOx5EbRQ+HxF/BRlMV35sh4pT3W66PIhV2E/pf3k5wmfbLR4TRKDq5CfKjwYtXLLaJEq379ZukdLN0LJ/nj/qX/xLjHLMFomEwejlTfiEw4AVaG5vP67XVI8FF16PqH1sbp5/pymgZ/7wX1cwC4qGi09Z27f0FpbA4Pg9WYKFSysx3Xxmimm3NcWeVI10zbp4ay2meWmPMlcT6bJ3N6Q1TZznSmfyXKHTbnolJtG69TpTJGvxzrJaBHFhsV/NotkdemQgNHKffFJCoCqPDX2YykWLfrN863uXiKZrir1u2m5TTBdIAbiMVr/e+xV0fn6HpopKFwoYGxigfoRPK7nJo5+Tdtu3qSNVJeclBwU43lTnGS1fppjutF62hQjcaNFxomLj83reV5XfV9wTn8+zKL2VywWXrlptEgn/GarWP8N2icE6WZ134ANhhl6bMYeXh6zrIwWbobPG/HJBYCboW//1y4r3p0iGa6zL79DnNPgNqkPAFbEY7R82eZAg+cjEa4fxR+56ylju1TJMkH5qc/NCOpL28+PecNqnBJZ++GiWMGsbd1ocXGjZSXK06VEc1tXOKNF8ZKsTX+rWfpzFL1y22hZ6fNVfwcM0eAN4t9jZ3g6JqVuzzJa5p/m8Y+9YOMRXhq3YLTCi08uALwCvTeEMl10lsv86UYAOPEYLTO1zr0oyPhEA9WH6kPxee+vDKqzQq+f/8H3RsxsyvztvbyPCf1+rViMFr+8R8RqtChG4+iqmBULRfRSwWiRCtF3YPkNUZHBaSIzk2ej1+nTmeKGSdtFBxM3+jnwzyleGrdgtMKLT1IAvEb9awaKSnVvlcwWfWUEvX/g04rAikQZLcL/VizFwkH1Vn3ohnZznLYvPK+2VGfFqqy+en//45ysdjhFa7SsjA+1YzFaaRYxEsX0G/LtSxWj9cmqv7UzWnQ26unZsf0kT14JRiu8+GQDwKt06PqY9n5xzbD5kumq0XSwlktduFvqB7yJikaLx3k7Enf2vteoz1oiIq2fsRit6aa2HovFaFH7VRYjUXwoD8YsVYwW6b0lB4z7qt5emMHTyglGK7z4RAMABL4iIuRZLn/unAa3S32At7BjtK5pcq1mZN6bNFNrvz9llqUZovZNbUJ/2a7ehz5ReG718402H0evrVi+ktHWP4VI26u/TBdnV64ujZu1TdJj+qXCs/ycyNomxWK0rNrRGq2TWW369OLgLJpk5d7NynXPapP+9nOvqR1ZKhktku+O1MD9Wv3j//LSnBaMVnjxSQkAyOa6mx8IfFpxpPxpxWpX9MV9XB7GjtEiLqp5iWFoiJbN2ko1FH953DQpbs6bKZC/gPh62gqpjkj97k+p/qUn37Ucq1DBQua4Lt5/qykXrdEimcdolvUYrdHifwNB95DpuoPlzvisv2srtFQzWv+dzBTJgwKfRPT1Xi98AzcEbmynTyj62+8sPMC75JlgtMKLT0oAgDWBm+c7SYaLoFwV/NyPp7BrtJwCXytcL9WMFunT5QeFz+LHoTXzdddGUevh6H4TMacFoxVefHIBa9a/+YZY++z94qenhoIEsPbpUSL13Q+l59kJNL3ursBlxXssfl+xfjdRoyEuK3oBGC2XSTWjdSZTiGIDrE2WYbbu3Ci2/HWMd811wWiFF59cIED6wh1iRffSGmsGVBe7Xu0r/v70EfHv7CdBAjg8Y7TYMamrWDOohvE8b56/RToOKtOs7XDt/aXl8G8lw1WtUe+sm+ej/yb73GLKs3Oyzs7dIqo3vllc0LKjuPg6ECvnt+hoGK0LWgViF13bUdS8+mbj+SX48+8U+FrheiXKaC1J/Ue8uiBD7Mo4wVMx6eVv9ktfOGpg+u3Ccx9I511zXTBa4cUnl9fZNGuVtugfnH6/ZA5AznJ4xmPac586NfS9KapycbPeIW6eD/y+Yu0r+0h9cht94b/787YgAXR9+nrDaPV/o52U1+nw2A3a8/7YI856XfO1wvWK12ht3vmfKHJXmvYN73S5z9cvVUxfdpCXWervf0+LbXuOi2VpR8R7Sw+KMXP2iVIjN8kGywJfj3XidHzfbRq3YLTCi08uL7Oy99ni+z6VJQMAcpef7rxA/DJlnHR8nMCV+lkui99X1M9ypYX4Yd+cgn7PEQYr8URrtHTqd+og2nd6SDo+qsLXCtcrXqMV6l6q5s/8Llo89ZsoOnCDKNI3VRTyPxYYtEHkG5oW+MZ2vVbf1s9WDZPHsoJujI/3W+TjFYxWePHJ5VVWdC8jLfgg7zj40f3a2S1+nJxE9Qa3afdsccNF30RP70t1ru4n9Uk0tI8aTW+WFn0QP7EaLWLkjLaOuZzI1wrXKx6jtWHHsSDTpJsk4zHUJcAskv0mrcCQNM2EFem/QRTru0EUGmZt3Ph4ZLTyWjBa4cUnlxehBf3Pl3pJiz3IW+jyrdPNFtHk2mHa+1CrkYsl01W1Yc8cW3jTFu8RF7buKC32IDHYMVo6TvjABF8rXK94jNaKrUeDzkCZjRb9kLOv13rtEh99RcPNz20Toz/5S0xdfFCs/vWo+PPgKXHg39PiyH9nxLETmeI03QXv14Ejp0USXYqMcGZr9Gfx/wB1vILRCi8+ubzG2uceE6v7VpUWeaAGW59sK7Yscce3sddt3l97P+Jmi6hUp1PCDRcuF+Ys8Ritc5rcLMY9/rF0zFSCrxWuVzxG6/DR08I31OIM1IiNotdrf/DyqPXE7L3Cd5fFuFnQ5UcVBKMVXnxyeY2VvcpLiztQCzec1eLUazHQb646S4aLqHxZ17hNF0xWzhOP0SKqNrhFfP/V79KxUwW+Vrhe8RgtUq37NkuXCOmG+F0H7H/6cMuu44Eb6y0uPZIBG/b2Tt4lTwSjFV58cnmJ1HfekxZ1oB773rlTrHmwg3T83MC5Dbtp71F035ZsuLpouc1L9kn9IkFfPcAXdpBY4jVaRLyGOifha4XrFa/RIq3/4z9x6aNbRD6/wRo59U/tu7Ds6uiJMyI56yzZzS//ITbtPq79BuLcn/4W05cd0M6WJflN2MlTcewkQYLRCi8+ubwEnSnhizpQEzee1eKcd3k365vn71mqnf2KdlFu0HKwtKCDxENGi44JYddoNbpd3f9A8LXC9UqE0Uqkqt23OXDmaliayLTwUnQTPOWfmrWXp3JdMFrhxSeXZ0jZK1bhsqFj0O7V4sfQpdB3cgXOcsm/r1il3u0RDRcuGzqL1XO3ScdQBfha4XqpZLTOnMkUSVk3wV/+qPXP7Dw9Z2/AiPVZL3YfOMnTuSoYrfDik8sr/PR4f2kxzyuEyP7fCs/FA+n4jzOluFNJX7RTOo5upul1ge/k4maLoC9HpdzMd1dL/VQ2Wr/8uVT8un+9xrebP5LyXkTV38jka4XrpZLRuuKJXzUTlX/gBnHipMXprCyVuzNgxiqM3MhTuSoYrfDik8srqHLZkMRjwJq1zz4gHUevcMmVfUOarsr1btNy6f66RTM2iga3dpAWc1Ugfbv5Y217zNc9tDav8RqRzlDmFXytcL1UMFqH/zst3vzO/+QPStPOaKX/Gf53DPcdOa3dKE+XFx9P4CVEei5yEv7cu118cnkFJxitzBNHjdd9UJ8zp8Xp/du0+NF5z8n5rDbpv5S3suOnT2kxut7P67XaZe8asZNbVxpxc21esnpYI+k4eo3q9QOfSORmiy4pUv6NKfNFz8ntpcVcFUi60dLb5vyR44fEmcwz4s0Vo43YD9sXaI+7D2+X6ol9R/7U4idPnwiKT1o0Qpz2z5V/TxyW+qgEHU9+nFWArxWuFx2IvNK+w6dEwQGposDQNJGc9QnDCndv4mWWKqF/CrF/Kk/ZltWbTKJo0me6515cfHJ5BVWM1sn0pdrr+uj8yUFxceaUyDx6SNvmZoqU+d/hoLa+/d+SN4026djywCcrtT7H/w3ULHrVsm+o7WPLphrbeYkXboiPlnadHtLeCxve9qr23qUv1uOf+ERayFWCFMpokSYtHmlsv7d6vLZ94Gjg+xjnpr0r9dl9+A/x938Z2vaMX16WxqPHCQsGBv0NqgGjpYjy0mjRF5kGvrIh6+sb/I/JAzaIY2EuG+r6fc8J4eubqn0KcdLcfTxtSzBaiRWfXF5BFaOl8eUE4/Wtx8zbvM1zp3ZvFifSFhq5o/MmGttmoxW0Tz+ZRzJE5sljRvvM4T2GGSOdWDdX6pOXwGhZQ2e59G0nGC2z9Piome1F+t6fjPZjX3U18mS0rMbQt3nu67T3LHOqAqOliGIxWvRN7tq3vfdJzeaO9eLZubFfvnt53j75e7K0y4Ebxcvf7Ofllrr11R0i2W+0kodsEPVGbxWtn/5dTImyr5VgtBIrPrm8glJGKwuRGfhdUG3bQkadaZvHeF04o2WlU39u0HJk1nTxfnkFjFZknGC09DNax04dFU9/O0jbHjXzeuP1ZhbluNFK273ayOmPOmcyT4uNu3/Qtn/euUTLHz52QPo7VAJGSxHFYrR2HjyV/SPQJoZP3clLI6r189tC/sxOozFbebmlPltxyPKb6cn82fkuLxitxIpPLq+gotEiSOZHK6xyeuzMoV1BsXBGS79syeNmjq/+NGJNbgGjFRknGS29TY90RuvoiX+keoIbLZJunvT+5px+yVHnr79/EydOH5PGVQUYLUVk12iZz0bZMVqvL8iQz2gR/hh9QWk0Suqfaj2Gn3FfxP5biDBaiRWfXF5BFaNFOvb9dGP71I512nbmyf+0trnOatsc43GSYbTOnDby+r1fes1/i17Ttk/v+82In/x9TVa/Uxp8f3kBjFZknGi03lo51tg21+48tEV71O/RIjPG60ifrX0xqE2PZtN24vRx8cfB9KCxVQJGSxHZNVpm7Bgtkm9Q4B4tM4X85ulEFN/6/sa3+y3PZunku2O96RuEohOMVmLFJ5dXUMVoEeJ04Lvm6F4tc/zkbz9o8Ux/3hw/vTfbEJk5c3Cn1D66YEp2vz2B7707vWtTUF3mqcBPcZ36Y212338C91Se+mujtJ+8AkYrMqobLfpEoX5TO7Fh1/dajLafXjBQe83peuTLW7W4fkZL1zurngga0yyr+LGTR6W/QyVgtBSRbaMV5xkt0r/HzohWE34XvoGp2u8jNnvyN14SUt3f/tP6bFZWLLl3qn/8wP+0o5XHjdbnfvbyYIxa6Yf+naf9DOOTyyuoZLRAdMBoRUZ1o2UHfunQbcBoKSI7RivI4Iywb7Ti0YyVh4RvSNanFvV7vUx/V74+sX/tg0eNVmFfwBzp2JXe/5C+nZycLE0wJ1C+bAUx9p7/SfFogdFyHjBakYHRch4wWorIjtHiZ5FGvJv7RovU8P+2Bn5kmv09vjvTxNo/AvehxCKPGi36u5L97MzatiPq14UH7x8yRppgToD+PS2atJHi0QKj5TxgtCLjRqPldmC0FJEdo2X+3it6LHfPJtHAb3roKxY4jR/dKk6djvVuqeh09PgZUf3uzYG/J8twkcl6Lcqb6bk8arR02TVa//lC9OOTq2K5ysaZs9s63GE1+bTHYkWLG3Whavp0HRKyhnhl3DQj/9iI8VJeH4sokL+ASE/ZHxTTqVS+itQvEjBazgNGKzIwWs4DRksR2TFaxtkjdgnR6uxSQb/xOXIs8B0+OaWX5meImyZuEwPf3CGWpv/L01HL40Zrhy9gLmKVbkoksYml0afLYHFz265G26qGaNawRcSaJvWvtqwpXKiIFkv5bJ1ImbHeskaPDet9b1DePD5RtVK1oH7RAKPlPGC0IgOj5TxgtBRRXEYrBOYzXmS06KZ3J8jjRmubL2AuYpVuSiSZJpVkdPR4+tLAmSS9PWdqilTD2998sEqK6duz31ki9eE1tB3u/jHKt2x2nRSPFhgt5wGjFRkYLecBo6WIYjJah7IuHYb4otEgssxWwSEbYLRGOcJo/eYLYZgiKCqjlZSUZDXZxJTH3w5qW9WEa/MYbRMbFv7lZ5cBxZ68/3mj5sMXv5TGMY/RtsVNUjxaYLScB4xWZGC0nAeMliKKyWjZOaM1FGe0CAcYra2+EIYpgqIyWi2aXms12cSgHiOC2lY14do8RttEt459Dbrf3Ff06jwwqGbFF2nSOOZ8x7bZv/EWKzBazgNGKzIwWs4DRksRxWK09v1zSvh6rtd+4sYS+h1EHrt9vXbTuhPkcaOV7gthmCIo0xein2lShTRImxbvDWpb1YRr81ioffH6Vyd8IMXNeRitbNa+MlKKWfHX9EelmFOA0YoMjJbzgNFSRLEYLdKJE2fE8Vg46QyTRfK40drsC2GYIii/L9BvNk+UOiuweGXlrSZb2LZVjLd5bMlnv1jW8PpwNZSz82lDHbtGi/bLY7mF/pwQrerVlHK83oomF1WXYk4BRisyMFrOA0ZLEcVqtNwsjxqtoEXWBM9HEu8vateqY55YEgO63cUnn9WEDNu2il3Z6BppX7yG58z5WW8vNmIFCxSU9hcJO0aL9jV/fH/xZO/rpFxuQPvXtwe2v0I0vTjbNJlz4YDRcjcwWs4DRksRwWhly4lGa1W30jet6FZm4YpupZ/huShVMwS6qvq5w9QOp6v8/OrnQT/5+OR6d9LnonKFqqJFY+svAx3/wGQpNnZU8De0P37vRKnmmUdelmKbl+wTV9RrJipXPFvMe3+llCceHT5O+/QhnQXjuVfGvy+q+PumfvenlIuEXaNlfjTHdeaN6xeyxrz90cPdtMcJ/dppsSsvOccYg+/XagzetsoRxYsUCoqT0Wpe51wtd1bR4JzqwGhFBkbLecBoKSIYrWzltNHSt1uPWvEpPw52RItDKHhtXohPLq8Qq9HyP1Xink5XG9t7Pn7MssZqm7dpe+6TfcO2+dh6/OdXRorlzw+VavT2tPtvC8ote26I31AVluqI6hVKSeOoDIxWZGC0nAeMliJSxWhlZmZqhJKej1RHOn06/I9Jjx8/Xpw5I987lltGy8Qpfjxi0fLupedwg2VmZa8ybXmf3BSfXF7BjtHSt5vVDpx9Mucfuq2lZKZC9Q+Xs2qb42bq16wi9aHH2WPukPrp2/zSYah9qQiMVmRgtJwHjJYiitZojR49WgwePJiHE6Y5c+aIAQMG8LCmH374QVx88cXi8ssvF3Xq1BENGjQQixYtCsrT36erXLly4q+//jLaXBdeeKGlGctpo0XPd5t7l6/jOYIfl2jFzRVnZbfSD/E+uSU+ubyCHaN15SU1DKjN89G2rXIccz5cP75Nj/s+/b+QdTBa7gZGy3nAaCmiaI3WtddeKy644AJx6tQprZ2amirmzp0rvvzyS3Ho0CHxtx96JK1evVr89ttv2vaPP/4oZs2aJXbt2qW1U1JSxNtvvy2dlZo3b5547LHHjPbMmTPF+++/b6oQ2r5feumloBjp559/FuPGjTPaDRs2FHv27NG2lyxZoj0eOXJErFq5Utumfwftn8Y6fuyY0S83jJZZ/vhpXkfwOl3+XFqkmm+7lC7JzZa/OInX5Yb45PIKsRit/u0aSTEfMzlb3rk/ZP6IRX2o2nDwOqsx6TGaOuL1kZ2kWpWB0YoMjJbzgNFSRNEYrQ8//FBMnjxZvPjii+KLL77QYlu2bBGrVq0SjRs3Flu3bhXr168X69at03IPPvigUUcG7YMPPhC7d+/WjNQbb7whNmzYIGrXrm2MT9KNFl3Su/LKK8U333yjGbR69eoZNcePH9f+Bi4yWrTPzZs3i/T0dNGoUSPDaPXp00d7pL9x6NCh2nbdunW1bTKKl156qTFObhstXW1GLfuG1xO8jmTKS1+nYBY3WzyfG+KTyyvEYrR8FmZk81v3BZmbcX3aanz5RB8tdlOTi0X5ksWMvHkMPt7Z5UuGzZvj+n4qlCpu2efAjDHa9jP924t/Zj0hjUXtS8+paGx/+/QAaT+qAqMVGRgt5wGjpYiiMVrt2rUTh//+WzsrZDYm//77r7jnnnu0bTrDRWaL9Mgjj2iXAkldunTRHukM0kUXXST27t0r/vjjD9G6devAIFnSjRadFWvZsqUR79u3r3EWLZzR6t69u/jf//4nJk6cKJo0aWIYrYEDB2qPZLSGDx+ubZsvHdLfp599yyujpavNvcu/5/0CrBho1Jji5r5cy7uVmmQ2Wiu7nFWG1+S0+OTyCrEYLboni8fMcXrUeeHODka+atmzDKNjHsNqPLoZnmpLFS8i5cz9dOhTi+Zcl+Z1g9oV/UYsKcknFozvHxT/deoDYuLAG7R9/fDCXdI+VAZGKzIwWs4DRksRRTJaZEiuuOIKzbzQI5mg7du3azm6X0oXGS39jJbZaPXs2VN7PHbsmHZJjwwXnbXiN6PrRovureratasRHzZsWFRGK9Slw379+mmPdKZLN1p06VA3Wr169RK///67tp3XRsus1qOWv8nHICjH26GU12e1+OTyCrEYLaAGMFqRgdFyHjBaiiiS0dq5c6dYsGCB0V62bJkYMmSIdgmQzM2BAwc0A3T06FExYsQIcfjwYe3S3+zZs7X6Hj16GH1vuOEGsXjxYu1M2IoVK4w46euvvxaPPvqoOHHihHbWjM560VkougleV7RGi26W141Ws2bNxD///KOdlSMDSCKDOHXqVM0w1qpVy+inktHS1WbUirF8LA7vo2vxNb78MFrRs3nBFo2Ns1eLtE/maaS++6HGL5PGih9H99D4/q4rggysFXwhB2oDoxUZGC3nAaOliKIxWlxr167Vbm6ne6I2bdokDh48qMXprNHKlStFRkaGZsBI+mU5XWSeli9fbvTRRe0dO3YYbbqJXj9DZhbd68VFJk+/2Z5EZ9dOnjypbdOlSP2G+G3btmmPv/zyi2a+6B4zs1Q0Wma1uWfZQ3xcjXuX38NrdeWl0dr4+RJBrHvtZfHTU0PFj2N6i9Ujrxbf39lAY9WAC8XK3mdrcKPidPhCDtSGjhlfDEAwMFrOA0ZLEUUyWl6Sykbr2lHLO7S+d9lHfFyda+5cXJz3IfkXkDOGAehWJp0bAhAdqwZe6DeJzTXWPHKr+PmpOzV+eel/GqnvfyY2fblGg+r5Qg7Uho4ZXwxAMDBazgNGSxHBaGWLnouchD/30aj1qOWjuakKBe9L8i8gR7hpUJcyAXqUzaKcWNEzwA/33yDWPNxJrJ30uEj7+GsNPnlVgf4tfCEHakPHjB9HEAyMlvOgdYcfRxXg65TrRQcCsie75ilW6Ubq2lErtvnpyfPhtLxbqeO6kVnevfR7K3uUeZxY0a1M3+XdS7X0PzZddXupGsu6lyzN+8YrPrm8AoyW84DRigyMlvOA0VJEMFr2lVtGKx6ZzxjxXE6LTy6v4BSjlfHZGLHnk9FS3IvAaEUGRst5wGgpIhgt+4LRCi8+ubxCrEZL/06sW6+uIzpfdam2zWtigfr/+NJwKc65sfFFYlTnwI9Zex0YrcjEY7TyFUjWXpec4mUKSbU6lOcxpzDis+tEjQblpHhuA6OliGC07Et1o+VfPMbBaOU+sRotX5zGikPjRWO0QDYwWpGJx2iZodcnj1kRbV280H6Gf3ytFI+HaI1WTv8bYbQUEYyWfTnAaBkmC0Yr94jFaL00rKNoVa+mFNfxsTMA5jj9wDPPXVStghQrXDC/FCMaXXC2qJ31kzn0sz708ztWdfzvMP+951TUXldSvdOA0YpMThmtjo800GLlzikRto7OfvFY5QtLaY8lyhYW+QvmM+LFShcSpasUC6ol8uVPFoWK5hd3TW+jtWteEZgvFWuWFJXOL6nF2g6voz0WLVlQnHd5eSOu0/O5ZuKafhdJYxM0dvkaJSSjVaFm4Kx1qcpFjRiNSzF6vLhFFS3WqNN52hjhzvTFAoyWIoLRsi+VjVZemywSn1xeIRaj5QtjUChXvUIpo132rKKifKns3zisc24ly3FoO9QZLcoN79hM2+ZGi35WJ9R4fAyrbScDoxWZnDBazXtfKDo8VN8yF267/+stjG2e081MyYpFjFzP55sF1SXnSwrqYz6jdeHVlYNqb7ivnrQPfdsMr7E6o9Xt2aZSHa+JJhctMFqKCEbLvlQ1Wst7lLktyGh1K/0Vr8kN8cnlFRJptMztH18aYcTo8bNHexg5us/L3I8brSlDO4iKpQM/Fk33gVGMG618ycmW+6Zt6qtjzhUpWCBoP04FRisyOWG0zNt6+66PAmeb9Fyz7rWC6sic6W16JCMUbjz9setTVxjxbs80ETc+EOhHOW607vygteU4fFvnrApFtDNZepuf0YplrGhy0QKjpYhgtOxLNaPl/2OS+JmsvDqbReKTyyvEYrTG9GwjShYrLMUJ/1MY1H7vvq5GjB6jNVrmcWjbjtHStzkwWt4hp4wWGRszvI4eeV37u+sauWiNVrj9cKNlHoMoXrawVnPzYw01E8XzNMYVnc8z2txoUb563bLS2TKrv5fOxPE6u8BoKSIYLfvKa6PlXxxOrAh883v2t78rYrJIfHJ5hViMFuF/qqSYHi9UIL/RTkpKEo0urGbkwhmthc8Mshyftu0YrQMzxhhtMzBa3iGnjBbP81zjLjVD1lE8WqN1UfPAfVAcykUyWnodH1+HzmjRfVh622y0fEnWfxPf7vvy1aJu22qWObvAaCkiGC37UsBoScZKFZNF4pPLK8RqtM6vUtZ4E9fRc+HioYxW1+Z1tXyZEkWNWjJotatXEO+M6hKz0Vr4zECt3fTi6qJa+VJBORgt75ATRqvV4NqiosmgtMs6U8XrzNt3fXStGPjWNUY8GqPV+4WrpJy5Rr+pnrBjtAZPbRnIzciu1Y1W8TKFxcA3s//eUP8uMnt6m56HUPuKBRgtRQSjZV+qGq3FXcpb/u5hbotPLq8Qq9ECeQ+MljW39XrS2E6U0bLi7EvKBF16s6JZt1qiQKHsTxba4bxGFUTRUoWk+PmNK4oK52YbPivoE4s16lvfd6VTsIj139fktvND/u0UH/Jeq6A2r7ELjJYigtGyrzw3Wt1KP+pfILYv61Zq5/IepSd83d5XiNfkpfjk8gowWs4DRssaeo+77943tO2cNFpOwJeAM0y5DYyWIqp4yS3bgH348wlli08urwCj5TxgtKyhhfqqQbPENx+v87zRyl8wWYqpDowWBLlcfHJ5BRgt58GNVpeeTwA/tFDTD9pXqtNZjBj5qrSQA7WB0YIgl4tPLq8Ao+U8uNGqUu82zWCAbGjR5gs5UBsYLQhyufjk8gowWs6DG63XJ88HfvQzWhXrdBKjH5kmLeRAbWC0IMjl4pPLK8BoOQ9utEAAWqgb9XhHrJjzq+fv0XIiMFoQ5HLxyeUV7Bitf754QrS6rKa4+5arjNj4vu1E/nyB77Za+8pIMarz1VI/kBhgtKyhhbpSnU7adiKMlv9tQfR7tbkUTyS0Dx7zKjBaEORy8cnlFWI1Wv6nSvsNQb2tf4mo2WglAtoPj4EAMFrWPPTgVGM7UUbLvF2tThmpJl7yF8on7njhKinuRWC0IMjl4pPLK9gxWjxGmI3WkVlPiMNfPGHk/p75uLjqkhpiQr92QX02vXWf9ki5W668JChO+6HHv6Y/Ku3L68BoRSZeozXys+tEo07nSvFE0/HRBjirlQWMFgS5XHxyeYVYjNYFZ5eTYjpmo7V16gPi1eG3GLlKpUsY2z6TUaPtFnXO1ba/fLyPlOP7AAFgtCITr9EqXLxAUJtej62HXGJs07ezV78s8HNU5prk5CTtkcfptwtLVy0W6NukojQ2378XgdGCIJeLTy6vEIvR8oUxP6GMVpFCwb8vSGN8kvW7h3w8c5vnQDYwWpGJ12jR64+3zUYrmvqek640ts2/T2hVy8fzIjBaEORy8cnlFWIxWhVLZd+bxQlltPxPrcRLwzoaOfMY5jbPgWxgtCKT00arVrNKUp639ZhVLlzbq8BoQZDLxSeXV4jFaP3qN1D5kq1veA9ntHitDs+Z2zwHsoHRikxOGi1zTK/j9WWrFQ+Zi9T2KjBaEORy8cnlFWIxWoT/qRKDb2hstAe2v0J7DGW0Fj87SFQte5Y0jj5WqDbPgWxWj7xKOo4gmJcmzhV9X20vLebRQq8/3uZGy1xnVX/rE41C5sK1vQqMFgS5XHxyeYUV3ctIC3kk7u/SQlsc9K92IDa8MUo807+9tn3o87Ei/e3AJwqJFZPu1MxW5TIlxIzRPY1495b1gsY1t7dPe0jbxwcP3i7t3+tsnJkiHUcQzMo5v4ra7TpKi3m0dB3fWHR4uL7Rptei+dKhTpPbzg+q0andskpQ3Dy2uT10Wmsp71VgtCDI5eKTyyv8/PQoaSEHapO+eJd0HIFMpTrx/d6hz2SAaNvqjFa80CcR+acQvQqMFgS5XHxyeYmVPUN/bQNQi42PNJOOH7CGFm6+mMeCjxktnk8EOTWuE/l6+lrpGKoAWyogCLIrPrm8RKz3aYG8AzfCR0/Xnk9KizlQE7rMy4+fKvC1AoIgm+KTy0tsmrtOWtCBevz+9E1i7bMPSMcPhKbFoJukRR2oh6qXDQm+VkAQZFN8cnkNnNVSH5zNip14Lx+CnEdlk0XwtQKCIJvik8trpH38tVjZq7y0uAM1+OnOWmJLyn7puIHIwGypS6fHrxfnNeouHTOV4GsFBEE2xSeXF/l+8KUi7eGm0iIP8pY/JnUVK3tXlY4XiI4PXl8quk64XlrkQd6j+tms9KX7f+NrBQRBNsUnmFeh72j6cUhNabEHeQNdLlz3ymTpOIHY6HbHOFH5MpzZUoXhH6tvsohNy/Y35GsFBEE2xSeYl/np8QG4Z0sBVvYsKzbO+UE6PsAeLzz7JS4jKsDgqe1EpTqdpOOjInydgCAoDv34oyjAJ5nXIbNFHJx+v2QCQM6xokcZsfquxtLxAImBzBYMV+5zYeuO2vO+Ys5W6ZioCl8nIAiKU3ySgQA/PTnIMF2p9zUU6WNaia1PtgUJYMvY1uKXkZcaz++ah26Wnn+QM+iGq0bTm8Wt464Xg99tJ5kDYI/hn7QVfV5pr329hv48z5q2RjoGqsPXCAiC4hSfZAAAb/DchJnilm5jRP1rBoEEcGXb4WLYXS+JjYv3Ss+1k+BrBARBcWrz8v0l+EQDAADgPcRYkczXCAiCEiA+2QAAAHgPvjZAEJQg8ckGAADAc7zL1wYIghKk9CUZjSwmHQAAAI/A1wUIghIsPukAAAB4B74mQBCUYG1cur8yn3gAhGPN3F+lmJtI/e5PKaYqP837XYrlBv63DpE/X34pDpxF2qdpBfmaAEFQDohPPuAu/Ic4iPcmfyHVmLmxTWetjsfN4/GYm6B/35hRz0pxFaG/NTk5nxTPaWi/MFrOx1gEIAjKWW1Zun8fn4DAHfgPr6h17oUibeEusXLWJsNs8TozkYxWv9uGSTErHhg6Juw4iSZR+xre9wEppir9bx8mln+xQYrnNPRcx2q0EnV8QGLIXgEgCMoV8UkI3IsvwoIXyWhFy72DHkvIONESaV/pKfulWG6jwt+QCOi5TqTRcsvz4hQ2Lt1/g/n9H4KgXBKfjMCd+MIseEQko8Vz1DYTiCVJ8bRFu8P20fly6lIt9uyjr4SsMfPA0LHSeC899a6RP6t4yaBc6ZJlpTHM8H1Re+0324PGqFyhqmW/UH9vkcJFw+b12Fklgv9WyiUlJRvt5ORkqd/A7sOD2pH+lnULdkh5os5F9YLq+H44ZqP19MMvSvlln6dquYvPv1TKrf92p5YrWKCQlOP7BonHB0FQ3ujXFQcv5RMSuIuuN/aKuJjFYrRoO1RtqDNaPHZ53aZBMd1okTnRY8WKFJP6cazyVn+fVYznedscW/DhD1r7nYmfBdVULF8lqN/GxXss+xP5kvMFxfSaT1+bL8U2MoPasE72j3BTmxstvi9qm88YUXvOO0uC2m88+3FQH94/KSnJaM9881stZjZaF9asHdSnUMGAgeLj8LFXf7lFqrmuxY1SHUgcPgiC8lZ8UgJ34T/EomSJUlLcTE4arXbXdJBifEzdaJnzZFp4jMPzSz77RYoRfboOsYyHGofak8a+KcXM5oL34bVWl8YiPY/RxGibGy36d/M+I/o9GNQ253vfOliK8f5WsXCXDme8ETBjvA+v45xf4wK/Ya0sxUGCSMmY6YMgKO8lTU7gCnwWC7cVsRgtvU28O2lmUNzKaOm1Vug1VkbLar8cnqczIzwWqjZcjtpvT/xUipUtXV7b3rxkn9SH1/IYj/PnINoYbXOjtWr2pqA+dDaqW8c+QTVLZ6wPao8a+GhQHzP8b9Bj3GilfveX6NNliKhdq4723PB+vK1DxrBJ/atEjbPPE/nz5xflylSQakBi8EEQpIbGjh2bzCcocDb0FQC+EAsdJ1ajRaycLX+i8b4h/yfV8horEmW0WjRpI8VC1YbLUTuc0Vr7zTapD6/lMR63el6iidG2HaPFMddzrPIUMxstfZwNC3dp7QXTV0v9eFuPFS5UxGhfcN7FfqMVeF5BYvFBEKSW0pdm7OITFTiTAgUKWi5yobBjtMy59yfP0rYfvPNxqbZu7YZSjJMoozXv/ZVSjLi5bVfLeKhxqB3OaFn14bU8xuO0zeuiidF2NEbrdma0zPlIWNVTjBstcz4ao7VpyV4pphkt0/MKEoMPgiA1tWnx/hv5hAXOghZDn8VCaYby5pqbsozW+gV/BmGu17fNN0nz3Iov0iz3TbEa1WoGxUqXLGNsx2O0+KcB+b+tXYvAPWJ0WZP3N/fhbUujVapcyP2QCftl/h/adtOGzYNyFKf2+AenhOwfbYy27RgtM/wSIMdqn7wftb/9aI1Uw8fp1Xmg0ab71sw1o0dO0NpmAwvixwdBkNr6denB2/nEBc7BxxZVM7xGb3e/pZ9Uy+v17WJFiwfVPHzXUyH3zz/5xtFzdo2W+Wscppm+/Z7vhy5p8r7h9kPtSEaL7k/i++H1ZooXK2GZjzVG23aM1vWtbhGTxrypfTUGfd0F3w/H/LfTWSd6NButpx6YHFTDTRShm349z8fV62G0Ese2lf9c5IMgSH1tXZrxH5/AAADn8cYzH0kGiKDYoB4jpThwLmkrD5fh7+UQBCmsdfP3FOMTGQDgLCaOfk0yWrPfXizFgLPh798QBDlEqSkHqvEJDQBwFj52uY5I/Tb7HjzgaDKD3rQhCHKmtqbsn2gxwQEAAOQRm5ft68LfqyEIcrA2L83oyCc6AACA3Ie/P0MQ5CLxCQ8AACCXSNl/mL8nQxDkUm1Zuv8n6U0AAABA4lmWMYe/B0MQ5BH53wQypTcFAAAAcbN12YEz/D0XgiAPavFikT99acYp/iYBAAAgdtKX7B/F32chCIIMbUzZV4u/cQAAAAjF/qOffiry8fdSCIKgqLQlZf9g+Y0FAAA8SkrG6fSlGVfw90oIgiAIgiAIgiAIgiAIgiAIgiAIgiAIgiAIgiAIcqr+Hx4hN6natT0XAAAAAElFTkSuQmCC>
