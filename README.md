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

Install the CDS command line tools

```sh
npm i -g @sap/cds
```

### Build the Project

To build the project, walk through the following steps

1. Download or clone the repository.
2. Navigate to the folder of your local repository
3. Execute the command `npm install`to install the relevant NPM packages
4. Execute the command `npm run build` to trigger a clean build of the project
5. Execute the command `npm run deploy` to deploy in the local sqlite database
6. Execute the command `npm start` to startup the project locally

You can now access the services via

```sh
 http://localhost:4004
```

### Initialize the Local Database

Run the following command to Initialize your local SQLite DB:

```sh
cds deploy --to sqlite:db/sitregcapm.db
```


