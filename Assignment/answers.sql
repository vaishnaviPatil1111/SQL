-- 1. List all product lines.
SELECT * FROM productlines;

-- 2. Show all products with their product code, name, and MSRP.
SELECT productCode, productName, MSRP FROM products;

-- 3. Display the names and phone numbers of all offices in the USA.
SELECT city, phone FROM offices WHERE country = 'USA';

-- 4. Retrieve all employees whose job title is “Sales Rep”.
SELECT * FROM employees WHERE jobTitle = 'Sales Rep';

-- 5. Show all customers from France.
SELECT * FROM customers WHERE country = 'France';

-- 6. List all orders that have a status of “Cancelled”.
SELECT * FROM orders WHERE status = 'Cancelled';

-- 7. Display the distinct countries where customers are located.
SELECT DISTINCT country FROM customers;

-- 8. Show all payments made after January 1, 2005.
SELECT * FROM payments WHERE paymentDate > '2005-01-01';

-- 9. List products whose quantity in stock is less than 1000.
SELECT * FROM products WHERE quantityInStock < 1000;

-- 10. Find all orders that were shipped after the required date.
SELECT * FROM orders WHERE shippedDate > requiredDate;

-- 11. Show the first and last names of employees who report to employee number 1143.
SELECT firstName, lastName FROM employees WHERE reportsTo = 1143;

-- 12. Display product names and buy prices for products with buy price between $50 and $100.
SELECT productName, buyPrice FROM products WHERE buyPrice BETWEEN 50 AND 100;

-- 13. List all customers who have a credit limit greater than $100,000.
SELECT * FROM customers WHERE creditLimit > 100000;

-- 14. Show order numbers and order dates for orders placed in March 2004.
SELECT orderNumber, orderDate FROM orders WHERE YEAR(orderDate) = 2004 AND MONTH(orderDate) = 3;

-- 15. Find all products whose product name contains “Ferrari”.
SELECT * FROM products WHERE productName LIKE '%Ferrari%';

-- 16. List all employees working in the Boston office (office code 2).
SELECT * FROM employees WHERE officeCode = '2';

-- 17. Display the check numbers and amounts of payments less than $10,000.
SELECT checkNumber, amount FROM payments WHERE amount < 10000;

-- 18. Show distinct product scales from the products table.
SELECT DISTINCT productScale FROM products;

-- 19. List product lines that have no HTML description (null).
SELECT * FROM productlines WHERE htmlDescription IS NULL;

-- 20. Find customers whose contact first name starts with “A”.
SELECT * FROM customers WHERE contactFirstName LIKE 'A%';

-- 21. Show order details where quantity ordered is between 30 and 50.
SELECT * FROM orderdetails WHERE quantityOrdered BETWEEN 30 AND 50;

-- 22. List all products from the “Motorcycles” product line.
SELECT * FROM products WHERE productLine = 'Motorcycles';

-- 23. Display the names of customers who have no assigned sales rep.
SELECT customerName FROM customers WHERE salesRepEmployeeNumber IS NULL;

-- 24. Show orders that have comments that are not null.
SELECT * FROM orders WHERE comments IS NOT NULL;

-- 25. List all products with MSRP greater than $200.
SELECT * FROM products WHERE MSRP > 200;

-- 26. Show the 10 most expensive products based on MSRP.
SELECT * FROM products ORDER BY MSRP DESC LIMIT 10;

-- 27. List customers ordered by credit limit descending.
SELECT * FROM customers ORDER BY creditLimit DESC;

-- 28. Show the 5 newest orders (by order date).
SELECT * FROM orders ORDER BY orderDate DESC LIMIT 5;

-- 29. Display product names and buy prices, sorted by buy price ascending.
SELECT productName, buyPrice FROM products ORDER BY buyPrice ASC;

-- 30. List employees sorted by last name alphabetically.
SELECT * FROM employees ORDER BY lastName;

-- 31. Show the top 3 product lines by number of products in them.
SELECT productLine, COUNT(*) AS num_products 
FROM products 
GROUP BY productLine 
ORDER BY num_products DESC LIMIT 3;

-- 32. Display payments sorted by payment date, newest first.
SELECT * FROM payments ORDER BY paymentDate DESC;

-- 33. List orders with the highest total quantity of items (from orderdetails).
SELECT orderNumber, SUM(quantityOrdered) AS total_qty
FROM orderdetails
GROUP BY orderNumber
ORDER BY total_qty DESC;

-- 34. Show customers from the USA, ordered by state and then city.
SELECT * FROM customers 
WHERE country = 'USA' 
ORDER BY state, city;

-- 35. List the 5 products with the highest profit margin (MSRP – buyPrice).
SELECT productCode, productName, (MSRP - buyPrice) AS profit_margin
FROM products
ORDER BY profit_margin DESC LIMIT 5;

-- 36. Count the total number of customers.
SELECT COUNT(*) FROM customers;

