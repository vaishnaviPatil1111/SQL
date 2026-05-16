-- "Hotel Management System"
USE HotelSalesDB;

SELECT * FROM BOOKINGS;
SELECT * FROM customers;
SELECT * FROM payments;
SELECT * FROM rooms;
SELECT * FROM STAFF;

-- Question - 1] The accounts team wants to check payments made via UPI to measure digital adoption.
Select * From payments where PaymentMethod='UPI';
 
-- Question - 2] List all unique first names of customers for a duplicate check.
Select Distinct FirstName From customers order by FirstName;
 
-- Question - 3] Delete all rooms with Capacity = 1.
Delete from rooms where capacity=1;

-- Question - 4] Display each customer’s name and phone number together using CONCAT.
Select concat(FirstName,' ',LastName,' ',Phone ) AS Customer_Details from customers;

-- Question - 5] The booking office wants to see bookings where RoomID = 10 to check utilization of a specific room.
Select * from bookings where RoomID=10;

-- Question - 6] Identify rooms whose Capacity is greater than the average Capacity of all rooms (Rooms subquery)
SELECT * FROM Rooms where capacity > (SELECT avg(capacity) FROM Rooms);

-- Question - 7] Create a VIEW StaffContact showing Staff FirstName, LastName, Role, and Phone.
Create VIEW StaffContact as
select FirstName, LastName, Role,Phone from Staff;

Select * From StaffContact;

-- Question - 8] The receptionist wants to offer Suite rooms under ₹7000 to business travelers.
SELECT * FROM rooms where PricePerNight<7000;

-- Question - 9] The admin wants to see email addresses sorted by LastName from the Customers table.
SELECT LastName,Email FROM customers order by LastName DESC;

-- Question - 10] Show staff full names combined into one column.
SELECT concat(FirstName,' ',LastName) as Staff_Name FROM STAFF;

-- Question - 11] Display all payment details in one line using CONCAT_WS.
SELECT concat_ws(' | ', cast(PaymentID as char),PaymentDate,concat(' $ ',cast(Amount as char)),PaymentMethod) as Formatted_Payment_Method 
FROM payments;

-- SELECT concat_ws(' | ',cast(StaffID as char),FirstName,LastName,Role, concat(' $ ',cast(Phone as char)),Email) as Formatted_Staff_Details
-- From Staff;

-- Question - 12] The hotel wants to display the 2 most expensive rooms for VIP guests.
SELECT * FROM rooms order by PricePerNight limit 2;

-- Question - 13] Show each BookingID with its CheckIn and CheckOut dates combined.
Select BookingID,concat(CheckInDate,' ' ,CheckOutDate) as dates_combined from Bookings group by BookingID;

-- Question - 14] Finance wants to calculate the average Amount per PaymentMethod.
Select PaymentMethod,avg(Amount) from Payments group by PaymentMethod;

-- Question - 15] The analytics team wants to find the city where average CustomerID is greater than 50.
SELECT city,avg(CustomerID) FROM customers group by city having avg(CustomerID) > 50 ;

-- Question - 16] Find bookings where TotalAmount exceeds the average TotalAmount. (Bookings subquery)
SELECT * FROM BOOKINGS where TotalAmount > (SELECT avg(TotalAmount) FROM BOOKINGS) ;

-- Question - 17] Display the last 2 added rooms from the Rooms table.
SELECT * FROM rooms order by RoomID DESC limit 2;

-- Question - 18] The cashier wants a report of payments where Amount < ₹1500 for small transactions.
SELECT * FROM payments where Amount < 1500;

-- Question - 19] Management wants to list all customers who have made more than 5 bookings.
SELECT c.CustomerID,c.FirstName,c.LastName,count(b.BookingID)  as total_Bookings
from customers c
join Bookings b on c.CustomerID=b.CustomerID
group by c.CustomerID,c.FirstName,c.LastName
having count(b.BookingID) > 5;

-- Question - 20] Identify customers who live in the same city. (Customers self join)
SELECT  a.FirstName,a.LastName,b.FirstName,b.LastName, a.city
FROM customers a 
join customers b on a.city=b.city
where a.CustomerID < b.CustomerID
order by a.city;
-- OR----------------OR----------------OR----------------OR--------------OR----------
SELECT * FROM customers
WHERE city IN (SELECT city FROM customers GROUP BY city HAVING COUNT(customerid) > 1)
ORDER BY city;

-- Question - 21] Show the total revenue handled by each StaffID.
SELECT s.StaffID,s.FirstName,s.LastName,sum(b.TotalAmount) as Total_Revenue FROM STAFF s
join Bookings b on s.StaffID=b.StaffID
group by s.StaffID,s.FirstName,s.LastName;

