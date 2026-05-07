-- Create Database
-- CREATE DATABASE Company;
USE Company;

-- Create Department Table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(50) NOT NULL,
    Location VARCHAR(100) NOT NULL
);

-- Insert 10 records into Department table
INSERT INTO Department (DepartmentName, Location) VALUES
('HR', 'Mumbai'),
('Finance', 'Delhi'),
('IT', 'Bangalore'),
('Sales', 'Chennai'),
('Marketing', 'Hyderabad'),
('Operations', 'Pune'),
('R&D', 'Kolkata'),
('Legal', 'Ahmedabad'),
('Customer Support', 'Jaipur'),
('Admin', 'Lucknow');

-- Create Employee Table
CREATE TABLE Employee1 (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    DateOfJoining DATE NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID) ON DELETE SET NULL
);

-- Insert 40 records into Employee table
INSERT INTO Employee1 (FirstName, LastName, Email, Salary, DateOfJoining, DepartmentID) VALUES
('Amit', 'Sharma', 'amit.sharma1@example.com', 60000, '2020-01-15', 1),
('Priya', 'Verma', 'priya.verma1@example.com', 75000, '2019-03-22', 2),
('Rohan', 'Singh', 'rohan.singh1@example.com', 80000, '2018-06-10', 3),
('Sneha', 'Patel', 'sneha.patel1@example.com', 55000, '2021-07-18', 4),
('Rahul', 'Iyer', 'rahul.iyer1@example.com', 72000, '2017-11-25', 5),
('Deepak', 'Nair', 'deepak.nair1@example.com', 65000, '2022-02-20', 6),
('Anjali', 'Reddy', 'anjali.reddy1@example.com', 70000, '2016-09-30', 7),
('Vikram', 'Chopra', 'vikram.chopra1@example.com', 68000, '2023-05-14', 8),
('Meena', 'Das', 'meena.das1@example.com', 71000, '2015-12-05', 9),
('Suresh', 'Ghosh', 'suresh.ghosh1@example.com', 73000, '2014-08-19', 10),
('Neha', 'Jain', 'neha.jain1@example.com', 64000, '2019-04-21', 1),
('Arun', 'Bajaj', 'arun.bajaj1@example.com', 59000, '2020-10-30', 2),
('Kavita', 'Mishra', 'kavita.mishra1@example.com', 62000, '2018-07-13', 3),
('Rakesh', 'Malhotra', 'rakesh.malhotra1@example.com', 67000, '2017-02-27', 4),
('Pooja', 'Deshmukh', 'pooja.deshmukh1@example.com', 70000, '2016-11-10', 5),
('Sandeep', 'Yadav', 'sandeep.yadav1@example.com', 66000, '2021-06-05', 6),
('Lata', 'Kulkarni', 'lata.kulkarni1@example.com', 74000, '2015-09-28', 7),
('Mahesh', 'Rastogi', 'mahesh.rastogi1@example.com', 72000, '2023-03-12', 8),
('Komal', 'Joshi', 'komal.joshi1@example.com', 69000, '2014-07-08', 9),
('Sunil', 'Kapoor', 'sunil.kapoor1@example.com', 63000, '2019-12-01', 10),
('Gaurav', 'Bose', 'gaurav.bose1@example.com', 58000, '2020-05-17', 1),
('Swati', 'Aggarwal', 'swati.aggarwal1@example.com', 61000, '2018-02-24', 2),
('Yash', 'Tripathi', 'yash.tripathi1@example.com', 65000, '2017-08-19', 3),
('Bhavya', 'Saxena', 'bhavya.saxena1@example.com', 72000, '2016-05-22', 4),
('Ritu', 'Chatterjee', 'ritu.chatterjee1@example.com', 78000, '2021-01-11', 5),
('Anup', 'Thakur', 'anup.thakur1@example.com', 64000, '2015-06-30', 6),
('Ishita', 'Menon', 'ishita.menon1@example.com', 69000, '2023-04-15', 7),
('Kunal', 'Bhatia', 'kunal.bhatia1@example.com', 71000, '2014-10-18', 8),
('Divya', 'Roy', 'divya.roy1@example.com', 62000, '2019-01-29', 9),
('Rajeev', 'Kumar', 'rajeev.kumar1@example.com', 58000, '2020-06-23', 10),
('Sonali', 'Pandey', 'sonali.pandey1@example.com', 67000, '2018-03-15', 1),
('Manish', 'Verma', 'manish.verma1@example.com', 73000, '2017-09-26', 2),
('Geeta', 'Dutta', 'geeta.dutta1@example.com', 75000, '2016-07-21', 3),
('Harsh', 'Mangal', 'harsh.mangal1@example.com', 69000, '2021-02-28', 4),
('Snehal', 'Tiwari', 'snehal.tiwari1@example.com', 62000, '2015-10-12', 5),
('Ajay', 'Shetty', 'ajay.shetty1@example.com', 77000, '2023-05-09', 6),
('Lavanya', 'Shah', 'lavanya.shah1@example.com', 65000, '2014-06-05', 7),
('Ravi', 'Naik', 'ravi.naik1@example.com', 71000, '2019-11-14', 8),
('Megha', 'Sinha', 'megha.sinha1@example.com', 63000, '2020-08-30', 9),
('Tushar', 'Bhattacharya', 'tushar.bhattacharya1@example.com', 70000, '2018-12-03', 10);