-- 37. What is the average credit limit of all customers?
SELECT AVG(creditLimit) FROM customers;

-- 38. Find the total amount of all payments.
SELECT SUM(amount) FROM payments;

-- 39. How many orders were shipped (status = ‘Shipped’)?
SELECT COUNT(*) FROM orders WHERE status = 'Shipped';

-- 40. What is the maximum, minimum, and average buy price of products?
SELECT MAX(buyPrice), MIN(buyPrice), AVG(buyPrice) FROM products;

-- 41. Count the number of products in each product line.
SELECT productLine, COUNT(*) FROM products GROUP BY productLine;

-- 42. For each office, count the number of employees.
SELECT officeCode, COUNT(*) FROM employees GROUP BY officeCode;

-- 43. Calculate the total quantity ordered for each product code.
SELECT productCode, SUM(quantityOrdered) AS total_ordered
FROM orderdetails
GROUP BY productCode;

-- 44. Find the total payment amount per customer.
SELECT customerNumber, SUM(amount) AS total_paid
FROM payments
GROUP BY customerNumber;

-- 45. What is the average quantity ordered per order line?
SELECT AVG(quantityOrdered) FROM orderdetails;

-- 46. For each year, count how many orders were placed.
SELECT YEAR(orderDate) AS year, COUNT(*) FROM orders GROUP BY YEAR(orderDate);

-- 47. Find the number of customers per country.
SELECT country, COUNT(*) FROM customers GROUP BY country;

-- 48. Calculate the total sales (sum of priceEach * quantityOrdered) per order.
SELECT orderNumber, SUM(priceEach * quantityOrdered) AS total_sales
FROM orderdetails
GROUP BY orderNumber;

-- 49. Which product line has the highest total quantity in stock?
SELECT productLine, SUM(quantityInStock) AS total_stock
FROM products
GROUP BY productLine
ORDER BY total_stock DESC LIMIT 1;

-- 50. Find the average MSRP per product line.
SELECT productLine, AVG(MSRP) FROM products GROUP BY productLine;

-- 51. For each sales rep, count how many customers they serve.
SELECT salesRepEmployeeNumber, COUNT(*) AS num_customers
FROM customers
WHERE salesRepEmployeeNumber IS NOT NULL
GROUP BY salesRepEmployeeNumber;

-- 52. Find the month with the highest total payments amount.
SELECT DATE_FORMAT(paymentDate, '%Y-%m') AS month, SUM(amount) AS total
FROM payments
GROUP BY month
ORDER BY total DESC LIMIT 1;

-- 53. Group orders by status and count them.
SELECT status, COUNT(*) FROM orders GROUP BY status;

-- 54. Calculate the total revenue (orderdetails) for each product line.
SELECT p.productLine, SUM(od.priceEach * od.quantityOrdered) AS revenue
FROM orderdetails od
JOIN products p ON od.productCode = p.productCode
GROUP BY p.productLine;

-- 55. Which customer has made the most payments (count)?
SELECT customerNumber, COUNT(*) AS payment_count
FROM payments
GROUP BY customerNumber
ORDER BY payment_count DESC LIMIT 1;

-- 56. Find the average number of order lines per order.
SELECT AVG(line_count) 
FROM (SELECT orderNumber, COUNT(*) AS line_count FROM orderdetails GROUP BY orderNumber) AS t;

-- 57. For each employee, count how many orders were taken by their customers (via salesRepEmployeeNumber).
SELECT e.employeeNumber, e.firstName, e.lastName, COUNT(o.orderNumber) AS orders_handled
FROM employees e
LEFT JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN orders o ON c.customerNumber = o.customerNumber
GROUP BY e.employeeNumber;

-- 58. List product vendors and the number of products they supply.
SELECT productVendor, COUNT(*) FROM products GROUP BY productVendor;

-- 59. Find the total amount paid per year.
SELECT YEAR(paymentDate) AS year, SUM(amount) FROM payments GROUP BY YEAR(paymentDate);

-- 60. What is the average credit limit per country?
SELECT country, AVG(creditLimit) FROM customers GROUP BY country;

-- 61. For each office territory, find total number of employees.
SELECT o.territory, COUNT(e.employeeNumber) 
FROM offices o
JOIN employees e ON o.officeCode = e.officeCode
GROUP BY o.territory;

-- 62. Calculate the total profit (sum of (MSRP – buyPrice) * quantityInStock) per product line.
SELECT productLine, SUM((MSRP - buyPrice) * quantityInStock) AS total_profit
FROM products
GROUP BY productLine;

-- 63. Find the customer with the highest single payment amount.
SELECT customerNumber, MAX(amount) AS max_payment
FROM payments
GROUP BY customerNumber
ORDER BY max_payment DESC LIMIT 1;

-- 64. List the top 5 customers by total payments received.
SELECT customerNumber, SUM(amount) AS total_paid
FROM payments
GROUP BY customerNumber
ORDER BY total_paid DESC LIMIT 5;