-- Question - 22] The manager wants to see all customers from Mumbai to check city-wise marketing campaigns.
SELECT * FROM customers where city='Mumbai';

-- Question - 23] Display the 3 lowest booking amounts.
Select * from bookings order by TotalAmount ASC limit 3;

-- Question - 24] Insert 5 new room records with type, price, and capacity into the Rooms table.
insert into rooms (RoomType,PricePerNight,Capacity) values
('Double',6754,3),
('Single',8932,2),
('Suite',3456,1),
('Delux',6643,3),
('Family',7634,2);

-- Question - 25] Show all unique CustomerIDs from bookings.
SELECT distinct CustomerID FROM BOOKINGS;

-- Question - 26] Create a trigger to automatically delete a payment when its corresponding booking is deleted.
Delimiter //
create trigger Auto_Delete_Payment 
after Delete on BOOKINGS
for each row 
Begin
	delete from payments
    where BookingID=old.BookingID;
End //

-- Question - 27] The marketing team wants to update the FirstName of CustomerID = 30 to 'Rahul'.
update customers 
set 
    FirstName = 'Rahul'
where
    CustomerID = 30;

-- Question - 28] List all bookings ordered by CheckInDate.
SELECT 
    *
FROM
    BOOKINGS
order by CheckInDate;

-- Question - 29] Show all rooms where capacity is greater than 2.
SELECT 
    *
FROM
    rooms
where
    capacity > 2;

-- Question - 30] List staff emails ordered by their roles.
SELECT 
    Email, Role
FROM
    STAFF
order by Role;

-- Question - 31] Display each customer’s full name and city using CONCAT_WS.
SELECT 
    concat_ws(' ', FirstName, LastName) as Full_name, City
FROM
    customers

-- Question - 32] Show the first 4 customers’ full names only.
SELECT concat_ws(' ',FirstName,LastName) as Full_name FROM customers limit 4;

-- Question - 33] Show each staff’s role with their full name.
Select concat_ws(' ',FirstName,LastName) as Full_name, Role from staff;

-- Question - 34] Management wants to find the average StaffID per role.
select role,avg(staffid) from Staff group by role;

-- Question - 35] List all bookings handled by StaffID = 2.
SELECT * FROM BOOKINGS where Staffid=2;

-- Question - 36] Display the first 3 staff alphabetically by their first names.
SELECT FirstName FROM STAFF order by FirstName ASC limit 3;

-- Question - 37] The front desk manager wants to see customers where FirstName = 'Amit' AND City = 'Nagpur' for personal attention.
select * from customers where FirstName = 'Amit' AND City = 'Nagpur';

-- Question - 38] Show all unique payment methods in descending order.
SELECT paymentmethod FROM payments order by paymentmethod DESC;

-- Question - 39] Insert 5 staff members into the Staff table with their role, phone, and email.
insert into Staff (FirstName,LastName,Role,phone,Email) values 
('Aradhya','Garde','Chef',6789564567,'Aradhyagarde@tcs.in'),
('sandhya','Sarde','Chef',6789564567,'Sandhyasarde@pcs.in'),
('Aadhya','Tarde','Chef',6789564567,'aadhyatarde@lcs.in'),
('radha','Parde','Chef',6789564567,'radhaparde@mcs.in'),
('Sita','Marde','Chef',6789564567,'sitamarde@ocs.in');

-- Question - 40] The hotel manager wants to review bookings where CheckInDate is after '2024-01-01' to analyze recent occupancy.
SELECT * FROM BOOKINGS where CheckInDate > '2024-01-01';

-- Question - 41] List all customers whose FirstName is 'Rahul' for a loyalty program.
SELECT * FROM customers where FirstName='Rahul';

-- Question - 42] Show all unique room types offered by the hotel.
SELECT distinct RoomType FROM rooms ;

-- Question - 43] Identify customers who spent more than 50,000 in total.
SELECT c.CustomerID,c.FirstName,c.LastName,c.Phone,c.City,b.TotalAmount FROM customers c
join bookings b on b.CustomerID=c.CustomerID
where b.TotalAmount > 50000;

-- Question - 44] Delete all customers from the city 'TestCity'.
delete from customers where city='TestCity';

-- Question - 45] Find rooms that have the same PricePerNight. (Rooms self join)
SELECT a.RoomID,b.RoomID,a.PricePerNight FROM rooms a
join rooms b on a.PricePerNight=b.PricePerNight 
where a.RoomID < b.RoomID;

-- Question - 46] The manager wants to see staff whose Email ends with '@tcs.in' for corporate tieups.
Select * From Staff where Email like '%@tcs.in';