SELECT * FROM Department;
SELECT * FROM Employee1;

-- Here are 15 SQL questions using simple joins on your Employee and Department tables:
-- 1. Retrieve all employees along with their department names
SELECT *,Department.DepartmentName  FROM Employee1 
join department on Employee1.DepartmentID = Department.DepartmentID;

-- 2. Find employees who work in the "IT" department
SELECT *,Department.DepartmentName FROM Employee1 
join Department on Employee1.DepartmentID = Department.DepartmentID where DepartmentName='IT';

-- 3. List employees along with their department locations
SELECT *,Department.Location FROM Employee1 e
join Department d on e.DepartmentID = d.DepartmentID;

-- 4. Retrieve the total number of employees in each department
SELECT DepartmentName,count(e.Employeeid) FROM Department d
join Employee1 e on d.DepartmentID = e.DepartmentID group by d.DepartmentName;

-- 5. Find the highest-paid employee in each department
SELECT DepartmentName,max(e.Salary) FROM Department d
join Employee1 e on d.DepartmentID = e.DepartmentID group by d.DepartmentName;

-- 6. Display employees who joined after January 1, 2020, along with their department names
SELECT *, d.DepartmentName FROM Employee1 e
join department d on e.DepartmentID = d.DepartmentID 
where d.DepartmentName > '2020-01-01';

-- 7. Show employees earning more than ₹70,000 and their respective departments
SELECT *, d.DepartmentName FROM Employee1 e
join department d on e.DepartmentID = d.DepartmentID 
where e.Salary > 70000;

-- 8. Retrieve employees working in the "Pune" office
SELECT * FROM Employee1 e
join department d on e.DepartmentID = d.DepartmentID 
where d.location='Pune';

-- 9. List employees along with department names in alphabetical order of department names
SELECT *, d.DepartmentName FROM Employee1 e
join department d on e.DepartmentID = d.DepartmentID 
order by d.DepartmentName ASC ;

-- 10. Find the average salary of employees in each department
SELECT d.DepartmentName,AVG(e.Salary) from Employee1 e
join Department d on e.DepartmentID= d.DepartmentID 
group by d.DepartmentName;

SELECT * FROM Department;
SELECT * FROM Employee1;

-- 11. Show employees whose last names start with 'S' along with department names
SELECT *, d.DepartmentName FROM Employee1 e
join department d on e.DepartmentID = d.DepartmentID 
where  LastName like 'S%';

-- 12. Find the department with the most employees
SELECT d.DepartmentName,count(*) as Most_Emp FROM department d
join Employee1 e on d.DepartmentID = e.DepartmentID 
group by d.DepartmentName 
order by Most_Emp DESC limit 1;

-- 13. Show employees who do not have a department assigned
SELECT * FROM Employee1 e
join department d on e.DepartmentID = d.DepartmentID 
where d.Departmentid is null;

-- 14. Retrieve employees sorted by salary in descending order along with their department names
SELECT *, d.DepartmentName FROM Employee1 e
join department d on e.DepartmentID = d.DepartmentID 
order by e.salary DESC;

-- 15. List the employees with the same department as 'Amit Sharma'
SELECT e2.FirstName,e2.LastName FROM Employee1 e1
join Employee1 e2 on e1.DepartmentID = e2.DepartmentID 
where e1.FirstName = 'Amit' AND e1.LastName ='Sharma' AND(e2.FirstName <> 'Amit' OR e2.LastName <> 'Sharma') ;

-- 16. List all employees along with their department names, including employees without a department.
SELECT e.FirstName,d.DepartmentName FROM Employee1 e
left join department d on e.DepartmentID = d.DepartmentID ;

-- 17. Retrieve all departments and the employees working in them, including departments with no employees.
SELECT d.DepartmentName,e.FirstName,e.LastName FROM department d
left outer join Employee1 e on d.DepartmentID = e.DepartmentID ;

-- 18. Find employees who do not belong to any department.
SELECT e.EmployeeID,e.FirstName,e.LastName FROM Employee1 e
left join department d on e.DepartmentID = d.DepartmentID 
where d.DepartmentID is null;

-- 19. List departments that have no employees assigned.
SELECT d.DepartmentName FROM department d
left outer join Employee1 e on d.DepartmentID = e.DepartmentID
where e.employeeid is null ;

-- 20. Retrieve all employees and their department details, ensuring all departments are listed even if they have no employees.
SELECT d.DepartmentID,d.DepartmentName,e.FirstName,e.LastName FROM Employee1 e
Right join department d on e.DepartmentID = d.DepartmentID ;