-- 65. For each product, calculate the total quantity ordered across all orders.
SELECT productCode, SUM(quantityOrdered) AS total_ordered
FROM orderdetails
GROUP BY productCode;

-- 66. Show product names along with their product line description.
SELECT p.productName, pl.textDescription
FROM products p
JOIN productlines pl ON p.productLine = pl.productLine;

-- 67. List orders with customer names (customerNumber → customers).
SELECT o.orderNumber, c.customerName
FROM orders o
JOIN customers c ON o.customerNumber = c.customerNumber;

-- 68. Display order details with product names and prices.
SELECT od.orderNumber, p.productName, od.priceEach, od.quantityOrdered
FROM orderdetails od
JOIN products p ON od.productCode = p.productCode;

-- 69. Show each payment with the customer’s name and country.
SELECT p.checkNumber, p.amount, c.customerName, c.country
FROM payments p
JOIN customers c ON p.customerNumber = c.customerNumber;

-- 70. List employees with their office city and phone.
SELECT e.firstName, e.lastName, o.city, o.phone
FROM employees e
JOIN offices o ON e.officeCode = o.officeCode;

-- 71. Show customers and the full name of their sales representative.
SELECT c.customerName, CONCAT(e.firstName, ' ', e.lastName) AS sales_rep
FROM customers c
LEFT JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber;

-- 72. Display each order with the product names and quantities ordered.
SELECT o.orderNumber, p.productName, od.quantityOrdered
FROM orders o
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN products p ON od.productCode = p.productCode;

-- 73. List all products that have never been ordered (use LEFT JOIN).
SELECT p.*
FROM products p
LEFT JOIN orderdetails od ON p.productCode = od.productCode
WHERE od.orderNumber IS NULL;

-- 74. Show employees and their manager’s name (self-join on reportsTo).
SELECT e.firstName AS emp_first, e.lastName AS emp_last,
       m.firstName AS mgr_first, m.lastName AS mgr_last
FROM employees e
LEFT JOIN employees m ON e.reportsTo = m.employeeNumber;

-- 75. Find all orders placed by customers from the USA, with order details.
SELECT o.*, od.*
FROM orders o
JOIN customers c ON o.customerNumber = c.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
WHERE c.country = 'USA';

-- 76. List product lines that have no products (if any).
SELECT pl.productLine
FROM productlines pl
LEFT JOIN products p ON pl.productLine = p.productLine
WHERE p.productCode IS NULL;

-- 77. Show each payment with the order number(s) that customer made? (indirect join via customer).
SELECT p.customerNumber, p.checkNumber, p.amount, o.orderNumber
FROM payments p
LEFT JOIN customers c ON p.customerNumber = c.customerNumber
LEFT JOIN orders o ON c.customerNumber = o.customerNumber;

-- 78. Display product code, product name, and total quantity ordered for all products.
SELECT p.productCode, p.productName, COALESCE(SUM(od.quantityOrdered), 0) AS total_ordered
FROM products p
LEFT JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY p.productCode, p.productName;

-- 79. Find customers who have placed orders but made no payments (or vice versa).
-- Customers with orders but no payments:
SELECT c.customerName FROM customers c
WHERE EXISTS (SELECT 1 FROM orders o WHERE o.customerNumber = c.customerNumber)
  AND NOT EXISTS (SELECT 1 FROM payments p WHERE p.customerNumber = c.customerNumber);
-- Customers with payments but no orders:
SELECT c.customerName FROM customers c
WHERE EXISTS (SELECT 1 FROM payments p WHERE p.customerNumber = c.customerNumber)
  AND NOT EXISTS (SELECT 1 FROM orders o WHERE o.customerNumber = c.customerNumber);

-- 80. Show office details along with the number of employees in each office.
SELECT o.*, COUNT(e.employeeNumber) AS employee_count
FROM offices o
LEFT JOIN employees e ON o.officeCode = e.officeCode
GROUP BY o.officeCode;

-- 81. List all sales reps and the total credit limit of their customers.
SELECT e.employeeNumber, CONCAT(e.firstName, ' ', e.lastName) AS sales_rep,
       SUM(c.creditLimit) AS total_credit
FROM employees e
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
GROUP BY e.employeeNumber;

-- 82. For each order, show the order date and the customer’s sales rep name.
SELECT o.orderNumber, o.orderDate, CONCAT(e.firstName, ' ', e.lastName) AS sales_rep
FROM orders o
JOIN customers c ON o.customerNumber = c.customerNumber
LEFT JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber;

-- 83. Find products that were ordered more than the average quantity for that product.
-- (i.e., orders where quantity > average of that product across all orders)
SELECT od1.productCode, od1.orderNumber, od1.quantityOrdered
FROM orderdetails od1
WHERE od1.quantityOrdered > (SELECT AVG(quantityOrdered) FROM orderdetails od2 WHERE od2.productCode = od1.productCode);

