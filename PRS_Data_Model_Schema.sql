-- create and select the database
DROP DATABASE IF EXISTS PRS;
CREATE DATABASE PRS;
USE PRS;

-- create User table
-- DROP TABLE IF EXISTS User;
Create table User (
ID 			integer 		primary key auto_increment,
UserName 	varchar(20) 	not null,
Password 	varchar(10) 	not null,
FirstName 	varchar(20) 	not null,
LastName 	varchar(20) 	not null,
PhoneNumber varchar(12)		not null,
Email		varchar(75)		not null,
IsReviewer	tinyint			not null,
IsAdmin		tinyint			not null,
CONSTRAINT uname unique (Username));

-- create Vendor table
Create table Vendor (
ID          integer         primary key auto_increment,
Code		varchar(10)		not null,
Name   		varchar(255)    not null,
Address    	varchar(255)    not null,
City      	varchar(255)    not null,
State		varchar(2)		not null,
Zip			varchar(5)		not null,
PhoneNumber	varchar(12)     not null,
Email		varchar(100)	not null,
CONSTRAINT vcode unique (Code));

-- create Request table
Create table Request (
ID          		integer         primary key auto_increment,
UserID				integer			not null,
Description 		varchar(100)    not null,
Justification   	varchar(255)    not null,
DateNeeded      	Date    		not null,
DeliveryMode		varchar(25)		not null,
Status				varchar(20)		not null,
Total				Decimal(10,2)   not null,
SubmittedDate		DateTime		not null,
ReasonForRejection	varchar(100),
Foreign Key (UserID) references User(ID));

-- create Product table
Create table Product (
ID 			integer 		primary key auto_increment,
VendorID 	integer		 	not null,
PartNumber 	varchar(50) 	not null,
Name 		varchar(150) 	not null,
Price	 	Decimal(10,2) 	not null,
Unit	 	varchar(255),
PhotoPath	varchar(255),
Foreign Key (VendorID) references Vendor(ID),
CONSTRAINT vendor_part unique (VendorID, PartNumber));		

-- create Line Item table
Create table LineItem (
ID 			integer 		primary key auto_increment,
RequestID 	integer		 	not null,
ProductID 	integer	 		not null,
Quantity 	integer 		not null,
Foreign Key (ProductID) references Product(ID),
Foreign Key (RequestID) references Request(ID),
CONSTRAINT req_pdt unique (RequestID, ProductID));

