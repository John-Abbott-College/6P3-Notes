---
title: "(DRAFT) Milestone 6: Final Presentation"
description: |
  TBD
date: 2026-05-01
blogpost: true
location: Project
author: 5%
language: 2026-03-14
---

## Deliverables 

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
   

### App Dev III milestone 

This is the final Milestone for the project. By the end of this milestone, your team should deliver the following:

* App controls actuator devices via Azure IoT Hub.  
* App reads and sets Device Twin desired properties via Azure IoT Hub.  
* Advanced views finalized to display historical data.  
* App Documentation with app setup instructions, details and features.

#### IoT Hub Communication 

1. Controlling Actuator Devices  
   * The mobile app should communicate with IoT Hub to control the state of all actuators (fan, lights, buzzer and door lock).  
2. Device Twin Properties  
   * The mobile app should read and set the telemetry interval.  
3. The app could either use direct method or Device Twins properties to set any of the thresholds. Refer to this example from Microsoft’s documentation:

   📌[Sending commands to device using C\# app](https://github.com/Azure/azure-iot-sdk-csharp/blob/main/iothub/device/samples/getting%20started/SimulatedDevice/Program.cs)

   

#### App Advanced Views 

## App should display all basic telemetry data. This includes any missed data in Milestone 5 or sensor which wasn’t functioning properly. 

## Display of historical data: 

* ## Since saving data in a storage is **optional**, you may use events in the Event Hub partition as historical data. 

* ## Finalize all views that display historical data. Data can be displayed in different formats depending on your app design. Here are some examples: 

  * ## Graphs. 

  * ## Data grids. 

  * ## Maps. 

#### Documentation (Due on May 28\) 

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

1. ## This may also include automated rules when certain readings reach thresholds to automatically activate a given actuator. 

2. It may also include push notifications or email notifications to alert the user.  
3. It  may additionally include a 3D models or 3D printed parts which help turn your project into a prototype product. 

##  

   

#### Grading Rubric (Total 30\) 

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

