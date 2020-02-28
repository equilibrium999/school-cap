# school-cap
I make this project to pratice and study more about SAP Cloud Application Programming Model. More infos in this link
http://www.saphanadev.com.br/2020/02/27/sap-cloud-application-programming-model-projeto-exemplo/

## Get Started

This project is a example application to explorer CAP - SAP Cloud Application Programming Model capabilities. Documentation in [SAP Cloud Application Programming Model web site](https://cap.cloud.sap)


### Development Environment

I am using Visual Studio Code as local development environment. To get the language support for the CDS objects you must manually install the corresponding extension for Visual Studio Code.
To install this extension, proceed as follows

1. Download the vsix file from [SAP Development Tools -> Cloud -> CDS Language Support for Visual Studio Code](https://tools.hana.ondemand.com/#cloud)
2. Install the downloaded vsix file in Visual Studio Code using command Install from VSIX...

### NPM Registry

The NPM packages for CDS are not part of the default NPM registry. As a consequence, you must configure your registry to lookup the packages in the SAP NPM registry. Enter the following command:

```sh
npm set @sap:registry=https://npm.sap.com
```

### CDS Command Line Tools

Install the cds-dk command line tools

Originally the Node.js package incarnation of CAP was in the form of a single top-level module @sap/cds. Today we also have @sap/cds-dk, where the “dk” refers to “development kit”. This is the package that you’ll want to install to develop with CAP, taking advantage of all the tools that it includes; in parallel there is @sap/cds which you can think of as the leaner “runtime” package

```sh
npm i -g @sap/cds-dk
```

### Build the Project

To build the project, walk through the following steps

1. Download or clone the repository.
2. Navigate to the folder of your local repository
3. Execute the command `npm install`to install the relevant NPM packages
4. Execute the command `npm run build` to trigger a clean build of the project
5. Execute the command `npm run deploy` to deploy in the local sqlite database
6. Execute the command `cds watch`  to test and modify files and automaticaly restart the server locally 

or

6. Execute the command `npm start` to startup the project locally
  

You can now access the services via

```sh
 http://localhost:4004
```

### Initialize the Local Database

Run the following command to Initialize your local SQLite DB:

```sh
cds deploy --to sqlite:db/schoolcap.db
```
Do not forget to repeat this step to initialize the local database whenever you changed the datamodel


### How to Test

To test the services to read data you can only execute and access the url. Admin services in the local enviroment uses the user "admin" without inform password.
The Student services, inform the user "student", without password.

To test the creation services (Create Student and Enrollment), use the postman collection file: test\school.postman_collection.json. [Install Postman](https://www.postman.com/downloads/) and import this file. To create a new student use create_student. To Enroll this student in a class use enroll_student.


## Deploy to SAP Cloud Platform (Trial)

#### Prerequisites

1. If you don’t have a Cloud Foundry Subaccount on SAP Cloud Platform yet, [create your Trial Account:](https://account.hanatrial.ondemand.com/)
2. [The Cloud MTA Build Tool (MBT) is installed](https://sap.github.io/cloud-mta-build-tool/)
3. [Download and install the cf command-line client for Cloud Foundry.](https://github.com/cloudfoundry/cli#downloads)
4. [Install MultiApps CF CLI Plugin](https://github.com/cloudfoundry-incubator/multiapps-cli-plugin)
5. Log on to Cloud Foundry, using cf login to your trial account]

```sh
cf login  # this will ask you to select CF API, org, and space
```

#### Build

To Build mta file in folder mta_arquives

```sh 
NODE_ENV=production npm run build:cf
```

If you're running Windows then you'll need to set the environment variable first with set and then run the command, like this:

```sh 
set NODE_ENV production
npm run build:cf
```

#### Deploy

To deploy de mta file to cloud foundry

```sh
npm run deploy:cf
```

After deploy you can view the url for the service on console, the url changes according you account and enviroment.

```sh
Application "school-srv" started and available at "...school-srv...."
```

Open this URL in the browser and try out the provided links

To check the apps and services use the following commands:

```sh
cf apps
cf services
```

### Trobleshooting

Error using MTA Build Tool on windows, https://stackoverflow.com/questions/32127524/how-to-install-and-use-make-in-windows

### References

https://github.com/SAP-samples/cloud-cap-nodejs-codejam/tree/master/exercises
https://cap.cloud.sap/docs/
