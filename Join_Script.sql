 
create database store_database;

use store_Database;



CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50),
    created_at DATE
);


INSERT INTO customers VALUES
(1,'Amit Sharma','amit@gmail.com','9876543210','Pune','2024-01-01'),
(2,'Neha Verma','neha@gmail.com','9876543211','Mumbai','2024-01-02'),
(3,'Rahul Patil','rahul@gmail.com','9876543212','Nashik','2024-01-03'),
(4,'Priya Singh','priya@gmail.com','9876543213','Delhi','2024-01-04'),
(5,'Karan Mehta','karan@gmail.com','9876543214','Bangalore','2024-01-05'),
(6,'Sneha Joshi','sneha@gmail.com','9876543215','Pune','2024-01-06'),
(7,'Rohit Kumar','rohit@gmail.com','9876543216','Mumbai','2024-01-07'),
(8,'Pooja Shah','pooja@gmail.com','9876543217','Surat','2024-01-08'),
(9,'Ankit Jain','ankit@gmail.com','9876543218','Jaipur','2024-01-09'),
(10,'Meena Iyer','meena@gmail.com','9876543219','Chennai','2024-01-10'),
(11,'Vikas Yadav','vikas@gmail.com','9876543220','Lucknow','2024-01-11'),
(12,'Riya Kapoor','riya@gmail.com','9876543221','Delhi','2024-01-12'),
(13,'Sahil Khan','sahil@gmail.com','9876543222','Hyderabad','2024-01-13'),
(14,'Nikita Roy','nikita@gmail.com','9876543223','Kolkata','2024-01-14'),
(15,'Arjun Das','arjun@gmail.com','9876543224','Bhubaneswar','2024-01-15'),
(16,'Komal Gupta','komal@gmail.com','9876543225','Indore','2024-01-16'),
(17,'Deepak Singh','deepak@gmail.com','9876543226','Patna','2024-01-17'),
(18,'Ayesha Khan','ayesha@gmail.com','9876543227','Delhi','2024-01-18'),
(19,'Manish Agarwal','manish@gmail.com','9876543228','Kanpur','2024-01-19'),
(20,'Tina Dsouza','tina@gmail.com','9876543229','Goa','2024-01-20'),
(21,'Ramesh Patel','ramesh@gmail.com','9876543230','Ahmedabad','2024-01-21'),
(22,'Sonia Sharma','sonia@gmail.com','9876543231','Pune','2024-01-22'),
(23,'Ajay Mishra','ajay@gmail.com','9876543232','Varanasi','2024-01-23'),
(24,'Simran Kaur','simran@gmail.com','9876543233','Amritsar','2024-01-24'),
(25,'Mohit Bansal','mohit@gmail.com','9876543234','Delhi','2024-01-25'),
(26,'Neeraj Kumar','neeraj@gmail.com','9876543235','Noida','2024-01-26'),
(27,'Pallavi Joshi','pallavi@gmail.com','9876543236','Pune','2024-01-27'),
(28,'Varun Kapoor','varun@gmail.com','9876543237','Delhi','2024-01-28'),
(29,'Anjali Mehta','anjali@gmail.com','9876543238','Mumbai','2024-01-29'),
(30,'Ravi Verma','ravi@gmail.com','9876543239','Lucknow','2024-01-30'),
(31,'Suresh Reddy','suresh@gmail.com','9876543240','Hyderabad','2024-02-01'),
(32,'Kavita Singh','kavita@gmail.com','9876543241','Delhi','2024-02-02'),
(33,'Aman Gupta','aman@gmail.com','9876543242','Pune','2024-02-03'),
(34,'Nikhil Jain','nikhil@gmail.com','9876543243','Jaipur','2024-02-04'),
(35,'Ritu Sharma','ritu@gmail.com','9876543244','Mumbai','2024-02-05'),
(36,'Tarun Kumar','tarun@gmail.com','9876543245','Chandigarh','2024-02-06'),
(37,'Geeta Nair','geeta@gmail.com','9876543246','Kochi','2024-02-07'),
(38,'Farhan Ali','farhan@gmail.com','9876543247','Delhi','2024-02-08'),
(39,'Jyoti Yadav','jyoti@gmail.com','9876543248','Patna','2024-02-09'),
(40,'Abhishek Singh','abhishek@gmail.com','9876543249','Bhopal','2024-02-10');

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT,
    brand VARCHAR(50)
);