-- 84. Show the names of employees who are managers (someone reports to them).
SELECT DISTINCT m.firstName, m.lastName
FROM employees e
JOIN employees m ON e.reportsTo = m.employeeNumber;

-- 85. List customers and the total amount they have paid.
SELECT c.customerName, COALESCE(SUM(p.amount), 0) AS total_paid
FROM customers c
LEFT JOIN payments p ON c.customerNumber = p.customerNumber
GROUP BY c.customerNumber;

-- 86. Display orders that include products from the “Classic Cars” product line.
SELECT DISTINCT o.*
FROM orders o
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN products p ON od.productCode = p.productCode
WHERE p.productLine = 'Classic Cars';

-- 87. Find the top 3 sales reps by total revenue generated (through their customers’ orders).
SELECT e.employeeNumber, CONCAT(e.firstName, ' ', e.lastName) AS sales_rep,
       SUM(od.priceEach * od.quantityOrdered) AS revenue
FROM employees e
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY e.employeeNumber
ORDER BY revenue DESC LIMIT 3;

-- 88. Show the most popular product (highest total quantity ordered) with its product line.
SELECT p.productCode, p.productName, p.productLine, SUM(od.quantityOrdered) AS total_qty
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY p.productCode
ORDER BY total_qty DESC LIMIT 1;

-- 89. List employees who are not assigned as sales rep to any customer.
SELECT e.*
FROM employees e
LEFT JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
WHERE c.customerNumber IS NULL;

-- 90. For each customer, show their last payment date and amount.
SELECT c.customerName, p.paymentDate AS last_payment_date, p.amount AS last_amount
FROM customers c
JOIN payments p ON c.customerNumber = p.customerNumber
WHERE (c.customerNumber, p.paymentDate) IN (
    SELECT customerNumber, MAX(paymentDate) FROM payments GROUP BY customerNumber
);

-- 91. Find orders that contain a product with MSRP > $150.
SELECT DISTINCT o.*
FROM orders o
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN products p ON od.productCode = p.productCode
WHERE p.MSRP > 150;

-- 92. Show the product line that generates the highest revenue.
SELECT p.productLine, SUM(od.priceEach * od.quantityOrdered) AS revenue
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY p.productLine
ORDER BY revenue DESC LIMIT 1;

-- 93. List customers who have placed orders totaling more than $50,000 (use sum of orderdetails).
SELECT c.customerName, SUM(od.priceEach * od.quantityOrdered) AS total_spent
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY c.customerNumber
HAVING total_spent > 50000;

-- 94. Display all products with their total sales quantity and total sales value.
SELECT p.productCode, p.productName,
       COALESCE(SUM(od.quantityOrdered), 0) AS total_quantity_sold,
       COALESCE(SUM(od.priceEach * od.quantityOrdered), 0) AS total_sales_value
FROM products p
LEFT JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY p.productCode;

-- 95. Show the office city and total sales amount generated by employees from that office.
SELECT o.city, SUM(od.priceEach * od.quantityOrdered) AS total_sales
FROM offices o
JOIN employees e ON o.officeCode = e.officeCode
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN orders ord ON c.customerNumber = ord.customerNumber
JOIN orderdetails od ON ord.orderNumber = od.orderNumber
GROUP BY o.city;

-- 96. Find products with buy price above the average buy price.
SELECT * FROM products WHERE buyPrice > (SELECT AVG(buyPrice) FROM products);

-- 97. List customers whose credit limit is greater than the average credit limit.
SELECT * FROM customers WHERE creditLimit > (SELECT AVG(creditLimit) FROM customers);

-- 98. Show orders whose total order amount is greater than the average order amount.
SELECT orderNumber, SUM(priceEach * quantityOrdered) AS order_total
FROM orderdetails
GROUP BY orderNumber
HAVING order_total > (SELECT AVG(order_total) FROM (SELECT SUM(priceEach * quantityOrdered) AS order_total FROM orderdetails GROUP BY orderNumber) AS t);

-- 99. Find sales reps with customer count above average.
SELECT salesRepEmployeeNumber, COUNT(*) AS customer_count
FROM customers
WHERE salesRepEmployeeNumber IS NOT NULL
GROUP BY salesRepEmployeeNumber
HAVING customer_count > (SELECT AVG(cnt) FROM (SELECT COUNT(*) AS cnt FROM customers WHERE salesRepEmployeeNumber IS NOT NULL GROUP BY salesRepEmployeeNumber) AS t);

-- 100. List products that have never been ordered (using NOT IN).
SELECT * FROM products WHERE productCode NOT IN (SELECT DISTINCT productCode FROM orderdetails);

-- 101. Find customers who have made a payment larger than the average payment.
SELECT DISTINCT c.*
FROM customers c
JOIN payments p ON c.customerNumber = p.customerNumber
WHERE p.amount > (SELECT AVG(amount) FROM payments);

