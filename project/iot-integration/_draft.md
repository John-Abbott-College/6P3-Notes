2025 instructions:

In milestone 3, you have laid the foundation of your app. You created your models and most of your views. In this milestone you will connect and retrieve data from the IoT Hub.

By the end of Milestone 5 your team should deliver the following:

* `.Net Maui` app connects to Azure IoT hub and retrieves data.  
* Models updated as per the telemetry.  
* Basic data displayed in views.  
* The user authentication is implemented

**Notes**

* **The code organization statements stated below are suggestions to have a better and clean code.**  
* **Your code design could adapt the concepts as is or change them as needed.**

## Pre-requisites  

Before starting this milestone, ensure that you have the following steps completed:

* Azure subscription   
* Event hub namespace setup  
* (optional) Azure storage account and blob container  
* Hardware subsystems are completed and sending telemetry data on the IoT Hub


## Authentication 

In this milestone your Login page should be fully functional, allowing a user to be authenticated. You do not have to implement a sign up page, but this is a nice nice to have if time permits it.

You should also route the user according to who they are (based on user profile). You may simply serialize the repo of users with their type (see [this](https://john-abbott-college.github.io/6A6-Notes/#/labs/Lab3?id=exercise-5-serialization) example of C\# class serializations). Implementing a database of users and/or devices is nice to have. Here is an [example](https://john-abbott-college.github.io/6A6-Notes/#/labs/Lab4?id=lab4-part-2) on how to implement a firebase database with CRUD operations. 

Provide the user credentials in your README.md file to allow me to test your app.

## Connection to Azure IoT Hub 

You should start the process of connecting your app to `Azure IoT Hub`. The key objective in this step is to keep the **code as organized as possible**.

Here is a suggestion on how to organize the code:

* Inspect the sample projects provided by Microsoft:

  📌[Receiving D2C message in the C\# app](https://www.nuget.org/packages/Azure.Messaging.EventHubs.Processor)

  📌[Sending commands to device using C\# app](https://github.com/Azure/azure-iot-sdk-csharp/blob/main/iothub/device/samples/getting%20started/SimulatedDevice/Program.cs)

* Create a service class to connect with the IoT Hub  
* Ensure that you have central repos to receive the telemetry data

![][image2]

## Fixed Values 

* Any fixed data values such as *connection strings*, *server settings*, *credentials*, etc. should be inside an `appsettings.json` file. You should have a `Config` or `Settings` class which helps deserialize the json.  
* This class (`Config` or `Settings`) should probably be static or instantiated in the `App` class, **so the values can be easily accessed throughout the app.**  
* Follow variable naming conventions in .NET  
* Provide meaningful names.  
* Use constants where applicable.

## Handling multiple devices 

* The app should be able to support multiple devices even if the demo is done on a single device.   
* Each device will have a different device id to be stored either in a local embedded file or a database.   
* The app should be designed in a way to be able to handle **connections to all three devices at once**. 

## Use of Data Repositories 

* Retrieving data from any source should be done through a data repository class. (similar to the databases example lab)  
* Your app will eventually receive the telemetry data of each subsystem. Start planning for this as you design the repo.  
* **Keep in mind the OOP abstraction pillar: a single class should describe a single entity and should not include unrelated code.**  
* **A single instance of the data repos should exist, you can either use singletons or create a static instance.**

## Use of View Models (if applicable) 

* Ensure that your view models are not containing the data, but rather providing public accessors for the data repositories and models.  
* If a view model depends on a data repository, it should be passed through its constructor.  
* Ensure that the view model of each page is set as its binding context (similar to the assignment)  
* It's also preferable to register the View Model and the View as singletons as per [Microsoft's documentation](https://learn.microsoft.com/en-us/dotnet/maui/fundamentals/dependency-injection?view=net-maui-8.0) and similar to what was done in previous assessments. 

## Error handling 

**Defensive Programming**: *is a form of defensive design intended to ensure the continuing function of a piece of software under unforeseen circumstances. ([Wikipedia](https://en.wikipedia.org/wiki/Defensive_programming))*

* As you are starting to interact with the cloud, remember that your app should be ready **to handle disruptions**  
* Similar to the authentication lab, you should make sure that the user is notified of incorrect credentials and network disruptions.  
* Additionally, data retrieval is dependent on accessing the network.   
* Similar to the assignment, make sure your code adds `try` and `catch` clauses where needed and raises the appropriate error to display to the user.  
* Refer to [`Network Connectivity`](https://learn.microsoft.com/en-us/dotnet/maui/platform-integration/communication/networking?view=net-maui-7.0&tabs=android) documentation (and the lab on authentication) to check if the network is available before proceeding to connect to any network resource.  
* You are encouraged to unit test the parsing of the telemetry payload and the models correct updates on data being received, if time permits it.  

## Update of Data Models 

In the current `Connected Objects` milestone, the telemetry payload is being well established and **clearly formed**. Revisit the `Models` created in the previous milestone and make any needed adjustments.

## Display of Data 

Start the process of connecting the backend, the data, with the frontend user interface.

* Use the data repository classes you have created to retrieve the data.  
* Use `Data Binding` to display the data into your views if you have not done it already.  
  * Display the basic data.  
  * Include the units of measurements so that if is at least relevant.  
  * Be mindful of real time updates, your views should be notified when the data is changing.  
  * You may start working on advanced views (if you have not already started).  
* As you are not required to include information about the actuators in your message, any UI control that is supposed to **send data back to the IoT hub is not required to function in this milestone.**

## Code Quality & Comments 

Refer to Milestone 3 for the details of [Code Quality](#code-quality) and [Comments](#comments-and-documentation).

## Deliverables 

* Schedule a meeting with me to demonstrate your progress. The booking link will be provided at the start of the presentation week.   
* **All team members must attend the meeting.**  
* Your presentation should not **exceed 10 minutes.**  
* Your presentation should demonstrate:  
  * Login  
  * Connection to the IoT Hub  
  * Display of real or simulated D2C messages  
  * Error handling on network disruptions

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
|  | Services class are divided up into various services with single responsibilities  | 3  |
| Code Quality | Authentication \- code quality | 1  |
|  | IoT Hub Connection \- code quality | 1  |
|  | IoT Hub Connection strings is centralized | 1  |
| Iteration of the project | Views & Models \- feedback from milestone 3 is implemented | 3  |

	

