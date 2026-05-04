use raw;

CREATE TABLE people_data (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100),
    city VARCHAR(50),
    salary DECIMAL(10,2),
    join_date DATE
);

drop table people_Data;
INSERT INTO people_data (full_name, city, salary, join_date) VALUES
('Aarav Sharma','Mumbai',45000,'2022-01-10'),
('Vivaan Patel','Ahmedabad',52000,'2021-03-15'),
('Aditya Singh','Delhi',60000,'2020-07-20'),
('Vihaan Gupta','Pune',48000,'2023-02-12'),
('Arjun Verma','Jaipur',55000,'2021-11-25'),
('Sai Kumar','Hyderabad',47000,'2022-06-30'),
('Krishna Iyer','Chennai',51000,'2020-09-05'),
('Ishaan Mehta','Surat',53000,'2021-12-10'),
('Rohan Das','Kolkata',49000,'2023-01-18'),
('Karan Malhotra','Delhi',62000,'2022-04-22'),
('Rahul Nair','Kochi',46000,'2020-08-14'),
('Siddharth Jain','Indore',58000,'2021-05-19'),
('Manish Yadav','Lucknow',47000,'2022-10-11'),
('Deepak Choudhary','Bhopal',52000,'2023-03-01'),
('Ankit Mishra','Kanpur',45000,'2021-07-07'),
('Neha Sharma','Mumbai',48000,'2022-02-14'),
('Pooja Singh','Delhi',51000,'2020-11-30'),
('Priya Patel','Ahmedabad',53000,'2023-01-05'),
('Sneha Reddy','Hyderabad',60000,'2021-09-17'),
('Kavya Nair','Kochi',47000,'2022-12-21'),
('Ananya Iyer','Chennai',55000,'2020-06-10'),
('Divya Menon','Bangalore',62000,'2021-08-23'),
('Meera Joshi','Pune',49000,'2023-02-02'),
('Ritu Kapoor','Delhi',-57000,'2022-05-15'),
('Simran Kaur','Amritsar',52000,'2021-04-12'),
('Harpreet Singh','Ludhiana',50000,'2020-10-20'),
('Gaurav Sharma','Jaipur',54000,'2022-03-18'),
('Nitin Agarwal','Agra',-51000,'2023-01-25'),
('Amit Saxena','Noida',60000,'2021-06-29'),
('Rajesh Khanna','Mumbai',65000,'2020-12-12'),
('Sunil Gavaskar','Mumbai',-70000,'2019-05-10'),
('Kapil Dev','Chandigarh',68000,'2018-08-20'),
('Virat Kohli','Delhi',90000,'2017-07-07'),
('Rohit Sharma','Mumbai',85000,'2016-03-15'),
('MS Dhoni','Ranchi',80000,'2015-01-10'),
('Hardik Pandya','Vadodara',-75000,'2019-09-09'),
('Jasprit Bumrah','Ahmedabad',72000,'2020-02-02'),
('KL Rahul','Bangalore',77000,'2018-11-11'),
('Shubman Gill','Chandigarh',71000,'2021-01-01'),
('Rishabh Pant','Delhi',-73000,'2026-04-16');

SELECT * FROM People_data;
-- Find the number of characters in each person’s name. 
SELECT id,length(full_name) FROM People_data;

-- Find people whose name length is greater than 12.
SELECT id,length(full_name)<12 FROM People_data;

-- Display name and city together.
SELECT concat(full_name,city) FROM People_data;

-- Display names with prefix “Name:”. 
SELECT concat('name:',full_name) as prefixname FROM People_data;

-- Show first 5 characters of each name. 
SELECT full_name,substring(full_name,1,5) as shortname from People_data
group by full_name;

-- Convert all names to uppercase.
SELECT upper(full_name) FROM People_data;

-- Convert all cities to lowercase.
SELECT lower(city) FROM People_data;

-- Removes extra spaces from start and end. 
SELECT trim(full_name) as cleanName FROM People_data;

-- Find remainder of salary divided by 3.--  
SELECT mod(salary,3) as Remainder FROM People_data;

-- Show current date and time.
SELECT now();

-- Find people who joined today.
SELECT * FROM People_data where join_date=curdate();

-- Find people who joined in 2020. 
SELECT * FROM People_data where year(join_date)=2020;

-- find the people who joined in 2020 in march month
SELECT * FROM People_data where year(join_date)=2020 and month(join_date)=3;

-- Find people who joined more than 5 year ago.
SELECT * FROM People_data where join_date <= current_date - interval 5 year;