-- Question - 47] The analytics team wants to list all cities where maximum CustomerID is more than 100.
Select city,max(CustomerID) from customers group by city having max(CustomerID)>100;

-- Question - 48] Show all unique capacities in descending order.
Select distinct capacity from rooms order by capacity DESC;

-- Question - 49] List staff working as Managers.
Select * From Staff where role='Manager';

-- Question - 50] Display each payment’s ID, Method, Amount in one line.
Select concat_ws(' | ',cast(paymentid as char),PaymentMethod,concat_ws(' $ ',cast(Amount as char)))as payment_Details
From payments ;

-- Question - 51] Show the first 4 payments only.
SELECT * FROM payments limit 4;

-- Question - 52] The hotel manager wants to review rooms where PricePerNight is between ₹2000 and ₹4000 to offer discounts.
SELECT * FROM rooms where PricePerNight between  2000 and 4000;

-- Question - 53] List all bookings ordered by CheckInDate.
SELECT * FROM BOOKINGS order by CheckInDate;

-- Question - 54] Display all unique CustomerIDs from bookings
SELECT distinct CustomerID FROM BOOKINGS;

-- Question - 55] The hotel manager wants to add new customer details. Insert 5 records with full details into the Customers table.
insert into customers (FirstName,LastName,Email,Phone,City) values
('Ram','Pall','rampall@gmail.com',6745321289,'Pune'),
('Shyam','Keer','shyamkeer@gmail.com',7898546798,'Hyderabad'),
('Gita','Mann','gitamann@gmail.com',7745321299,'Dalhi'),
('Sita','Nagar','sitanagar@gmail.com',5645321280,'Nagpur'),
('Reem','Shaikh','rimshaikh@gmail.com',6545321256,'Ahmedabad');

-- Question - 56] Show the last 2 staff hired.
Select * from Staff order by staffID DESC limit 2;
 
-- Question - 57] Identify rooms with PricePerNight higher than the maximum PricePerNight of rooms with Capacity = 2. (Rooms subquery)
SELECT RoomID,RoomType,PricePerNight,Capacity FROM rooms 
where PricePerNight > (SELECT max(PricePerNight) FROM rooms where capacity=2);

-- Question - 58] The HR team wants to see staff whose Role is not 'Chef' for role reallocation.
SELECT * FROM STAFF where role != 'Chef';

-- Question - 59] Show all unique cities in descending order from the Customers table.
SELECT distinct city FROM customers order by city DESC;

-- Question - 60] Display the phone number of the Waiter only.
SELECT Phone,Role FROM STAFF where role = 'Waiter';

-- Question - 61] Display the last 2 bookings in the table.
SELECT * FROM BOOKINGS order by BookingID DESC limit 2;

-- Question - 62] The marketing team wants to see customers living in Delhi or Chennai for targeted promotions.
SELECT * FROM customers where city = 'Delhi' or city = 'Chennai';

-- Question - 63] Show all rooms where RoomType != 'Family' to plan renovations.
SELECT * FROM rooms where RoomType != 'Family';

-- Question - 64] List staff emails ordered by their roles.
Select Email,Role from Staff order by Role;

-- Question - 65] Display all unique payment methods.
SELECT distinct PaymentMethod FROM payments;

-- Question - 66] The receptionist wants a list of customers whose Phone starts with '98' for mobile offers.
SELECT * FROM customers where Phone like '98%';

-- Question - 67] Show the 3 cheapest rooms available for budget travelers.
SELECT * FROM rooms order by PricePerNight DESC limit 3;

-- Question - 68] Display the last 2 payments.
SELECT * FROM payments order by PaymentID DESC limit 2;

-- Question - 69] Management wants to know which unique cities customers come from.
SELECT distinct city FROM customers;

-- Question - 70] List all bookings where TotalAmount > 5000.
SELECT * FROM BOOKINGS where TotalAmount > 5000;

-- Question - 71] Display each staff’s Role with their Email in one column.
SELECT concat_ws (' | ',Role,Email) as Staff_Details FROM STAFF;

-- Question - 72] Show the first 4 staff full names.
SELECT concat(FirstName,' ',LastName) as Full_Name FROM STAFF limit 4;

-- Question - 73] Find bookings where TotalAmount is greater than all bookings made by CustomerID = 10. (Bookings subquery)
SELECT * FROM BOOKINGS where TotalAmount > ALL(SELECT TotalAmount FROM BOOKINGS where CustomerID=10);

-- Question - 74] List rooms with capacity >= 3 for family bookings.
Select r.*,r.capacity,r.RoomType FROM Rooms r
join Bookings b on b.RoomID=r.RoomID
where r.capacity >= 3 and r.RoomType='Family';