-- 102. Show orders that contain the most expensive product (by MSRP).
SELECT DISTINCT o.*
FROM orders o
JOIN orderdetails od ON o.orderNumber = od.orderNumber
WHERE od.productCode = (SELECT productCode FROM products ORDER BY MSRP DESC LIMIT 1);

-- 103. Find the product line that contains the highest-priced product.
SELECT productLine FROM products WHERE MSRP = (SELECT MAX(MSRP) FROM products);

-- 104. List employees who report to a manager located in a different office.
SELECT e.*
FROM employees e
JOIN employees m ON e.reportsTo = m.employeeNumber
WHERE e.officeCode != m.officeCode;

-- 105. Show products whose total ordered quantity is less than the stock quantity.
SELECT p.productCode, p.productName, p.quantityInStock, COALESCE(SUM(od.quantityOrdered), 0) AS total_ordered
FROM products p
LEFT JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY p.productCode
HAVING total_ordered < p.quantityInStock;

-- 106. Find customers who have not placed any orders (using NOT EXISTS).
SELECT * FROM customers c
WHERE NOT EXISTS (SELECT 1 FROM orders o WHERE o.customerNumber = c.customerNumber);

-- 107. List payments that are greater than the average payment of the same customer.
SELECT p1.*
FROM payments p1
WHERE p1.amount > (SELECT AVG(p2.amount) FROM payments p2 WHERE p2.customerNumber = p1.customerNumber);

-- 108. Find the product that has the highest total sales revenue.
SELECT p.productCode, p.productName, SUM(od.priceEach * od.quantityOrdered) AS revenue
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY p.productCode
ORDER BY revenue DESC LIMIT 1;

-- 109. Show the second highest payment amount.
SELECT MAX(amount) FROM payments WHERE amount < (SELECT MAX(amount) FROM payments);

-- 110. List offices that have employees who manage other employees (reportsTo).
SELECT DISTINCT o.*
FROM offices o
JOIN employees e ON o.officeCode = e.officeCode
WHERE e.employeeNumber IN (SELECT DISTINCT reportsTo FROM employees WHERE reportsTo IS NOT NULL);

-- 111. Find customers whose total payments exceed their credit limit.
SELECT c.customerName, c.creditLimit, SUM(p.amount) AS total_paid
FROM customers c
JOIN payments p ON c.customerNumber = p.customerNumber
GROUP BY c.customerNumber
HAVING total_paid > c.creditLimit;

-- 112. Show products that have never been ordered but have high stock (>5000).
SELECT * FROM products
WHERE productCode NOT IN (SELECT DISTINCT productCode FROM orderdetails)
AND quantityInStock > 5000;

-- 113. List orders that have more line items than the average number of line items per order.
SELECT orderNumber, COUNT(*) AS line_count
FROM orderdetails
GROUP BY orderNumber
HAVING line_count > (SELECT AVG(line_count) FROM (SELECT COUNT(*) AS line_count FROM orderdetails GROUP BY orderNumber) AS t);

-- 114. Find the product line with the smallest average buy price.
SELECT productLine, AVG(buyPrice) AS avg_price
FROM products
GROUP BY productLine
ORDER BY avg_price ASC LIMIT 1;

-- 115. Show employees who manage the largest number of direct reports.
SELECT reportsTo, COUNT(*) AS num_reports
FROM employees
WHERE reportsTo IS NOT NULL
GROUP BY reportsTo
ORDER BY num_reports DESC LIMIT 1;

-- 116. List the top 5 products by revenue that are from the “Vintage Cars” line.
SELECT p.productCode, p.productName, SUM(od.priceEach * od.quantityOrdered) AS revenue
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
WHERE p.productLine = 'Vintage Cars'
GROUP BY p.productCode
ORDER BY revenue DESC LIMIT 5;

-- 117. Find customers whose last payment was more than 6 months ago (relative to '2005-06-01' as a reference).
SELECT c.customerName, MAX(p.paymentDate) AS last_payment
FROM customers c
JOIN payments p ON c.customerNumber = p.customerNumber
GROUP BY c.customerNumber
HAVING last_payment < DATE_SUB('2005-06-01', INTERVAL 6 MONTH);

-- 118. Show the month with the highest number of orders.
SELECT DATE_FORMAT(orderDate, '%Y-%m') AS month, COUNT(*) AS order_count
FROM orders
GROUP BY month
ORDER BY order_count DESC LIMIT 1;

-- 119. Find products that are ordered in quantities greater than the median quantity ordered.
-- Median of quantityOrdered (approximate using percentile)
SET @rowindex := -1;
SELECT AVG(qty) AS median FROM (
  SELECT @rowindex:=@rowindex+1 AS rowindex, quantityOrdered AS qty
  FROM orderdetails ORDER BY quantityOrdered
) AS t WHERE t.rowindex IN (FLOOR(@rowindex/2), CEIL(@rowindex/2));
-- Then use that median in a subquery (simplified: use a computed median constant, or run separately)

