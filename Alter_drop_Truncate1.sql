create database raw;

use raw;

CREATE TABLE Employee(
    EMP_ID INT,
    NAME VARCHAR(50),
    SALARY INT,
    DEPT VARCHAR(30)
);


INSERT INTO Employee VALUES
(1, 'Amit', 30000, 'HR'),
(2, 'Neha', 35000, 'IT'),
(3, 'Raj', 40000, 'Finance'),
(4, 'Priya', 32000, 'HR'),
(5, 'Karan', 45000, 'IT'),
(6, 'Sneha', 38000, 'Finance'),
(7, 'Vikas', 28000, 'HR'),
(8, 'Pooja', 36000, 'IT'),
(9, 'Rohit', 42000, 'Finance'),
(10, 'Anjali', 31000, 'HR'),
(11, 'Suresh', 47000, 'IT'),
(12, 'Meena', 39000, 'Finance'),
(13, 'Arjun', 33000, 'HR'),
(14, 'Kavita', 34000, 'IT'),
(15, 'Deepak', 41000, 'Finance'),
(16, 'Rina', 30000, 'HR'),
(17, 'Manoj', 46000, 'IT'),
(18, 'Divya', 37000, 'Finance'),
(19, 'Nikhil', 29000, 'HR'),
(20, 'Swati', 36000, 'IT');

select * from Emp;
-- Write query to add column AGE 
alter table Emp add Age int;
alter table Emp drop Age1;

#set SQL_Safe_Update=1;

-- Change SALARY from INT to DECIMAL(10,2)
alter table emp modify salary decimal(10,2);

-- Rename column NAME to EMP_NAME
alter table emp rename column name to EMP_NAME;

-- Drop column DEPT
alter table emp drop column dept;
alter table Employee add dept varchar(20);


-- Add PRIMARY KEY on EMP_ID
alter table emp add constraint primary key(emp_id);

-- Drop PRIMARY KEY constraint
alter table emp drop PRIMARY KEY  ;

-- change the table name from emp to employee
alter table emp rename to employee;

-- Add two columns (CITY, JOIN_DATE) in one query
alter table Employee add CITY varchar(25), add JOIN_DATE date;
alter table employee drop column age;

select * from Employee;

-- updated-- 
-- Update salary of employee with EMP_ID = 1 to 50000
update employee set salary=50000 where emp_id=1;

-- Change department of employee Neha to 'HR'
update employee set dept='HR' where emp_name='neha';

-- Update salary of Raj to 45000
update employee set salary=45000 where emp_name='raj';

-- Change department of employee with EMP_ID = 10 to 'Finance'
update employee set dept='finance' where emp_id=10;

-- Increase salary of all HR employees to 35000
update employee set salary=salary+35000;

-- Change department from Finance to Accounts 
update employee set dept='Accounts' where dept='Finance'; 

select * from Employee;

-- delete
-- Delete employee whose EMP_ID = 5
delete from employee where emp_id=5;

-- Delete all employees from HR department
delete from employee where dept='hr';

-- Delete employees with salary less than 30000
delete from employee where salary<30000;

-- Delete employees from IT department with salary > 40000
delete from employee where salary>40000;

-- Delete employees whose EMP_ID is between 10 and 15
delete from employee where EMP_ID between 10 and 15;

-- delete all row 
delete from employee;

truncate table employee;

drop table employee;

select * from employee;