-- Question - 75] Display the RoomType and Price of only Suite rooms.
SELECT RoomType,PricePerNight FROM rooms where RoomType='Suite' ;

-- Question - 76] The cashier wants to see payments with Amount between ₹2000 and ₹7000 for mid-range billing checks.
SELECT * FROM payments where Amount between 2000 and 7000;

-- Question - 77] Insert 5 booking records into the Bookings table with all details.
INSERT INTO Bookings (CustomerID, RoomID, StaffID, CheckInDate, CheckOutDate, TotalAmount) VALUES
(3, 3, 41, '2024-04-11', '2023-07-15', 7298),
(5, 55, 52, '2025-05-08', '2023-07-11', 48105),
(6, 22, 72, '2025-07-12', '2025-06-17', 85276),
(9, 45, 61, '2022-10-12', '2022-06-19', 28210),
(10, 34, 4, '2023-11-21', '2025-11-25', 20129);

-- Question - 78] Display the 3 lowest payments made by customers.
SELECT * FROM payments order by Amount DESC limit 3;

-- Question - 79] Show each booking’s BookingID with TotalAmount using CONCAT.
SELECT concat(BookingID,' | ',TotalAmount) AS Booking_details FROM BOOKINGS;

-- Question - 80] Show all unique RoomIDs in descending order.
SELECT distinct RoomID FROM rooms order by RoomID DESC;

-- Question - 81] Display each room’s RoomType and Price using CONCAT_WS.
SELECT concat_ws(' | ',RoomType,cast(PricePerNight as char)) as Room_Info FROM rooms ;

-- Question - 82] The admin wants to delete all bookings handled by StaffID = 3.
UPDATE bookings SET StaffID = NULL WHERE StaffID = 3;

-- Question - 83] Show customers whose FirstName length > 5 characters for a name-pattern study.
SELECT length(FirstName) > 5 as Name_Length FROM customers; 

-- Question - 84] Show all unique roles available in the hotel.
Select distinct role from Staff;

-- Question - 85] List all rooms where capacity is greater than 2.
select * From Rooms where capacity > 2;

-- Question - 86] Display each payment’s ID with Amount using CONCAT.
Select concat(paymentid,' ', Amount) as Paymant_Details from payments;

-- Question - 87] List all Card payments from the Payments table.
Select * from payments where paymentMethod = 'card';

-- Question - 88] Delete all customers whose Email ends with '@test.com' as invalid.
delete from customers where email like '%@test.com';

-- Question - 89] The hotel manager wants to review bookings where CheckOutDate before '2023-12-31' to measure old occupancy.
SELECT * FROM BOOKINGS where CheckOutDate < '2023-12-31';

-- Question - 90] The front office manager needs to list rooms with capacity = 2 for couples.
SELECT * FROM rooms where capacity = 2;

-- Question - 91] Show all unique capacities in descending order.
SELECT distinct capacity FROM rooms order by capacity DESC;

-- Question - 92] The operations team wants to find the minimum TotalAmount in bookings.
SELECT min(TotalAmount) FROM BOOKINGS;

-- Question - 93] Display all rooms by capacity in ascending order.
SELECT distinct capacity FROM rooms order by capacity ASC;

-- Question - 94] Show each booking’s BookingID with TotalAmount using CONCAT.
SELECT concat(BookingID,' ',TotalAmount) FROM BOOKINGS;

-- Question - 95] The operations head wants to see rooms with Capacity = 4 AND PricePerNight > ₹6000 for premium family packages.
SELECT * FROM rooms where  Capacity = 4 AND PricePerNight > 6000;

-- Question - 96] Show staff full names combined into one column.
SELECT concat(FirstName,' ',LastName) as Full_Name FROM STAFF;

-- Question - 97] The accounts team wants to see bookings where the TotalAmount is greater than ₹10,000 to track high-value customers.
SELECT * FROM BOOKINGS where TotalAmount > 10000;

-- Question - 98] Show all unique payment methods in descending order.
SELECT distinct PaymentMethod FROM payments order by PaymentMethod DESC ;

-- Question - 99] List staff members who share the same Role. (Staff self join)
SELECT a.StaffID,a.FirstName,b.FirstName,a.Role FROM STAFF a
join STAFF b on b.Role=a.Role
where b.StaffID > a.StaffID;

-- Question - 100] Show customer first name, last name, and TotalAmount of their bookings using JOIN between Customers and Bookings.
SELECT c.FirstName,c.LastName,b.TotalAmount FROM customers c
join bookings b on b.CustomerID=c.CustomerID;

-- Question - 101] Display the first 4 bookings only.
SELECT * FROM BOOKINGS order by bookingid ASC limit 4;

-- Question - 102] Show all unique staff first names
SELECT distinct FirstName FROM STAFF order by FirstName ;

