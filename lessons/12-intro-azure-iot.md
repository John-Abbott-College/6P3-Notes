# Intro to Azure IoT & Tools

From now on, we will deploy and manage our IoT solutions using Microsoft Azure and its Azure IoT platform as a service (PaaS).

## Platform as a Service (PaaS)

Platform as a service (PaaS) is a complete development and deployment environment in the cloud.

**PaaS Includes:**
- Infrastructure:
	- servers, storage, and networking,
- Platforms:
	- development tools, business intelligence services (BI), database management systems, and more.

> PaaS is designed to support the complete web application life-cycle: building, testing, deploying, managing, and updating.


![Compasion of SaaS, PaaS and IaaS platforms](assets/intro-azure-paas.png)
<p class=img-info>
<a href="https://docs.microsoft.com/en-us/learn/modules/introduction-iot-solution-"> SaaS vs PaaS vs IaaS </a>&nbsp; What is PaaS?, Microsoft.
</p>

Adafruit IO (AIO) is a complete software solution but it also included a Python library used for developing a device specific application. AIO is between a software as a service (SaaS) and a PaaS. We did not need to worry about data storage, application logic, authentication, etc.

> Moving forward, we will be implementing our IoT solutions using Microsoft Azure as PaaS.

See more in [What is PaaS](https://azure.microsoft.com/en-us/overview/what-is-paas/) by azure.microsoft.com


## IoT Subsystems 

We can breakdown an IoT solution into **subsystems** and explore how information flows between them:
 ![Diagram that shows the core subsystems of the Azure IoT reference architecture.](https://docs.microsoft.com/en-us/learn/wwl-azure/introduction-iot-solution-architecture/media/m01-l02-core-subsystems-iot-architecture-8158ad9e.png)
<p class=img-info>
<a href="https://docs.microsoft.com/en-us/learn/modules/introduction-iot-solution-architecture/2-subsystems-iot-architecture"> Subsystems of IoT architecture </a>&nbsp; Examine systems of an IoT architecture, Microsoft.
</p>

**IoT Devices**:
- The physical devices and sensors where data originates.

**Cloud Gateway**:
- The Cloud Gateway provides a cloud hub for secure connectivity, telemetry, event ingestion and device management (including command and control) capabilities.

**Stream Processing**:
- Processes large streams of data records, evaluates rules for those streams, and further routes the data.

**Storage**:
- Storage can be divided into warm path (data that is required to be available for reporting and visualization immediately from devices), and cold path (data that is stored longer term and used for batch processing).

**User Interface and Reporting**:
- The user interface for an IoT application can be delivered on a wide array of device types, in native applications, and browsers.

**Business Process Integration**:
- Facilitates executing actions based on insights garnered from device telemetry data during stream processing. Integration could include storage of informational messages, alarms, sending email or SMS, integration with CRM, and more.


> We will use Microsoft Azure to manage each sub-system individually.


## Azure IoT Services

Azure offers many IoT-related services (see image below). In this course we'll only explore a few.

![Azure IoT-related architecture](https://learn.microsoft.com/en-us/azure/architecture/reference-architectures/iot/images/iot-refarch.svg)
[*Azure IoT Reference Architecture*](https://learn.microsoft.com/en-us/azure/architecture/reference-architectures/iot), *Microsoft learn*


## IoT Hub & IoT Central

Microsoft Azure has two service offers for deploying and managing IoT systems: **IoT Hub** and **IoT Central**.

> The page [Overview: Connection options for Azure IoT device developers](https://docs.microsoft.com/en-us/azure/iot-develop/concepts-overview-connection-options#application-platforms-iot-central-and-iot-hub) offers a great summary and comparison between IoT Hub and IoT Central.


### IoT Central

Azure IoT Central is a software-as-a-service (SaaS) application that provides a complete platform for hosting IoT applications. Its main feature is a web UI that streamlines the lifecycle of creating and managing IoT applications.

The web UI simplifies the tasks of creating applications, and connecting and managing from a few up to millions of devices.

This service has a limited free plan (2 devices with 5000 messages per month). Pricing available [here](https://azure.microsoft.com/en-us/pricing/details/iot-central/).

See [official site for details](https://azure.microsoft.com/en-us/services/iot-central/#overview) or watch the [walk-through for an example](https://www.youtube.com/watch?v=G32stXSwtyA).

> We will not use IoT Central in this course because we'll connect the underlying Azure services ourselves.


### IoT Hub
IoT Hub is a platform-as-a-service (PaaS) application that also provides a platform for hosting IoT applications. IoT Hub acts as a central message hub for bi-directional communication between IoT applications and connected devices.

IoT Hub offers **greater control and customization** over your application design, and **more developer tool options** for working with the service. However, it requires more development time and slightly more management complexity.

This service also offers a more generous free plan (500 devices with 8000 messages per day). 

See [official site for details](https://azure.microsoft.com/en-us/pricing/details/iot-hub/#overview) and [pricing](https://azure.microsoft.com/en-us/pricing/details/iot-hub/#pricing).


## IoT Hub Documentation

> [**Azure IoT Hub Documentation**](https://docs.microsoft.com/en-us/azure/iot-hub/) hosts most of the documentation we will be using.
>
> Please get familiar with the left-hand menu, including the "Quickstarts" and "How-to guides"


![](assets/intro-azure-docs-page.png)


## Azure Resource Group & Zones

A resource group is a "container" that holds related resources for an Azure solution (such as your IoT system).

The resource group can include all or a subset of the resources for the solution. You decide how to  allocate resources to resource groups based on what makes sense for your organization. Generally, group resources share the same lifecycle (deploy, update, and delete).

> Azure resources and their groups must be deployed to a particular region.
> 
> **To create a resource group** see guide [Manage Azure resource groups by using the Azure portal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resource-groups-portal)


### Azure Regions

Azure operates in multiple datacenters around the world. These datacenters are grouped in to **geographic regions**.

To see a list of all Azure regions see [azure geographies](https://azure.microsoft.com/en-us/global-infrastructure/geographies/#overview).


![Azure infrastructure map](https://www.poppelgaard.com/wp-content/uploads/2017/03/azure_datacenters.png)
<p class=img-info>
<a href="https://www.poppelgaard.com/citrix-xenapp-essentials-microsoft-azure/azure_datacenters"> Map of Azure Regions (2017) </a>&nbsp; Thomas Poppelgaard.
</p>


Canada has two Azure regions:

- **Canada Central:** located in Toronto (with 3 zones).
- **Canada East**: located in Quebec City (no zones).  

<br>

Some services are only available in certain regions.
For example, Azure IoT Central is not available in the *Canada East* region.

![](assets/intro-azure-service-availability.png)


### Azure Zones

Azure **availability zones** are physically separate locations within each Azure region that are tolerant to local failures.

Tolerance to failures is achieved because of redundancy and logical isolation of Azure services. To ensure resiliency, a minimum of three separate availability zones are present in all availability zone-enabled regions.

![](assets/intro-azure-zone-region.png)

<p class=img-info>
<a href="https://docs.microsoft.com/en-us/azure/availability-zones/az-overview"> Azure region with 3 zones and one disaster recovery location. </a>&nbsp; Regions and availability zones, Mocrosoft.
</p>


## Azure IoT Dev Tools

Azure offers several developer tools to create, manage and connect to the IoT Hub service. 

Some tools have **nearly the same functionality**. Choose the one that best works for you.

### Azure Portal

The Azure Portal is a browser-based portal for IoT Hub and devices. Also works with other Azure resources including IoT Central.

| Documentation                                                                       | Quick Start                                                                                             | IoT Example                                                                                                         |     |
| ----------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- | --- |
| [Azure portal documentation](https://learn.microsoft.com/en-us/azure/azure-portal/) | [What is the Azure portal?](https://learn.microsoft.com/en-us/azure/azure-portal/azure-portal-overview) | [Create an IoT hub with Azure portal](https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-create-through-portal) |     |

![](assets/12-azure-portal-example.png)



### Azure CLI, Cloud Shell & IoT Extension 

**Azure CLI** is a terminal tool to manage Azure services offered as Bash and PowerShell shells.

| Documentation                                                           | Quick Start                                                                                          | IoT Example                                                                                           |     |
| ----------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | --- |
| [Azure CLI documentation](https://learn.microsoft.com/en-us/cli/azure/) | [Get started with Azure CLI](https://learn.microsoft.com/en-us/cli/azure/get-started-with-azure-cli) | [Create an IoT hub with CLI](https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-create-using-cli) |     |

Azure CLI can be installed in your local machine or run from the browser via the Cloud Shell (see below).

> To use it locally, see [Install Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli). 

#### Cloud Shell

Azure Cloud Shell is the ability to run the Azure CLI directly in the browser (most convenient). 

| Documentation                                                                                          | Quick Start                                                                                                      | IoT Example                |
| ------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------- | -------------------------- |
| [Features & tools for Azure Cloud Shell](https://learn.microsoft.com/en-us/azure/cloud-shell/features) | [Quickstart for Azure Cloud Shell](https://learn.microsoft.com/en-us/azure/cloud-shell/quickstart?tabs=azurecli) | Same examples as Azure CLI |


Start the Cloud Shell from anywhere in the Azure portal by clicking on it Cloud Shell icon (below):

![](assets/intro-azure-cli.png)
![](assets/12-azure-cloud-shell-example.png)

The first time you start the Azure Cloud Shell you will be asked to setup an account.

### Azure IoT extension for Azure CLI

Azure CLI uses "extensions" in order to manage different Azure services.

The Azure IoT extension uses the sub-command `az iot`  to control IoT related sevices.

| GitHub Repo                                                                 | Documentation                                                                                              | IoT Examples |
| --------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ------------ |
| [azure-iot-cli-extension](https://github.com/Azure/azure-iot-cli-extension) | [List of `az iot hub` commands](https://learn.microsoft.com/en-us/cli/azure/iot/hub?view=azure-cli-latest) | Same examples as Azure CLI |


### Azure IoT Tools for VS Code

There is a VS Code extension to test and mange IoT Hub services.

| GitHub Repo                                                                       | Documentation                                                           | IoT Examples                                                                                                                                         |
| --------------------------------------------------------------------------------- | ----------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| [vscode-azure-iot-toolkit](https://github.com/microsoft/vscode-azure-iot-toolkit) | [Wiki page](https://github.com/Microsoft/vscode-azure-iot-toolkit/wiki) | [Create an IoT hub using the Azure IoT Tools for Visual Studio Code](https://learn.microsoft.com/en-us/azure/iot-hub/iot-hub-create-use-iot-toolkit) | 


### IoT Explorer & PowerShell

Two other tools worth mentioning but less used in this course:

| Tool               | Description                                                                                               | Documentation                                                                                                       |
| ------------------ | --------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| Azure IoT Explorer | Connects to an existing IoT hub to manage devices. Cannot create IoT hubs. Often used with CLI or Portal. | [Azure IoT Explorer](https://github.com/Azure/azure-iot-explorer#azure-iot-explorer-preview)                        |
| Azure PowerShell   | PowerShell interface for creating and managing IoT applications                                           | [Create an IoT hub with PowerShell](https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-create-using-powershell) |



## Azure Account
Students get $100 of credit for 12 months and free [developer tools](https://portal.azure.com/#blade/Microsoft_Azure_Billing/FreeServicesBlade) without a credit card. 

> **Create an account** and see details [here](https://azure.microsoft.com/en-us/free/students/).

The student account can be renewed annually (including $100 credits) for as long as you are a student.

Most things we'll do with Azure will use **free services**. We will occasionally use some of your free credits (~$20).


### Checking your balance 💸

As you experiment with Azure you might want to know your current balance.

**TL:DR**
1. Sign in to the Azure portn in to the Azure portal.al.
2. Search for ***Cost Management***  ![](assets/intro-azure-cost-management.png ':class=inline-img') 

3. Select ***Payment methods***

4. Check your ***Azure credits*** panel.

![Credit check panel in Azure](assets/intro-azure-credit-check.png)

For details check [Track Microsoft Customer Agreement Azure credit balance](https://docs.microsoft.com/en-us/azure/cost-management-billing/manage/mca-check-azure-credits-balance?tabs=portal#main)


### Budget Alerts

It's possible to setup email alerts when your Azure spending exceeds a dollar threshold. This avoids unexpected spending of Azure credits.

There are two approaches to setting up a Budget in the Azure Portal:

1. Open the panel (aka "blade") for the Resource Group in question, and then create a new Budget for that group.

2. Create a Budget for your account under ***Cost Management + Billing*** and then **apply a filter** according to *ResourceGroupName* in order to target a specific Resource Group.

The first approach involves a few less steps so it is described below.

For more information on creating a budget from the Cost Management blade, see [How to set up Azure budget alerts](https://www.techtarget.com/searchcloudcomputing/tutorial/How-to-set-up-Azure-budget-alerts) by TechTarget.com. 


#### Create a Budget for a Resource Group

1. In the Azure Portal Home, select the ***Resource groups*** service.
2. Select the resource group you want to monitor with a budget.
3. In the left panel, select ***Budgets*** under the *Cost Management* group and select ***Add***.

![Menu for creating a budget for a resource group](assets/12-budget-resource-group.png)

4. Give your budget a name and an amount.

![](assets/12-budget-name-ammount.png)

5. Select the **percent spending** for the alert and the **email** to receive the notification.
6. Click ***Create***.

![](assets/12-budget-alert-percent-email.png)


## Demo: IoT Hub & Device telemetry data

In-class demo to illustrate the process of:

1. Creating an resource group
2. Creating an IoT Hub
3. Defining a new device
4. Use Azure CLI and Azure IoT Tools for VS Code to:
	- Simulate device data and send it to IoT Hub
	- Monitor data incoming data in IoT Hub

This demo is based on the following guides:
- [Quickstart: Send telemetry from a device to an IoT hub and monitor it with the Azure CLI](https://docs.microsoft.com/en-us/azure/iot-hub/quickstart-send-telemetry-cli)
- [Quickstart: Send telemetry from an IoT Plug and Play device to Azure IoT Hub](https://docs.microsoft.com/en-us/azure/iot-develop/quickstart-send-telemetry-iot-hub?toc=%2Fazure%2Fiot-hub%2Ftoc.json&bc=%2Fazure%2Fiot-hub%2Fbreadcrumb%2Ftoc.json&pivots=programming-language-python)

