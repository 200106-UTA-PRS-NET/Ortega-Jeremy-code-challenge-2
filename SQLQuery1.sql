-- create database code_challenge_2;

use code_challenge_2;

create table Department(
	ID int not null,
	name_ varchar(max) not null,
	Location_ varchar(max) not null,
	Primary key (ID)
)


create table Employee(
	ID int not null,
	FirstName varchar(max) not null,
	LastName varchar(max) not null,
	SSN int not null,
	DeptID int not null,
	Foreign key (DeptID) references Department (ID),
	Primary key (ID)
)

create table EmpDetails(
	ID int not null,
	EmployeeID int not null,
	Salary decimal(10,2) not null,
	Address1 varchar(max) not null,
	Address2 varchar(max) not null,
	City varchar (max) not null,
	State_ varchar(max) not null,
	Country varchar(max) not null
	Primary key (ID),
	foreign key (EmployeeID) references Employee(ID),
)
----- Add three each department

 insert into Department(ID, Name_, Location_) values (1, 'Accounting', '123 Cherry Lane');
 insert into Department(ID, Name_, Location_) values (2, 'Sales', '123 Blueberry Dr');
 insert into Department(ID, Name_, Location_) values (3, 'Customer Service', '123 Strawberry Rd');

 insert into Employee(ID, FirstName, LastName, SSN, DeptID) values (112233, 'John', 'Farmer', 123123123, 2);
 insert into Employee(ID, FirstName, LastName, SSN, DeptID) values (223344, 'Jacob', 'Gardner', 12312345, 1);
 insert into Employee(ID, FirstName, LastName, SSN, DeptID) values (334455, 'Jinglheimer', 'Rancher', 123123456, 3);

 insert into EmpDetails(ID, EmployeeID, Salary, Address1, Address2, City, State_, Country) 
   values (1, 112233, 2144, '1234 hi Lane', 'Apt 3', 'Tucson', 'AZ', 'United States');
insert into EmpDetails(ID, EmployeeID, Salary, Address1, Address2, City, State_, Country) 
   values (2, 223344, 3044, 'Cowboy Ranch', 'Apt 2', 'Dallas', 'TX', 'United States');
insert into EmpDetails(ID, EmployeeID, Salary, Address1, Address2, City, State_, Country) 
   values (3, 334455, 4812, 'Hollywood dr', 'Apt 4', 'San Diego', 'CA', 'United States');

-- Add tina smith
insert into Employee(ID, FirstName, LastName, SSN, DeptID) values (445566, 'Tina', 'Smith', 987654321, 4);
insert into EmpDetails(ID, EmployeeID, Salary, Address1, Address2, City, State_, Country) values (4, 445566, 3209, '2334 Pizza Ranch', 'Apt4', 'Casper', 'WY', 'United States');

-- Add marketing department
insert into Department(ID, Name_, Location_) values (4, 'Marketing', '123 Strawberry Rd');

-- List of all Emp at marketing
SELECT ID from EmpDetails where EmployeeID in (SELECT ID from Employee where DeptID = 4);

-- Total Salary of marketing
SELECT SUM(Salary)
	FROM EmpDetails
	WHERE ID in (SELECT ID 
				FROM Employee
				WHERE DeptID = 4)

--- 
SELECT 

-- Update tinas salary
UPDATE EmpDetails
	SET Salary = 90000
	WHERE ID = (Select ID
					FROM Employee
					WHERE FirstName = 'tina' and LastName = 'Smith');

SELECT * from Employee GROUP BY DeptID;

---
   SELECT * from Department;
   SELECT * from Employee;
   SELECT * from EmpDetails;



   drop table EmpDetails;
   drop table Employee;
   drop table Department;

