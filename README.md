# PrintDesk - Printer Setup System Remastered

## Overview

*Printer Setup System Remastered is a remaster of [PrinterSetupSystem](https://github.com/akshinmustafayev/PrinterSetupSystem) project originally written on PHP, to Java Web Application.*

Printer Setup System is a center that provides a single point of contact between users and printers. User can install required printers to his computer without technical support help. 

## Installation
System can be deployed both _Windows_ and _Linux_ Tomcat 8 server with MariaDB.

* Install Tomcat 8 and MariaDB on your server. 
* Download from release page or directly [PrinterSetupSystem.war] file. 
* Rename it to _ROOT.war_ file. 
* Copy renamed WAR file to your Tomcat 8 installation _WEBAPPS_ folder
* Run http://yourserver:port/install, specify DB server ip, login, password and press install button to create required tables
* Open http://yourserver:port/login to login into the system. Login: **admin** password: **admin**. Do not forget to change password for security reasons

## Fixing Issues
Database config file is located in: WEB-INF\classes\config.properties. To set manually database configuration change this file. To open install page, set: "db.configured=no". By default system creates "printersetupsystem" database and sets "db.configured=yes".

You can manually import database by loading WEB-INF\classes\printersetupsystem.sql file. To lock install page set "db.configured=yes" again. 