-- Question - 103] Insert 5 new room records with type, price, and capacity into the Rooms table.
insert into rooms (RoomType,PricePerNight,Capacity) values 
('Double',4577,4),
('Suite',8669,3),
('Delux',9315,2),
('Single',2754,1),
('Family',5357,4);

-- Question - 104] Display each customer’s full name and city using CONCAT_WS.
Select CONCAT_WS(' ',FirstName,LastName) as FullName,city from customers;

-- Question - 105] Show all unique cities in descending order from the Customers table.
SELECT distinct city FROM customers order by city DESC;

-- Question - 106] The analytics team wants to list all cities where maximum CustomerID is more than 100.
SELECT max(CustomerID) as Max_CustomerID,city FROM customers group by city having Max_CustomerID > 100;

-- Question - 107] The HR team wants to see staff whose FirstName is 'Priya' for employee recognition.
SELECT * FROM STAFF where FirstName='Priya';

-- Question - 108] Display the last 2 staff members from the Staff table.
SELECT * FROM STAFF order by StaffID DESC limit 2;

-- Question - 109] Create a VIEW BookingSummary showing BookingID, CustomerID, RoomID, and TotalAmount.
Create  VIEW BookingSummary as
Select BookingID, CustomerID, RoomID, TotalAmount from Bookings;

SELECT * FROM BookingSummary;

-- Question - 110] Show all unique RoomIDs in descending order.
SELECT distinct RoomID FROM rooms order by RoomID DESC ;

-- Question - 111] Display each staff’s role with their full name.
SELECT Role,concat(FirstName,' ',LastName) as Full_Name FROM STAFF;

-- Question - 112] The receptionist wants to offer Suite rooms under ₹7000 to business travelers.
SELECT * FROM rooms where RoomType='Suite' AND PricePerNight < 70000;

-- Question - 113] Display the first 3 staff alphabetically by their first names.
SELECT * FROM STAFF order by FirstName ASC limit 3;

-- Question - 114] List all bookings ordered by CheckInDate.
SELECT * FROM BOOKINGS order by CheckInDate;

-- Question - 115] Show all unique StaffIDs from the bookings.
SELECT distinct StaffID FROM BOOKINGS;

-- Question - 116] Display the first 4 customers’ full names only.
SELECT concat(FirstName,' ',LastName) as Full_Name FROM customers order by Full_Name limit 4;

-- Question - 117] Show all unique room types offered by the hotel.
SELECT Distinct roomtype FROM rooms ;

-- Question - 118] Display the phone number of the Waiter only.
SELECT Phone,Role FROM STAFF where Role='Waiter';

-- Question - 119] Show all bookings where TotalAmount > 5000.
SELECT * FROM BOOKINGS where TotalAmount > 5000;

-- Question - 120] The HR team wants to update Role = 'Senior Manager' where StaffID = 12.
update Staff set Role='Senior Manager' where StaffID = 12;

-- Question - 121] List all staff working as Managers.
SELECT * FROM STAFF where Role='Manager';

-- Question - 122] Show the last 2 registered customers for follow-up.
SELECT * FROM customers order by customerid DESC limit 2;

-- Question - 123] Display each booking’s BookingID with TotalAmount using CONCAT.
SELECT concat(BookingID,' ',TotalAmount) AS Booking_Info FROM BOOKINGS;

-- Question - 124] Insert 5 staff members into the Staff table with their role, phone, and email.
insert into Staff (role, phone,email) values 
('Housekeeping',9865203658,'inayalal@tcs.in'),
('Waiter',8152899457,'purvisarraf@arbor.org'),
('Chef',8769525097,'Sureshramesh@arbor.org'),
('Receptionist',8354418265,'Radhakrishnan@outlook.com'),
('Security',8125398337,'RameshShinde@gmail.com');

-- Question - 125] Display the RoomType and Price of only Suite rooms.
Select RoomType,PricePerNight from Rooms where RoomType = 'Suite';

-- Question - 126] The admin wants to delete all payments linked to BookingID = 15.
delete from payments where BookingID = 15;

-- Question - 127] Display all unique capacities in descending order.
SELECT distinct Capacity FROM rooms order by Capacity DESC;

-- Question - 128] Show the first 4 rooms sorted alphabetically by RoomType.
SELECT * FROM rooms order by RoomType limit 4;

-- Question - 129] The cashier wants a report of payments where Amount < ₹1500 for small transactions.
SELECT * FROM payments where Amount < 1500;

-- Question - 130] Show each booking’s BookingID with TotalAmount using CONCAT.
SELECT concat(BookingID,' ',TotalAmount) AS Booking_Info FROM BOOKINGS;

