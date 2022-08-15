/*create database*/
create database Amazon;

/*use database*/
use Amazon;

/*create table product*/
create table Product(
ProductID int not null primary key,
ProductName varchar(20) not null,
ProductCost int not null,
QuantityInStock int not null,
ProductSubCategoryID int not null);

/*add foreign key to product table*/
alter table Product add constraint my_fkey 
foreign key(ProductSubCategoryID)
references ProductSubCategory(ProductSubCategoryID); 

/*create table product sub category*/
create table ProductSubCategory(
ProductSubCategoryID int not null primary key,
ProductSubCategoryName varchar(20),
ProductCategoryID int,
);

/*add foreign key productcategoryid to productsubcategory table*/
alter table ProductSubCategory add constraint my_fkey_productcategoryid
foreign key(ProductCategoryID)
references ProductCategory(ProductCategoryID); 

/*create table sales order details*/
create table SalesOrderDetail(
SalesOrderDetailID int not null primary key,
SalesOrderHeaderID int,
ProductID int,
OrderQuantity int,
);

/*add foreign key to salesorderdetails table*/
alter table SalesOrderDetail add constraint my_fkey_salesorederheader 
foreign key(SalesOrderHeaderID)
references SalesOrderHeader(SalesOrderHeaderID); 

/*create table sales order header*/
create table SalesOrderHeader(
SalesOrderHeaderID int not null primary key,
OrderDate date,
CustomerId int,
SalesPersonID int,
);
/* add employee column to sales order header table*/
alter table SalesOrderHeader add EmployeeId int;

/*drop CustomerId*/
alter table SalesOrderHeader drop column CustomerId;
alter table SalesOrderHeader add CustomerID int; 
select * from SalesOrderHeader;

/*add foreign key customerid to salesorderheader table*/
alter table SalesOrderHeader add constraint my_fkey_customerid
foreign key(CustomerID)
references Customer(CustomerID); 

/*add foreign key employeeid to salesorderheader table*/
alter table SalesOrderHeader add constraint my_fkey_employeeid
foreign key(EmployeeID)
references Employee(EmployeeID); 

/*create table Employee*/
create table Employee(
EmployeeID int not null primary key,
Designation varchar(20),
ManagerId int,
DateOfJoining date,
DepartmentID int,
PersonID int,
);

/*add foreign key departmentid to employee table*/
alter table Employee add constraint my_fkey_departmentid 
foreign key(DepartmentID)
references Department(DepartmentID); 

/*add foreign key personid to employee table*/
alter table Employee add constraint my_fkey_personid 
foreign key(PersonID)
references Person(PersonID); 

/*drop ManagerId*/
alter table Employee drop column ManagerId;
alter table Employee add ManagerID int; 
select * from Employee;

/*create table Customer*/
create table Customer(
CustomerID int not null primary key,
PersonID int,
TerritoryID int,
CustomerGrade nvarchar,
);

/*add foreign key personid to customer table*/
alter table Customer add constraint my_fkey_personid_cust
foreign key(PersonID)
references Person(PersonID); 

/*add foreign key territoryid to customer table*/
alter table Customer add constraint my_fkey_territoryid
foreign key(TerritoryID)
references Territory(TerritoryID); 

/*create table Department*/
create table Department(
DepartmentID int not null primary key,
DepartmentName varchar(20),
);

/*create table Person*/
create table Person(
PersonID int not null primary key,
Title varchar(20),
FirstName varchar(20),
MiddleName varchar(20),
LastName varchar(20),
Gender varchar(20),
ModifiedDate date,
);

/*create table Product Category*/
create table ProductCategory(
ProductCategoryID int not null primary key,
ProductCategoryName varchar(20),
);

/*create table country*/
create table Country(
CountryID int not null primary key,
CountryName varchar(20),
);

/*create table Territory*/
create table Territory(
TerritoryID int not null primary key,
TerritoryName varchar(20),
CountryID int,
);

/*add foreign key countryid to territory table*/
alter table Territory add constraint my_fkey_countryid
foreign key(CountryID)
references Country(CountryID); 