INSERT INTO products VALUES
(1,'iPhone 14','Mobile',80000,50,'Apple'),
(2,'Galaxy S22','Mobile',70000,40,'Samsung'),
(3,'OnePlus 11','Mobile',60000,35,'OnePlus'),
(4,'MacBook Air','Laptop',120000,20,'Apple'),
(5,'Dell XPS 13','Laptop',110000,25,'Dell'),
(6,'HP Pavilion','Laptop',75000,30,'HP'),
(7,'Sony Headphones','Accessories',15000,60,'Sony'),
(8,'Boat Earbuds','Accessories',3000,100,'Boat'),
(9,'iPad Pro','Tablet',90000,15,'Apple'),
(10,'Samsung Tab','Tablet',50000,20,'Samsung'),
(11,'Canon DSLR','Camera',65000,10,'Canon'),
(12,'Nikon DSLR','Camera',70000,12,'Nikon'),
(13,'LG OLED TV','TV',150000,8,'LG'),
(14,'Samsung Smart TV','TV',100000,10,'Samsung'),
(15,'Mi TV','TV',40000,20,'Xiaomi'),
(16,'Apple Watch','Wearable',45000,30,'Apple'),
(17,'Noise Watch','Wearable',5000,80,'Noise'),
(18,'JBL Speaker','Audio',12000,50,'JBL'),
(19,'Sony Speaker','Audio',15000,40,'Sony'),
(20,'Logitech Mouse','Accessories',2000,100,'Logitech'),
(21,'Keyboard','Accessories',3000,90,'HP'),
(22,'External HDD','Storage',8000,60,'Seagate'),
(23,'Pendrive','Storage',800,200,'SanDisk'),
(24,'Gaming Laptop','Laptop',150000,10,'Asus'),
(25,'Monitor','Accessories',20000,40,'Dell'),
(26,'Printer','Office',10000,25,'HP'),
(27,'Scanner','Office',12000,20,'Canon'),
(28,'Router','Networking',3000,70,'TP-Link'),
(29,'Projector','Office',40000,15,'Epson'),
(30,'VR Headset','Gaming',50000,10,'Meta');

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    status VARCHAR(20),

    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO orders VALUES
(1,1,1,1,'2024-03-01',80000,'Delivered'),
(2,1,2,1,'2024-03-02',70000,'Delivered'),
(3,1,8,2,'2024-03-05',6000,'Delivered'),
(4,2,3,1,'2024-03-03',60000,'Pending'),
(5,2,4,1,'2024-03-04',120000,'Delivered'),
(6,3,5,1,'2024-03-05',110000,'Shipped'),
(7,4,7,2,'2024-03-06',30000,'Delivered'),
(8,4,1,1,'2024-03-07',80000,'Delivered'),
(9,5,9,1,'2024-03-08',90000,'Delivered'),
(10,6,10,1,'2024-03-09',50000,'Cancelled'),
(11,7,1,1,'2024-03-10',80000,'Delivered'),
(12,8,2,1,'2024-03-11',70000,'Delivered'),
(13,9,6,1,'2024-03-12',75000,'Delivered'),
(14,10,3,2,'2024-03-13',120000,'Shipped'),
(15,11,11,1,'2024-03-14',65000,'Delivered'),
(16,12,12,1,'2024-03-15',70000,'Delivered'),
(17,13,13,1,'2024-03-16',150000,'Shipped'),
(18,14,14,1,'2024-03-17',100000,'Delivered'),
(19,15,15,1,'2024-03-18',40000,'Pending'),
(20,16,16,1,'2024-03-19',45000,'Delivered'),
(21,17,17,2,'2024-03-20',10000,'Delivered'),
(22,18,18,1,'2024-03-21',12000,'Cancelled'),
(23,19,19,1,'2024-03-22',15000,'Delivered'),
(24,20,20,2,'2024-03-23',4000,'Delivered'),
(25,1,21,1,'2024-03-24',3000,'Pending'),
(26,2,22,1,'2024-03-25',8000,'Delivered'),
(27,3,23,3,'2024-03-26',2400,'Delivered'),
(28,4,24,1,'2024-03-27',150000,'Shipped'),
(29,5,25,1,'2024-03-28',20000,'Delivered'),
(30,6,26,1,'2024-03-29',10000,'Cancelled'); 

SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;

-- Show order id, product name, and quantity
SELECT order_id, product_name,quantity from orders o
join products p on o.product_id=p.product_id;

-- Show all customers names who placed orders 
SELECT distinct c.name FROM Customers c 
Inner join orders o on c.customer_id=o.customer_id;

-- Show customer name with order id 
SELECT c.name,o.order_id FROM Customers c 
join orders o on c.customer_id=o.customer_id;

-- Show all orders with product names 
select o.order_id,p.product_name From orders o
join products p on o.product_id=p.product_id;

-- Show customer name and product purchased 
SELECT c.name,p.product_name FROM Customers c 
join orders o on c.customer_id=o.customer_id 
join products p on o.product_id=p.product_id;

-- Show all customers (even without orders) 
SELECT c.name as Customers,o.customer_id FROM Customers c
left join orders o on c.customer_id=o.customer_id 
where o.customer_id is null;

-- Show products that were never ordered
SELECT p.product_id,p.Product_name from products p
left join orders o on p.product_id = o. product_id
where p.product_id is null;

-- Show customers who never placed orders
SELECT o.customer_id,c.name as Customers FROM Customers c
join orders o on c.customer_id=o.customer_id 
where o.customer_id is null;

-- Show all orders with customer city 
SELECT *,c.city FROM Orders o
join customers c on o.customer_id=c.customer_id;

-- Show all delivered orders with customer name 
SELECT status,name FROM customers c
join Orders o on c.customer_id=o.customer_id
where status='delivered';

-- count thee Total orders per customer 
SELECT c.customer_id, count(o.order_id) FROM Orders o
join customers c on o.customer_id=c.customer_id
group by c.customer_id;

-- Total quantity sold per product 
SELECT p.product_id,sum(o.quantity) from products p
join orders o on p.product_id = o.product_id
group by p.product_id;

-- Show count of orders per city 
SELECT c.city,count(order_id) FROM customers c
join Orders o on c.customer_id=o.customer_id
group by c.city;

-- Find the names of cities where no customers have placed any orders
SELECT o.order_id,c.city FROM Orders o
join customers c on o.customer_id=c.customer_id
where c.city is null;