-- Question - 131] Display the last 2 added rooms from the Rooms table.
SELECT * FROM rooms order by Roomid DESC limit 4;

-- Question - 132] List all customers whose FirstName = 'Amit' AND City = 'Nagpur' for personal attention.
SELECT * FROM customers where FirstName = 'Amit' AND City = 'Nagpur';

-- Question - 133] Insert 5 new customer details into the Customers table.
insert into customers (FirstName,LastName,Email,Phone,City) values
('Vaidehi','Parshurami','vaidehiparshurami@gmail.com',6645321289,'Pune'),
('Madhuri','Dixit','madhuridixit@tcs.in',7798546798,'Hyderabad'),
('Kareena','Kapoor','kareenakapoor@yahoo.in',8845321299,'Dalhi'),
('Priti','Zinta','pritizinta@infosys.com',5445321280,'Nagpur'),
('Viky','Kaushal','vikykaushal@gmail.com',6745321256,'Ahmedabad');

-- Question - 134] Show staff full names combined into one column.
SELECT concat(FirstName,' ',LastName) as Full_Name FROM Staff;

-- Question - 135] Show all room details separated by commas using CONCAT_WS.
SELECT CONCAT_WS(' | ',cast(RoomID as char),RoomType,cast(PricePerNight as char),cast(Capacity as char)) as Room_Details FROM rooms ;

-- Question - 136] Display each customer’s name and phone number together using CONCAT.
SELECT concat(FirstName,' ',LastName,' ',Phone)as Customer_Details FROM customers;

-- Question - 137] Display all payment details in one line using CONCAT_WS.
Select concat_ws(' | ',cast(paymentid as char),PaymentMethod,concat_ws(' $ ',cast(Amount as char)))as payment_Details
From payments ;

-- Question - 138] Show the last 2 bookings in the table.
SELECT * FROM BOOKINGS order by BookingID limit 2;

-- Question - 139] List all payments ordered by PaymentDate.
SELECT * FROM payments order by PaymentDate;

-- Question - 140] Show the 2 highest payments received.
SELECT * FROM payments order by Amount DESC limit 2;

-- Question - 141] The marketing team wants to check customers whose FirstName is 'Rahul' for a loyalty program.
SELECT * FROM customers where FirstName='Rahul';

-- Question - 142] Display each PaymentID with its method using CONCAT.
SELECT concat(PaymentID,' ',PaymentMethod) FROM payments ;

-- Question - 143] The operations team wants to list all PaymentMethods used more than 5 times.
SELECT * FROM payments where PaymentMethod > 5;

-- Question - 144] Show the 2 most expensive rooms for VIP guests.
SELECT * FROM rooms order by PricePerNight DESC limit 2;

-- Question - 145] Show each room’s RoomType and Price using CONCAT_WS.
SELECT CONCAT_WS(' ',RoomType,cast(PricePerNight as char)) as Room_Details FROM rooms;

-- Question - 146] Display the first 3 staff alphabetically by their first names.
SELECT * FROM Staff order by firstname ASC limit 3;

-- Question - 147] List all bookings handled by StaffID = 2.
SELECT * FROM BOOKINGS where StaffID = 2;

-- Question - 148] The analytics team wants to find the city where average CustomerID is greater than 50.
SELECT city,avg(CustomerID) as average_CustomerID FROM customers group by city having avg(CustomerID) > 50;

-- Question - 149] The hotel wants to display the 2 most expensive rooms for VIP guests.
SELECT * FROM rooms order by PricePerNight DESC limit 2;

-- Question - 150] Show all unique first names of customers for a duplicate check.
SELECT Distinct FirstName FROM customers ;

-- Question - 151] Show all unique roles in descending order.
SELECT Distinct role FROM Staff ;

-- Question - 152] Identify rooms whose Capacity is greater than the average Capacity of all rooms. (Rooms subquery)
SELECT * FROM rooms where capacity > (select avg(capacity) from rooms);

-- Question - 153] Display all rooms by capacity in ascending order.
SELECT * FROM rooms order by capacity;

-- Question - 154] Display the first 4 payments only.
SELECT * FROM payments limit 4;

-- Question - 155] Show each payment’s ID, Method, Amount in one line.
SELECT CONCAT_WS(' ',cast(PaymentID as char),PaymentMethod,cast(Amount as char)) as Room_Details FROM payments;

-- Question - 156] List all bookings where TotalAmount > 5000.
SELECT * FROM BOOKINGS where TotalAmount > 5000;

-- Question - 157] Find all customers whose CustomerID is greater than the average CustomerID (Customers subquery)
SELECT * FROM customers where CustomerID > (select avg(CustomerID) from customers);

