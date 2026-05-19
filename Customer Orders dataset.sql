create database amazon;

use amazon;

-- Create a sample table for customer data
-- Create table customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birthdate DATE
);

-- Insert sample data
INSERT INTO customers (customer_id, first_name, last_name, birthdate)
VALUES (1, 'John', 'Doe', '1990-05-15');

INSERT INTO customers (customer_id, first_name, last_name, birthdate)
VALUES (2, 'Jane', 'Smith', '1985-08-22');

-- Insert additional sample data into the customers table
INSERT INTO customers (customer_id, first_name, last_name, birthdate)
VALUES (3, 'Emily', 'Johnson', '1995-03-10');

INSERT INTO customers (customer_id, first_name, last_name, birthdate)
VALUES (4, 'Michael', 'Brown', '1980-12-28');

INSERT INTO customers (customer_id, first_name, last_name, birthdate)
VALUES (5, 'Sophia', 'Miller', '1993-06-05');

INSERT INTO customers (customer_id, first_name, last_name, birthdate)
VALUES (6, 'Matthew', 'Davis', '1988-09-15');

INSERT INTO customers (customer_id, first_name, last_name, birthdate)
VALUES (7, 'Olivia', 'Wilson', '1999-11-20');

INSERT INTO customers (customer_id, first_name, last_name, birthdate)
VALUES (8, 'Daniel', 'Smith', '1975-04-18');

INSERT INTO customers (customer_id, first_name, last_name, birthdate)
VALUES (9, 'Ava', 'Anderson', '1991-07-30');

INSERT INTO customers (customer_id, first_name, last_name, birthdate)
VALUES (10, 'Ethan', 'Lee', '1996-02-14');

INSERT INTO customers (customer_id, first_name, last_name, birthdate)
VALUES (11, 'Isabella', 'Jones', '1982-08-09');

INSERT INTO customers (customer_id, first_name, last_name, birthdate)
VALUES (12, 'Liam', 'Garcia', '1990-01-25');

INSERT INTO customers (customer_id, first_name, last_name, birthdate)
VALUES (13, 'Mia', 'Martinez', '1987-07-03');

INSERT INTO customers (customer_id, first_name, last_name, birthdate)
VALUES (14, 'Noah', 'Hernandez', '1997-04-12');

INSERT INTO customers (customer_id, first_name, last_name, birthdate)
VALUES (15, 'Emma', 'Lopez', '1984-10-31');

INSERT INTO customers (customer_id, first_name, last_name, birthdate)
VALUES (16, 'James', 'Walker', '1986-05-20');

INSERT INTO customers (customer_id, first_name, last_name, birthdate)
VALUES (17, 'Aiden', 'Young', '1992-09-08');

-- Create a table for orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

-- Insert sample data
INSERT INTO orders (order_id, order_date, total_amount)
VALUES (101, '2023-08-01', 500);

INSERT INTO orders (order_id, order_date, total_amount)
VALUES (102, '2023-08-10', 750);

-- Insert additional sample data into the orders table
INSERT INTO orders (order_id, order_date, total_amount)
VALUES (103, '2023-08-15', 320);

INSERT INTO orders (order_id, order_date, total_amount)
VALUES (104, '2023-08-18', 420);

INSERT INTO orders (order_id, order_date, total_amount)
VALUES (105, '2023-08-20', 550);

INSERT INTO orders (order_id, order_date, total_amount)
VALUES (106, '2023-08-22', 670);

INSERT INTO orders (order_id, order_date, total_amount)
VALUES (107, '2023-08-25', 480);

INSERT INTO orders (order_id, order_date, total_amount)
VALUES (108, '2023-08-27', 720);

INSERT INTO orders (order_id, order_date, total_amount)
VALUES (109, '2023-08-30', 890);

INSERT INTO orders (order_id, order_date, total_amount)
VALUES (110, '2023-09-02', 620);

INSERT INTO orders (order_id, order_date, total_amount)
VALUES (111, '2023-09-05', 410);

INSERT INTO orders (order_id, order_date, total_amount)
VALUES (112, '2023-09-08', 550);

INSERT INTO orders (order_id, order_date, total_amount)
VALUES (113, '2023-09-10', 730);

INSERT INTO orders (order_id, order_date, total_amount)
VALUES (114, '2023-09-12', 670);

INSERT INTO orders (order_id, order_date, total_amount)
VALUES (115, '2023-09-15', 880);

INSERT INTO orders (order_id, order_date, total_amount)
VALUES (116, '2023-09-18', 590);

INSERT INTO orders (order_id, order_date, total_amount)
VALUES (117, '2023-09-20', 450);




Select count(*) from customers;
select sum(total_amount) as Total_Sales_Amount from orders;
select * from orders;

select dayname(order_date) as Week_Days, count(*) from orders group by Week_Days order by count(*) desc;

select count(order_id) as Total_Orders, avg(total_amount) as Average_Amount from orders; 

select min(order_date) as Earliest_Date, max(order_Date) Latest_Order from orders;

