---
title: "(DRAFT) Milestone 3: Prototype"
description: |
  TBD
date: 2026-03-01
blogpost: true
location: Project
author: 5%
language: 2026-03-14
---

## Introduction 

In milestone 2, you have created a project proposal which represents a storyboard of how you want your app to function. It will be your roadmap as you proceed to the next step. It is perfectly normal as you proceed in this and the upcoming milestones to have changes and updates on the app design and features. This milestone will serve a skeleton app for the project. 

## Project Organization 

Create different folders within the app project to keep all the files organized. Use what is relevant to your project from the list below and add any needed ones.

* Models  
* Repos  
* ViewModels  
* Views  
* Resources  
* Images  
* Files

## What you do not need to implement 

* Service classes  
* IoT Hub connection   
* Authentication service   
* Databases

## Project Tracking 

At this point, new tasks taken on by team members should be organised and tracked using [GitHub issues](https://github.com/features/issues) in the respective Epic Milestones. 

At the end of each sprint and deliverable presentation, the team will show their backlog, boards and task assignment.

## Architecture  

You are free to select the app architecture that you prefer, but a layered architecture is expected where the UI aspect of the app has to be separated from the Business logic. Your app should use event-based programming and data binding. Your classes should be logically and coherently designed, ideally respecting the [separation of concerns](https://en.wikipedia.org/wiki/Separation_of_concerns)  principle and the [single responsibility](https://en.wikipedia.org/wiki/Single-responsibility_principle) principle. 

## Models 

Based on the provided project requirements and your project proposal, the app should have **at least 3 models** one for each subsystem. Always refer back to your design document and feature list as you might need to have more models.

As you are adding fields and properties to your models, **do not forget**:

* **Validation**: Your model is not aware of the View and therefore should validate the value provided to the setters.   
* **OOP Encapsulation** : avoid exposing unnecessary information  
* **OOP Abstraction**: Hide unnecessary details to other classes. For example if you have a method which updates

If you are still unsure of how the data will come in, include a *TODO* in the code and add a user story to come back on this technical debt later on.

## Views 

Use the wireframe layouts created in milestone 1 to start the page design in `xaml`. Build the pages and add basic (stacked) navigation to be able to examine the look and feel of the app.

If a page cannot be created at this stage because it is dependent on a on a story or a feature that is still not introduced or available, simply add a placeholder for it.

As you are designing your Views, **do not forget**:

* Reduce the logic from the code behind as much as possible.  
* Use data binding whenever you can  
* Prioritize having all the essential features (you will have time to go back and improve the look and feel of the app)

Feel free to use a ViewModel to improve the 

## Data Repos 

At this stage of the project, you still do not have access to a back-end server to get real time data. Create test repositories that would provide your app with **dummy data** to be able to test different view designs and over all app navigation. Similar to what was done in Labs 1, 2 and 3\.

## Code Quality 

You are expected to use good coding practices:

* Code Reusability  
* Variable naming conventions  
* Descriptive naming  
* Indentation  
* Use of constants

## Testing on iOS 

* In this milestone, we will set up the iOS simulator in P322 on **April 4** to get your app deployed to iOS.   
* [Testing on iOS](https://john-abbott-college.github.io/6A6-Notes/#/labs/Lab_Testing_iOS) steps. 

## Comments and Documentation 

* Use the `.NET` official documentation style [XML Documentation Comments](https://msdn.microsoft.com/en-us/library/b2s063f7.aspx) for all the `C#` files. Include the `<param>` and `<returns>` tags for methods. The XML comments provide the ability to automatically create documentation files from these comments at compile time.  
* Each class file should include a header with the following information:  
  * Team name and number  
  * Semester information and date  
  * Course name  
  * High level description of the class  
* Add additional comments on any non-trivial code.  
* The `.xaml` files do not need to include any documentation unless you have used code of the internet and need to provide credit to the author.

## Deliverables 

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