-- Question - 158] The HR manager wants to see staff whose Role is not 'Chef' for role reallocation.
SELECT * FROM STAFF where Role!='Chef';

-- Question - 159] The accounts team wants to check bookings where TotalAmount is greater than ₹10,000.
SELECT * FROM BOOKINGS where TotalAmount > 10000;

-- Question - 160] Display each staff’s role with their full name.
SELECT Role,concat(firstname,' ',lastname) as fullname FROM STAFF;

-- Question - 161] List staff members who share the same Role. (Staff self join)
SELECT a.StaffID,b.StaffID,a.role,b.role FROM STAFF a
join staff b on a.role=b.role
where a.StaffID > b.StaffID;

-- Question - 162] Show Customer Name and Payment Amount by joining Customers, Bookings, and Payments.
SELECT c.FirstName,p.Amount,p.BookingID,p.* FROM customers c
join bookings b on c.CustomerID=b.CustomerID 
join payments p on b.BookingID=p.BookingID;

-- Question - 163] Display all bookings where TotalAmount > 5000.
SELECT * FROM BOOKINGS where TotalAmount > 5000;

-- Question - 164] The front desk wants to see customers whose Phone starts with '98'.
SELECT * FROM customers where phone like '98%';

-- Question - 165] Identify customers who live in the same city. (Customers self join)
SELECT a.CustomerID,a.firstname,b.firstname,a.city FROM customers a
join customers b on a.city=b.city
where a.CustomerID=b.CustomerID;

-- Question - 166] The operations manager wants to check bookings with CheckOutDate before '2023-12-31'.
SELECT * FROM BOOKINGS where CheckOutDate < '2024-01-01';

-- Question - 167] Display all unique StaffID from the bookings.
SELECT distinct StaffID FROM BOOKINGS;

-- Question - 168] Create a VIEW OnlinePayments showing all payments made by PaymentMethod = 'Online'.
Create VIEW OnlinePayments as
SELECT * FROM payments where PaymentMethod = 'Online';
SELECT * FROM OnlinePayments;

-- Question - 169] Display all unique payment methods in descending order.
SELECT distinct PaymentMethod FROM payments order by PaymentMethod DESC;

-- Question - 170] Display each payment’s ID with Amount using CONCAT.
SELECT concat(PaymentID,' ',Amount) as payment_Details FROM payments;

-- Question - 171] Show all unique RoomIDs in descending order.
SELECT distinct RoomID FROM Rooms order by RoomID DESC;

-- Question - 172] The analytics team wants to list all cities where maximum CustomerID is more than 100.
SELECT city,max(CustomerID) as Max_CustomerID FROM customers
group by city having Max_CustomerID > 100;

-- Question - 173] List staff emails ordered by their roles.
SELECT Email,Role FROM Rooms order by Role;

-- Question - 174] Find bookings where TotalAmount exceeds the average TotalAmount (Bookings subquery)
SELECT * FROM Bookings WHERE TotalAmount > (SELECT AVG(TotalAmount) FROM Bookings);

-- Question - 175] Show all rooms where PricePerNight > ₹5000 for premium customer recommendations.
SELECT * FROM rooms where PricePerNight > 5000;

-- Question - 176] Show all unique capacities in descending order.
SELECT distinct Capacity FROM Rooms order by Capacity DESC;

-- Question - 177] Display the first 4 rooms sorted alphabetically by RoomType.
SELECT RoomType FROM Rooms order by RoomType;

-- Question - 178] Show all unique staff first names.
SELECT distinct firstname FROM staff;

-- Question - 179] Identify rooms with PricePerNight higher than the maximum PricePerNight of rooms with Capacity = 2. (Rooms subquery)
SELECT * FROM Rooms WHERE PricePerNight > (SELECT max(PricePerNight) FROM Rooms where capacity=2);

-- Question - 180] Show all unique cities in descending order from the Customers table.
SELECT distinct city FROM customers order by city DESC;

-- Question - 181] List all bookings where TotalAmount > 5000.
SELECT * FROM BOOKINGS where TotalAmount > 5000;

-- Question - 182] Show PaymentID, Customer Name, and BookingID for payments made using 'Credit Card'.
SELECT p.PaymentID,c.FirstName,b.BookingID FROM payments p 
join bookings b on p.BookingID=b.BookingID
join customers c on b.customerid=c.customerid 
where PaymentMethod='Credit Card';

-- Question - 183] Display each booking’s BookingID with TotalAmount using CONCAT.
SELECT concat(BookingID,' ',TotalAmount) FROM Bookings ;

-- Question - 184] Show all bookings handled by StaffID = 2.
SELECT * FROM BOOKINGS where StaffID = 2;