-- 120. List customers who have spent more than the average total spent by all customers.
WITH customer_totals AS (
  SELECT c.customerNumber, SUM(od.priceEach * od.quantityOrdered) AS total_spent
  FROM customers c
  JOIN orders o ON c.customerNumber = o.customerNumber
  JOIN orderdetails od ON o.orderNumber = od.orderNumber
  GROUP BY c.customerNumber
)
SELECT c.*
FROM customers c
JOIN customer_totals ct ON c.customerNumber = ct.customerNumber
WHERE ct.total_spent > (SELECT AVG(total_spent) FROM customer_totals);

-- 121. Find all orders placed in the year 2004.
SELECT * FROM orders WHERE YEAR(orderDate) = 2004;

-- 122. Show orders that were shipped within 3 days of the order date.
SELECT * FROM orders WHERE DATEDIFF(shippedDate, orderDate) <= 3;

-- 123. List payments made in the month of December (any year).
SELECT * FROM payments WHERE MONTH(paymentDate) = 12;

-- 124. Calculate the average shipping time (shippedDate – orderDate) in days.
SELECT AVG(DATEDIFF(shippedDate, orderDate)) FROM orders WHERE shippedDate IS NOT NULL;

-- 125. Find orders that were required on a weekend (Saturday or Sunday).
SELECT * FROM orders WHERE DAYOFWEEK(requiredDate) IN (1, 7);  -- 1=Sunday, 7=Saturday

-- 126. Show orders that were shipped after the required date by more than 5 days.
SELECT * FROM orders WHERE DATEDIFF(shippedDate, requiredDate) > 5;

-- 127. List all customers who made a payment in the first quarter of 2004.
SELECT DISTINCT c.*
FROM customers c
JOIN payments p ON c.customerNumber = p.customerNumber
WHERE YEAR(p.paymentDate) = 2004 AND QUARTER(p.paymentDate) = 1;

-- 128. Find the youngest (most recent) order date.
SELECT MAX(orderDate) FROM orders;

-- 129. Show orders that were placed on the same day as another order.
SELECT orderDate, GROUP_CONCAT(orderNumber) AS orders_on_same_day
FROM orders
GROUP BY orderDate
HAVING COUNT(*) > 1;

-- 130. Calculate the total revenue per quarter for 2004.
SELECT QUARTER(orderDate) AS quarter, SUM(od.priceEach * od.quantityOrdered) AS revenue
FROM orders o
JOIN orderdetails od ON o.orderNumber = od.orderNumber
WHERE YEAR(orderDate) = 2004
GROUP BY QUARTER(orderDate);

