-- Step 1: Create Database
CREATE DATABASE University;

-- Step 2: Use the Database
USE University;

-- Step 3: Create Student Table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    department VARCHAR(50),
    grade INT
);

-- Step 4: Insert Sample Values
INSERT INTO students VALUES
(1, 'John Doe', 'Math', 85),
(2, 'Jane Smith', 'Physics', 92),
(3, 'Alice Johnson', 'Math', 78),
(4, 'Bob Wilson', 'Physics', 89),
(5, 'Eva Brown', 'Chemistry', 95),
(6, 'Mike Davis', 'Math', 80),
(7, 'Sophia White', 'Chemistry', 88),
(8, 'Daniel Lee', 'Physics', 91);

select * from students;

-- Question 1: Find the average grade for each department.
select department, avg(grade) from students  group by department;

-- Question 2: List department with more than 2 students
select department, count(*) from students  group by department having count(*)>2;

-- Question 3: Find the highest grade in each department.
select department, max(grade) from students group by department;

-- Question 4: List departments where the average grade is below 85.
select department, avg(grade) from students group by department having avg(grade)<85;

-- Question 5: Find the number of students in each grade.
select grade, count(*) as std_grade from students group by grade;

-- Question 6: List grades with more than 1 student. 
select grade, count(*) as std_grade from students group by grade having count(*)>1;

-- Question 7: Find the average grade for students with more than 1 student in their grade.
select grade,avg(grade)as avg_grade, count(*) as std_grade from students group by grade having count(*)>1;

-- Question 8: List grades where the highest grade is above 90.
select max(grade) as high_grade from students group by grade having max(grade)>90;