-- Question - 185] Display the last 2 added rooms from the Rooms table.
SELECT distinct RoomID FROM Rooms order by RoomID DESC limit 2;

-- Question - 186] List all rooms where capacity is greater than 2.
SELECT * FROM rooms where capacity > 2;

-- Question - 187] Display the last 2 staff members from the Staff table.
SELECT * FROM STAFF order by StaffID DESC limit 2;

-- Question - 188] Show all unique roles available in the hotel.
SELECT distinct Role FROM staff;

-- Question - 189] Display the last 2 payments.
SELECT * FROM payments order by PaymentID DESC limit 2;

-- Question - 190] The manager wants to see bookings where CustomerID IN (2,4,6,8) to track repeat guests.
SELECT * FROM BOOKINGS where CustomerID IN (2,4,6,8);

-- Question - 191] Show all unique first names of customers for a duplicate check.
SELECT distinct FirstName FROM customers;

-- Question - 192] Display all bookings where TotalAmount > 5000.
SELECT * FROM BOOKINGS where TotalAmount > 5000;

-- Question - 193] The admin wants to delete all payments where Amount < 1000.
delete from payments where Amount < 1000;

-- Question - 194] Display all unique RoomIDs in descending order.
SELECT distinct RoomID FROM rooms order by RoomID DESC;

-- Question - 195] List customers who made more than 5 bookings.
SELECT c.customerid,c.firstname,count(b.bookingid) as Total_Bookings FROM customers c
join bookings b on c.customerid=b.customerid
group by c.customerid,c.firstname
having count(b.bookingid) > 5;

SELECT * FROM BOOKINGS;
SELECT * FROM customers;
SELECT * FROM payments;
SELECT * FROM rooms ;
SELECT * FROM STAFF;

-- Question - 196] Display all rooms by capacity in ascending order.
SELECT * FROM rooms order by capacity;

-- Question - 197] Show each booking’s BookingID with TotalAmount using CONCAT.
SELECT concat(BookingID,' ',TotalAmount) AS Booking_Info FROM BOOKINGS;

-- Question - 198] List all staff working as Managers.
SELECT * FROM STAFF where Role='Manager';

-- Question - 199] Show customers whose FirstName length > 5 characters for a name-pattern study.
select length(FirstName) > 5 as length_Firstname from customers;

-- Question - 200] Display all unique capacities in descending order.
SELECT distinct Capacity FROM rooms order by Capacity DESC;

-- Question - 201] List staff members who share the same Role. (Staff self join)
SELECT a.StaffID,b.StaffID,a.role,b.role FROM STAFF a
join staff b on a.role=b.role
where a.StaffID > b.StaffID;

-- Question - 202] Show PaymentID, Customer Name, and BookingID for payments made using 'Credit Card'.
SELECT p.PaymentID,c.FirstName,b.BookingID FROM payments p 
join bookings b on p.BookingID=b.BookingID
join customers c on b.customerid=c.customerid 
where PaymentMethod='Credit Card';

-- Question - 203] Display the first 4 payments only.
SELECT * FROM payments limit 4;

-- Question - 204] Show each payment’s ID, Method, Amount in one line.
SELECT CONCAT_WS(' ',cast(PaymentID as char),PaymentMethod,cast(Amount as char)) as Room_Details FROM payments;

-- Question - 205] Create a VIEW HighValueBookings showing all bookings with TotalAmount > 20,000.
Create VIEW HighValueBookings as 
select * FROM Bookings where TotalAmount > 20000;

select * FROM HighValueBookings;

-- Question - 206] Create a trigger to automatically delete a payment when its corresponding booking is deleted.
Delimiter //
Create trigger automatically_delete
after delete on bookings 
for each row
Begin
      delete from bookings where BookingID=old.BookingID;
End//

-- Question - 207] Create a trigger to prevent insertion of a booking where CheckOutDate < CheckInDate.
DELIMITER //
CREATE TRIGGER Prevent_Insertion 
BEFORE INSERT ON bookings 
FOR EACH ROW 
BEGIN        
    IF NEW.CheckOutDate < NEW.CheckInDate THEN
        SIGNAL SQLSTATE '45000' -- Forces a database error, which stops the row from being saved [1].
        SET MESSAGE_TEXT = 'CheckOutDate cannot be before CheckInDate.';
    END IF;
END //
DELIMITER ;

-- Question - 208] Create a trigger to automatically update TotalAmount in Bookings when a payment is inserted in Payments.
DELIMITER //
create trigger automatically_update
AFTER UPDATE on Bookings
For Each Row
BEGIN
     update bookings
     set TotalAmount=TotalAmount+new.TotalAmount
     where bookingid=new.bookingid;
END //
DELIMITER ;

