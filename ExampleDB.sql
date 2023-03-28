create database eCommerce;

create table customer(fName varchar (256), lName varchar (256), addressID int foreign key (addressID) references address(addressID), 
paymentInfo varchar (256), customerID int identity(1000,1) primary key, customerJoinDate date, phoneNo varchar(32),DoB date);

create table items(itemName varchar(256), price float, decription varchar(256), itemID int identity (2000,1) primary key,
warehouseID int foreign key (warehouseID) references warehouse(warehouseID));

create table warehouse(warehouseID int identity (3000,1) primary key, section varchar(128), rack varchar(128), shelf varchar(128),
addressID int foreign key (addressID) references address(addressID));

create table employee(DoB date, addressID int foreign key (addressID) references address(addressID), SSN char (11), warehouseID int foreign key (warehouseID) references warehouse(warehouseID),
fName varchar(256), lName varchar(256),phoneNo varchar(32), departmentID int foreign key (departmentID) references departments(departmentID),
employeeID int identity (4000,1) primary key);

create table orders(orderID int identity (5000,1) primary key, orderTotal float, customerID int foreign key (customerID) references customer(customerID),
itemID int foreign key (itemID) references items(itemID), itemamount int, orderDate date, taxID int foreign key (taxID) references taxes(taxID));

create table taxes (federal int, statetax int, county int, city int, taxID int identity (6000,1) primary key);

create table address(addressID int identity (7000,1) primary key, houseNo varchar(4), streetName varchar(256), city varchar(256), stateProvince varchar(256),
country varchar(256));

create table departments(departmentID int identity (8000,1) primary key, budget int, departmentHeads varchar(256));

alter table items drop column price;

alter table items add price DECIMAL (10,2);

select * from orders;

alter table orders alter column orderTotal decimal(10,2);

create table customerAddressRef(customerID int foreign key references customer,
addressID int foreign key references address,
primary key(customerID, addressID));

create table employeeAddressRef(employeeID int foreign key references employee,
addressID int foreign key references address,
primary key(employeeID, addressID));

alter table customer drop constraint FK__customer__addres__3B75D760;
alter table customer drop column addressID;

alter table employee drop constraint FK__employee__addres__4AB81AF0;
alter table employee drop column addressID;