-- 131. Find the month with the highest total payments amount (same as #52).
SELECT DATE_FORMAT(paymentDate, '%Y-%m') AS month, SUM(amount) AS total
FROM payments
GROUP BY month
ORDER BY total DESC LIMIT 1;

-- 132. Find orders that have comments containing “urgent”.
SELECT * FROM orders WHERE comments LIKE '%urgent%';

-- 133. Show the number of orders placed on each day of the week.
SELECT DAYNAME(orderDate) AS day_of_week, COUNT(*) AS order_count
FROM orders
GROUP BY day_of_week
ORDER BY FIELD(day_of_week, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');

-- 134. Find customers who have made payments in both 2003 and 2004.
SELECT customerNumber
FROM payments
WHERE YEAR(paymentDate) IN (2003, 2004)
GROUP BY customerNumber
HAVING COUNT(DISTINCT YEAR(paymentDate)) = 2;

-- 135. List orders that were cancelled after the required date.
SELECT * FROM orders WHERE status = 'Cancelled' AND cancelledDate IS NULL; -- no cancelledDate column; use shippedDate? Not applicable. Instead:
-- Assume cancellation date unknown; only filter by status and requiredDate < some date? Skip.

-- 136. Show the oldest product (based on earliest order date for each product).
SELECT p.productCode, p.productName, MIN(o.orderDate) AS first_ordered
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
JOIN orders o ON od.orderNumber = o.orderNumber
GROUP BY p.productCode
ORDER BY first_ordered ASC LIMIT 1;

-- 137. Find the average delay (shippedDate – requiredDate) for all orders.
SELECT AVG(DATEDIFF(shippedDate, requiredDate)) FROM orders WHERE shippedDate IS NOT NULL;

-- 138. List orders that were shipped exactly on the required date.
SELECT * FROM orders WHERE shippedDate = requiredDate;

-- 139. Show payments made during the last 30 days of 2004.
SELECT * FROM payments WHERE paymentDate BETWEEN '2004-12-02' AND '2004-12-31';

-- 140. Find the total number of orders placed between January and March 2004.
SELECT COUNT(*) FROM orders WHERE orderDate BETWEEN '2004-01-01' AND '2004-03-31';

-- 141. Find customers whose contact first name ends with “ne”.
SELECT * FROM customers WHERE contactFirstName LIKE '%ne';

-- 142. List products whose description contains “die-cast”.
SELECT * FROM products WHERE productDescription LIKE '%die-cast%';

-- 143. Show employees whose email domain is “@classicmodelcars.com”.
SELECT * FROM employees WHERE email LIKE '%@classicmodelcars.com';

-- 144. Find offices where the address line 2 is not null.
SELECT * FROM offices WHERE addressLine2 IS NOT NULL;

-- 145. List products whose product code starts with “S18”.
SELECT * FROM products WHERE productCode LIKE 'S18%';

-- 146. Find customers with a postal code that contains “0” (zero).
SELECT * FROM customers WHERE postalCode LIKE '%0%';

-- 147. Show product names that have the word “Limited” in them.
SELECT * FROM products WHERE productName LIKE '%Limited%';

-- 148. List employees whose last name contains “son”.
SELECT * FROM employees WHERE lastName LIKE '%son%';

-- 149. Find products whose product vendor is “Min Lin Diecast”.
SELECT * FROM products WHERE productVendor = 'Min Lin Diecast';

-- 150. Show customers whose phone number includes the area code “212”.
SELECT * FROM customers WHERE phone LIKE '%212%';

-- 151. List product lines whose text description is longer than 100 characters.
SELECT * FROM productlines WHERE LENGTH(textDescription) > 100;

-- 152. Find orders whose comments mention “FedEx”.
SELECT * FROM orders WHERE comments LIKE '%FedEx%';

-- 153. Show customers whose state is stored as NULL.
SELECT * FROM customers WHERE state IS NULL;

-- 154. List products whose product scale is “1:18” or “1:24”.
SELECT * FROM products WHERE productScale IN ('1:18', '1:24');

-- 155. Find product names that have at least two words (contain a space).
SELECT * FROM products WHERE productName LIKE '% %';

-- 156. Rank customers by total payments (use window function RANK()).
SELECT customerNumber, SUM(amount) AS total_paid,
       RANK() OVER (ORDER BY SUM(amount) DESC) AS payment_rank
FROM payments
GROUP BY customerNumber;

-- 157. Calculate running total of payments per customer over time.
SELECT customerNumber, paymentDate, amount,
       SUM(amount) OVER (PARTITION BY customerNumber ORDER BY paymentDate) AS running_total
FROM payments;

-- 158. For each product, show its total sales and the overall average sales per product.
SELECT p.productCode, SUM(od.priceEach * od.quantityOrdered) AS product_sales,
       AVG(SUM(od.priceEach * od.quantityOrdered)) OVER () AS overall_avg_sales
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY p.productCode;

-- 159. Find the top 3 best-selling products in each product line.
WITH ranked AS (
  SELECT p.productLine, p.productCode, p.productName,
         SUM(od.quantityOrdered) AS total_qty,
         ROW_NUMBER() OVER (PARTITION BY p.productLine ORDER BY SUM(od.quantityOrdered) DESC) AS rn
  FROM products p
  JOIN orderdetails od ON p.productCode = od.productCode
  GROUP BY p.productLine, p.productCode
)
SELECT * FROM ranked WHERE rn <= 3;

-- 160. Show the difference between each payment and the previous payment for the same customer.
SELECT customerNumber, paymentDate, amount,
       LAG(amount) OVER (PARTITION BY customerNumber ORDER BY paymentDate) AS prev_amount,
       amount - LAG(amount) OVER (PARTITION BY customerNumber ORDER BY paymentDate) AS diff
FROM payments;

-- 161. Calculate the moving 3-month average of total order amounts.
WITH monthly AS (
  SELECT DATE_FORMAT(orderDate, '%Y-%m') AS month,
         SUM(od.priceEach * od.quantityOrdered) AS total_amount
  FROM orders o
  JOIN orderdetails od ON o.orderNumber = od.orderNumber
  GROUP BY month
)
SELECT month, total_amount,
       AVG(total_amount) OVER (ORDER BY month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg_3m
FROM monthly;

-- 162. Find the product that is the highest seller in each product line by revenue.
WITH ranked AS (
  SELECT p.productLine, p.productCode, p.productName,
         SUM(od.priceEach * od.quantityOrdered) AS revenue,
         ROW_NUMBER() OVER (PARTITION BY p.productLine ORDER BY SUM(od.priceEach * od.quantityOrdered) DESC) AS rn
  FROM products p
  JOIN orderdetails od ON p.productCode = od.productCode
  GROUP BY p.productLine, p.productCode
)
SELECT * FROM ranked WHERE rn = 1;

-- 163. List customers with their total spend and the percentage of total company revenue.
WITH customer_rev AS (
  SELECT c.customerNumber, c.customerName,
         SUM(od.priceEach * od.quantityOrdered) AS customer_spend
  FROM customers c
  JOIN orders o ON c.customerNumber = o.customerNumber
  JOIN orderdetails od ON o.orderNumber = od.orderNumber
  GROUP BY c.customerNumber
),
total_rev AS (
  SELECT SUM(customer_spend) AS total FROM customer_rev
)
SELECT customerName, customer_spend,
       (customer_spend / (SELECT total FROM total_rev)) * 100 AS percentage
FROM customer_rev
ORDER BY customer_spend DESC;

-- 164. For each employee, show the number of customers and rank them within their office.
SELECT e.officeCode, e.employeeNumber, CONCAT(e.firstName, ' ', e.lastName) AS employee_name,
       COUNT(c.customerNumber) AS customer_count,
       RANK() OVER (PARTITION BY e.officeCode ORDER BY COUNT(c.customerNumber) DESC) AS rank_in_office
FROM employees e
LEFT JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
GROUP BY e.employeeNumber;

-- 165. Find orders that are above the 90th percentile in terms of total amount.
WITH order_amounts AS (
  SELECT orderNumber, SUM(priceEach * quantityOrdered) AS order_total
  FROM orderdetails
  GROUP BY orderNumber
),
percentile AS (
  SELECT order_total, PERCENT_RANK() OVER (ORDER BY order_total) AS pr
  FROM order_amounts
)
SELECT * FROM order_amounts WHERE order_total > (SELECT order_total FROM percentile WHERE pr >= 0.9 LIMIT 1);

-- 166. Show the cumulative quantity ordered for each product over order dates.
SELECT p.productCode, o.orderDate, od.quantityOrdered,
       SUM(od.quantityOrdered) OVER (PARTITION BY p.productCode ORDER BY o.orderDate) AS cumulative_qty
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
JOIN orders o ON od.orderNumber = o.orderNumber
ORDER BY p.productCode, o.orderDate;

-- 167. Find the first order date and last order date for each customer.
SELECT customerNumber, MIN(orderDate) AS first_order, MAX(orderDate) AS last_order
FROM orders
GROUP BY customerNumber;

-- 168. Calculate the year-over-year growth of total payments.
WITH yearly AS (
  SELECT YEAR(paymentDate) AS yr, SUM(amount) AS total_paid
  FROM payments
  GROUP BY yr
)
SELECT yr, total_paid,
       LAG(total_paid) OVER (ORDER BY yr) AS prev_year_paid,
       (total_paid - LAG(total_paid) OVER (ORDER BY yr)) / LAG(total_paid) OVER (ORDER BY yr) * 100 AS growth_pct
FROM yearly;

-- 169. For each product line, show the most expensive and cheapest product.
SELECT productLine,
       (SELECT productName FROM products p2 WHERE p2.productLine = p1.productLine ORDER BY MSRP DESC LIMIT 1) AS most_expensive,
       MAX(p1.MSRP) AS max_price,
       (SELECT productName FROM products p2 WHERE p2.productLine = p1.productLine ORDER BY MSRP ASC LIMIT 1) AS cheapest,
       MIN(p1.MSRP) AS min_price
FROM products p1
GROUP BY productLine;

-- 170. List employees who have the same job title as another employee.
SELECT jobTitle, GROUP_CONCAT(employeeNumber) AS employees
FROM employees
GROUP BY jobTitle
HAVING COUNT(*) > 1;

-- 171. Show the median payment amount per customer.
SELECT customerNumber, AVG(amount) AS median_amount
FROM (
  SELECT customerNumber, amount,
         ROW_NUMBER() OVER (PARTITION BY customerNumber ORDER BY amount) AS row_num,
         COUNT(*) OVER (PARTITION BY customerNumber) AS cnt
  FROM payments
) AS t
WHERE row_num IN (FLOOR((cnt+1)/2), CEIL((cnt+1)/2))
GROUP BY customerNumber;

-- 172. Find the top 5 days with the highest number of orders placed.
SELECT orderDate, COUNT(*) AS order_count
FROM orders
GROUP BY orderDate
ORDER BY order_count DESC LIMIT 5;

-- 173. Calculate the percentage of orders that were cancelled per month.
SELECT DATE_FORMAT(orderDate, '%Y-%m') AS month,
       COUNT(*) AS total_orders,
       SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled,
       (SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS cancel_pct
FROM orders
GROUP BY month;

-- 174. For each product, find the order where it was sold in the largest quantity.
WITH ranked AS (
  SELECT productCode, orderNumber, quantityOrdered,
         ROW_NUMBER() OVER (PARTITION BY productCode ORDER BY quantityOrdered DESC) AS rn
  FROM orderdetails
)
SELECT productCode, orderNumber, quantityOrdered
FROM ranked
WHERE rn = 1;

-- 175. Show the total revenue contribution of each product line as a percentage.
WITH line_revenue AS (
  SELECT p.productLine, SUM(od.priceEach * od.quantityOrdered) AS revenue
  FROM products p
  JOIN orderdetails od ON p.productCode = od.productCode
  GROUP BY p.productLine
),
total_revenue AS (
  SELECT SUM(revenue) AS total FROM line_revenue
)
SELECT productLine, revenue,
       (revenue / (SELECT total FROM total_revenue)) * 100 AS percentage
FROM line_revenue;