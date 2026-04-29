use Vaishnavi;

CREATE TABLE sales_data (
    sale_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    region VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    sale_date DATE
);


INSERT INTO sales_data VALUES
(1,'Laptop','Electronics','West',2,55000,'2025-01-01'),
(2,'Mobile','Electronics','East',5,20000,'2025-01-02'),
(3,'Shoes','Fashion','North',3,3000,'2025-01-03'),
(4,'Watch','Accessories','South',4,2500,'2025-01-04'),
(5,'TV','Electronics','West',1,60000,'2025-01-05'),
(6,'Shirt','Fashion','East',6,1500,'2025-01-06'),
(7,'Bag','Accessories','North',2,2000,'2025-01-07'),
(8,'Tablet','Electronics','South',3,30000,'2025-01-08'),
(9,'Jeans','Fashion','West',4,2500,'2025-01-09'),
(10,'Headphones','Electronics','East',5,2000,'2025-01-10'),
(11,'Camera','Electronics','North',1,45000,'2025-01-11'),
(12,'Socks','Fashion','South',10,200,'2025-01-12'),
(13,'Shoes','Fashion','West',2,3500,'2025-01-13'),
(14,'Laptop','Electronics','East',1,58000,'2025-01-14'),
(15,'Mobile','Electronics','North',3,18000,'2025-01-15'),
(16,'Watch','Accessories','South',2,3000,'2025-01-16'),
(17,'Bag','Accessories','West',3,2200,'2025-01-17'),
(18,'Tablet','Electronics','East',2,32000,'2025-01-18'),
(19,'TV','Electronics','North',1,65000,'2025-01-19'),
(20,'Shirt','Fashion','South',5,1700,'2025-01-20'),
(21,'Jeans','Fashion','West',2,2600,'2025-01-21'),
(22,'Headphones','Electronics','East',4,2100,'2025-01-22'),
(23,'Camera','Electronics','North',2,47000,'2025-01-23'),
(24,'Socks','Fashion','South',8,250,'2025-01-24'),
(25,'Shoes','Fashion','West',3,3200,'2025-01-25'),
(26,'Laptop','Electronics','East',2,60000,'2025-01-26'),
(27,'Mobile','Electronics','North',4,19000,'2025-01-27'),
(28,'Watch','Accessories','South',3,2800,'2025-01-28'),
(29,'Bag','Accessories','West',2,2100,'2025-01-29'),
(30,'Tablet','Electronics','East',1,31000,'2025-01-30'),
(31,'TV','Electronics','North',2,62000,'2025-02-01'),
(32,'Shirt','Fashion','South',6,1600,'2025-02-02'),
(33,'Jeans','Fashion','West',3,2700,'2025-02-03'),
(34,'Headphones','Electronics','East',2,2200,'2025-02-04'),
(35,'Camera','Electronics','North',1,48000,'2025-02-05'),
(36,'Socks','Fashion','South',7,300,'2025-02-06'),
(37,'Shoes','Fashion','West',4,3400,'2025-02-07'),
(38,'Laptop','Electronics','East',1,62000,'2025-02-08'),
(39,'Mobile','Electronics','North',2,20000,'2025-02-09'),
(40,'Watch','Accessories','South',4,2600,'2025-02-10'),
(41,'Bag','Accessories','West',3,2300,'2025-02-11'),
(42,'Tablet','Electronics','East',2,33000,'2025-02-12'),
(43,'TV','Electronics','North',1,70000,'2025-02-13'),
(44,'Shirt','Fashion','South',5,1800,'2025-02-14'),
(45,'Jeans','Fashion','West',2,2800,'2025-02-15'),
(46,'Headphones','Electronics','East',3,2500,'2025-02-16'),
(47,'Camera','Electronics','North',2,50000,'2025-02-17'),
(48,'Socks','Fashion','South',9,280,'2025-02-18'),
(49,'Shoes','Fashion','West',1,3600,'2025-02-19'),
(50,'Laptop','Electronics','East',2,65000,'2025-02-20');

#sale_id,product_name,category,region,quantity,price,sale_date

 select * from sales_data;

-- Total number of sales records 
select count(sale_id) from sales_data;

-- Number of sales in Electronics category 
select count(category) from Sales_data where category='electronics';

-- Total quantity sold
select sum(quantity) from sales_data;

-- Total revenue generated 
select sum(quantity*price) as Total_revenue from sales_data;

-- Average price of products from South region
select avg(price) from sales_data where region='south';
  
-- Find the highest priced product in Fashion category 
select max(price) from sales_data where category='fashion';

-- find the Cheapest product price 
select min(price) from sales_data;

-- Find the low priced product in Fashion category 
select min(price) from sales_data where category='fashion';
 
-- Total quantity sold per category 
select category, sum(quantity) from sales_data group by category;

-- write a quary to find Total revenue per category 
select category, sum(quantity*price) as revenue from sales_data group by category;


-- Write a quary to find Number of sales per region 
select region, count(sale_id) from sales_data group by region;

-- write a quary to find Maximum and maximum price per category 
select category,min(price), max(price) from sales_data group by category;

-- Which category has the highest maximum price among all categories
select category,max(price) from sales_data group by category;

-- Total orders per year
select sale_date,sum(quantity) from sales_data group by sale_date having year(sale_date);

select year(sale_date)as sales_year, count(quantity) as orders from sales_data group by year(sale_date);

-- Find the number of sales in each region and display only those regions where the total sales greater than 12.
select region, count(sale_id) as totalsales from sales_data group by region having count(sale_id)>12;







 

