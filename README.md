# school-cap
I make this project to pratice and study more about SAP Cloud Application Programming Model. 

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


### deploy to SAP Cloud Platform (Trial)

Check this link to references https://cap.cloud.sap/docs/advanced/deploy-to-cloud

#### Prerequisites

1. If you don’t have a Cloud Foundry Subaccount on SAP Cloud Platform yet, create your Trial Account: https://account.hanatrial.ondemand.com/
2. Download and install the cf command-line client for Cloud Foundry. https://github.com/cloudfoundry/cli#downloads
3. Log on to Cloud Foundry]

```sh
cf login  # this will ask you to select CF API, org, and space
```

#### Enhance project configuration fo SAP HANA
In SAP Cloud you need to switch to SAP HANA as a database. 
Add the following configuration to package.json (overwrite any existing cds configuration). Only for deployment in SAP Cloud, if you need to execute local.

```sh
"cds": {
  "requires": {
      "db": {
        "kind": "hana",
        "model": ["db","srv"]
      }
  }
}
```

#### Create a service

If you dont have the service created, you need to create the SAP HANA service manually (along with an HDI container and a database schema):

```sh
cf create-service hanatrial hdi-shared school-db-hdi-container
```

On payed landscapes, replace the service type hanatrial by hana. If service creation fails, see the troubleshooting guide.

#### Deploy

Now, build and deploy both the database part and the actual application:

```sh
cds build/all
cf push -f gen/db
cf push -f gen/srv --random-route
```

In the deploy log, find the application URL in the routes line at the very end:

```sh
name:              school-srv
requested state:   started
routes:            school-srv-....cfapps.sap.hana.ondemand.com
```

Open this URL in the browser and try out the provided links