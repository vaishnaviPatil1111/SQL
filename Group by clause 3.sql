use University; 

CREATE TABLE LibraryRecords (
    record_id INT PRIMARY KEY,
    book_title VARCHAR(100),
    author_name VARCHAR(100),
    genre VARCHAR(50),
    publish_year INT,
    price DECIMAL(6,2),
    quantity INT,
    rating DECIMAL(2,1),
    publisher VARCHAR(100),
    language VARCHAR(50)
);



INSERT INTO LibraryRecords VALUES
(1,'Book1','Author1','Fiction',2001,100,5,4.1,'Pub1','English'),
(2,'Book2','Author2','Science',2002,110,6,4.2,'Pub2','Hindi'),
(3,'Book3','Author3','History',2003,120,7,4.3,'Pub3','Marathi'),
(4,'Book4','Author4','Math',2004,130,8,4.4,'Pub1','English'),
(5,'Book5','Author5','Fiction',2005,140,9,4.5,'Pub2','Hindi'),
(6,'Book6','Author6','Science',2006,150,10,3.9,'Pub3','Marathi'),
(7,'Book7','Author7','History',2007,160,4,3.8,'Pub1','English'),
(8,'Book8','Author8','Math',2008,170,3,4.6,'Pub2','Hindi'),
(9,'Book9','Author9','Fiction',2009,180,2,4.7,'Pub3','Marathi'),
(10,'Book10','Author10','Science',2010,190,5,4.8,'Pub1','English'),
(11,'Book11','Author11','History',2011,200,6,4.1,'Pub2','Hindi'),
(12,'Book12','Author12','Math',2012,210,7,4.2,'Pub3','Marathi'),
(13,'Book13','Author13','Fiction',2013,220,8,4.3,'Pub1','English'),
(14,'Book14','Author14','Science',2014,230,9,4.4,'Pub2','Hindi'),
(15,'Book15','Author15','History',2015,240,10,4.5,'Pub3','Marathi'),
(16,'Book16','Author16','Math',2016,250,4,3.7,'Pub1','English'),
(17,'Book17','Author17','Fiction',2017,260,3,3.8,'Pub2','Hindi'),
(18,'Book18','Author18','Science',2018,270,2,3.9,'Pub3','Marathi'),
(19,'Book19','Author19','History',2019,280,5,4.0,'Pub1','English'),
(20,'Book20','Author20','Math',2020,290,6,4.1,'Pub2','Hindi'),
(21,'Book21','Author21','Fiction',2001,300,7,4.2,'Pub3','Marathi'),
(22,'Book22','Author22','Science',2002,310,8,4.3,'Pub1','English'),
(23,'Book23','Author23','History',2003,320,9,4.4,'Pub2','Hindi'),
(24,'Book24','Author24','Math',2004,330,10,4.5,'Pub3','Marathi'),
(25,'Book25','Author25','Fiction',2005,340,4,4.6,'Pub1','English'),
(26,'Book26','Author26','Science',2006,350,3,4.7,'Pub2','Hindi'),
(27,'Book27','Author27','History',2007,360,2,4.8,'Pub3','Marathi'),
(28,'Book28','Author28','Math',2008,370,5,4.0,'Pub1','English'),
(29,'Book29','Author29','Fiction',2009,380,6,4.1,'Pub2','Hindi'),
(30,'Book30','Author30','Science',2010,390,7,4.2,'Pub3','Marathi'),
(31,'Book31','Author31','History',2011,400,8,4.3,'Pub1','English'),
(32,'Book32','Author32','Math',2012,410,9,4.4,'Pub2','Hindi'),
(33,'Book33','Author33','Fiction',2013,420,10,4.5,'Pub3','Marathi'),
(34,'Book34','Author34','Science',2014,430,4,4.6,'Pub1','English'),
(35,'Book35','Author35','History',2015,440,3,4.7,'Pub2','Hindi'),
(36,'Book36','Author36','Math',2016,450,2,4.8,'Pub3','Marathi'),
(37,'Book37','Author37','Fiction',2017,460,5,4.0,'Pub1','English'),
(38,'Book38','Author38','Science',2018,470,6,4.1,'Pub2','Hindi'),
(39,'Book39','Author39','History',2019,480,7,4.2,'Pub3','Marathi'),
(40,'Book40','Author40','Math',2020,490,8,4.3,'Pub1','English'),
(41,'Book41','Author41','Fiction',2001,500,9,4.4,'Pub2','Hindi'),
(42,'Book42','Author42','Science',2002,510,10,4.5,'Pub3','Marathi'),
(43,'Book43','Author43','History',2003,520,4,4.6,'Pub1','English'),
(44,'Book44','Author44','Math',2004,530,3,4.7,'Pub2','Hindi'),
(45,'Book45','Author45','Fiction',2005,540,2,4.8,'Pub3','Marathi'),
(46,'Book46','Author46','Science',2006,550,5,4.0,'Pub1','English'),
(47,'Book47','Author47','History',2007,560,6,4.1,'Pub2','Hindi'),
(48,'Book48','Author48','Math',2008,570,7,4.2,'Pub3','Marathi'),
(49,'Book49','Author49','Fiction',2009,580,8,4.3,'Pub1','English'),
(50,'Book50','Author50','Science',2010,590,9,4.4,'Pub2','Hindi'),
(51,'Book51','Author51','History',2011,600,10,4.5,'Pub3','Marathi'),
(52,'Book52','Author52','Math',2012,610,4,4.6,'Pub1','English'),
(53,'Book53','Author53','Fiction',2013,620,3,4.7,'Pub2','Hindi'),
(54,'Book54','Author54','Science',2014,630,2,4.8,'Pub3','Marathi'),
(55,'Book55','Author55','History',2015,640,5,4.0,'Pub1','English'),
(56,'Book56','Author56','Math',2016,650,6,4.1,'Pub2','Hindi'),
(57,'Book57','Author57','Fiction',2017,660,7,4.2,'Pub3','Marathi'),
(58,'Book58','Author58','Science',2018,670,8,4.3,'Pub1','English'),
(59,'Book59','Author59','History',2019,680,9,4.4,'Pub2','Hindi'),
(60,'Book60','Author60','Math',2020,690,10,4.5,'Pub3','Marathi'),
(61,'Book61','Author61','Fiction',2001,700,4,4.6,'Pub1','English'),
(62,'Book62','Author62','Science',2002,710,3,4.7,'Pub2','Hindi'),
(63,'Book63','Author63','History',2003,720,2,4.8,'Pub3','Marathi'),
(64,'Book64','Author64','Math',2004,730,5,4.0,'Pub1','English'),
(65,'Book65','Author65','Fiction',2005,740,6,4.1,'Pub2','Hindi'),
(66,'Book66','Author66','Science',2006,750,7,4.2,'Pub3','Marathi'),
(67,'Book67','Author67','History',2007,760,8,4.3,'Pub1','English'),
(68,'Book68','Author68','Math',2008,770,9,4.4,'Pub2','Hindi'),
(69,'Book69','Author69','Fiction',2009,780,10,4.5,'Pub3','Marathi'),
(70,'Book70','Author70','Science',2010,790,4,4.6,'Pub1','English'),
(71,'Book71','Author71','History',2011,800,3,4.7,'Pub2','Hindi'),
(72,'Book72','Author72','Math',2012,810,2,4.8,'Pub3','Marathi'),
(73,'Book73','Author73','Fiction',2013,820,5,4.0,'Pub1','English'),
(74,'Book74','Author74','Science',2014,830,6,4.1,'Pub2','Hindi'),
(75,'Book75','Author75','History',2015,840,7,4.2,'Pub3','Marathi'),
(76,'Book76','Author76','Math',2016,850,8,4.3,'Pub1','English'),
(77,'Book77','Author77','Fiction',2017,860,9,4.4,'Pub2','Hindi'),
(78,'Book78','Author78','Science',2018,870,10,4.5,'Pub3','Marathi'),
(79,'Book79','Author79','History',2019,880,4,4.6,'Pub1','English'),
(80,'Book80','Author80','Math',2020,890,3,4.7,'Pub2','Hindi'),
(81,'Book81','Author81','Fiction',2001,900,2,4.8,'Pub3','Marathi'),
(82,'Book82','Author82','Science',2002,910,5,4.0,'Pub1','English'),
(83,'Book83','Author83','History',2003,920,6,4.1,'Pub2','Hindi'),
(84,'Book84','Author84','Math',2004,930,7,4.2,'Pub3','Marathi'),
(85,'Book85','Author85','Fiction',2005,940,8,4.3,'Pub1','English'),
(86,'Book86','Author86','Science',2006,950,9,4.4,'Pub2','Hindi'),
(87,'Book87','Author87','History',2007,960,10,4.5,'Pub3','Marathi'),
(88,'Book88','Author88','Math',2008,970,4,4.6,'Pub1','English'),
(89,'Book89','Author89','Fiction',2009,980,3,4.7,'Pub2','Hindi'),
(90,'Book90','Author90','Science',2010,990,2,4.8,'Pub3','Marathi'),
(91,'Book91','Author91','History',2011,1000,5,4.0,'Pub1','English'),
(92,'Book92','Author92','Math',2012,1010,6,4.1,'Pub2','Hindi'),
(93,'Book93','Author93','Fiction',2013,1020,7,4.2,'Pub3','Marathi'),
(94,'Book94','Author94','Science',2014,1030,8,4.3,'Pub1','English'),
(95,'Book95','Author95','History',2015,1040,9,4.4,'Pub2','Hindi'),
(96,'Book96','Author96','Math',2016,1050,10,4.5,'Pub3','Marathi'),
(97,'Book97','Author97','Fiction',2017,1060,4,4.6,'Pub1','English'),
(98,'Book98','Author98','Science',2018,1070,3,4.7,'Pub2','Hindi'),
(99,'Book99','Author99','History',2019,1080,2,4.8,'Pub3','Marathi'),
(100,'Book100','Author100','Math',2020,1090,5,4.9,'Pub1','English');

SELECT * FROM LibraryRecords;

-- Find total number of records in the table.
SELECT count(*) as TotalRecords  FROM LibraryRecords;

-- Find the average price of all books.
SELECT book_title,avg(price) FROM LibraryRecords group by book_title;

-- Find the maximum price of a book.
SELECT max(price) FROM LibraryRecords;

-- Find the minimum price of a book.
SELECT min(price) FROM LibraryRecords;

-- Find total quantity of all books combined.
SELECT sum(quantity) FROM LibraryRecords;

-- Find all books with price greater than 500.
SELECT * FROM LibraryRecords where price > 500;

-- Find books where quantity is less than 5.
SELECT * FROM LibraryRecords where quantity < 5;

-- Find all Fiction books.
SELECT * FROM LibraryRecords where genre='Fiction';

-- Find books published between 2010 and 2020.
SELECT * FROM LibraryRecords where publish_year between 2010 and 2020;

-- Find books available in English or Hindi language.
SELECT * FROM LibraryRecords where language = 'English' or  language = 'Hindi';

-- Find books where author name starts with 'Author1'.
SELECT * FROM LibraryRecords where author_name like 'Author1%';

-- Count number of books in each genre.
SELECT genre,count(record_id) FROM LibraryRecords group by genre;

SELECT * FROM LibraryRecords;

-- Find average price for each publisher.
SELECT publisher,avg(price) as avg_Price FROM LibraryRecords group by publisher;

-- Find total quantity for each language.
SELECT language,sum(quantity) as total_quantity FROM LibraryRecords group by language;

-- Find maximum price in each genre.
SELECT genre,max(price) as maximum_price FROM LibraryRecords group by genre;

-- Find minimum price in each genre.
SELECT genre,min(price) as minimum_price FROM LibraryRecords group by genre;

-- Find publishers having more than 20 books.
SELECT publisher,count(record_id) as books FROM LibraryRecords group by publisher having books > 20 ;

-- Find genres where average rating is greater than 4.3.
SELECT genre FROM LibraryRecords where rating > 4.3;

-- Find languages where total price of books exceeds 10000.
SELECT language, sum(price) as total_price FROM LibraryRecords group by language having total_price > 10000;

-- Find years having more than 3 books published.
SELECT publish_year,count(record_id) NumbreOfBooksPublished FROM LibraryRecords 
group by publish_year having NumbreOfBooksPublished > 3;

-- Count number of books published each year.
SELECT publish_year,count(record_id) NumbreOfBooksPublished FROM LibraryRecords 
group by publish_year;

-- Find highest rating for each publisher.
SELECT publisher,max(rating) FROM LibraryRecords group by publisher;

SELECT * FROM LibraryRecords;

-- Find lowest rating for each publisher.
SELECT publisher,min(rating) FROM LibraryRecords group by publisher;

-- Find total quantity of books for each genre.
SELECT genre,sum(quantity) as total_quantity FROM LibraryRecords group by genre;

-- Find genres where total quantity exceeds 100.
SELECT genre,sum(quantity) as total_quantity FROM LibraryRecords group by genre having total_quantity > 100;

-- Find average price for each language.
SELECT language,avg(price) as avg_price FROM LibraryRecords group by language;

-- Find languages where average price is greater than 500.
SELECT language,avg(price) as avg_price FROM LibraryRecords group by language having avg_price > 500;

-- Count books in each genre where price is above 300.
SELECT genre,count(record_id) FROM LibraryRecords 
where price > 300 group by genre;

-- Count books per publisher where rating is above 4.5.
SELECT publisher,count(record_id) FROM LibraryRecords 
where rating > 4.5 group by publisher;

-- Count books per language where quantity is at least 5.
SELECT language,count(*) as book_count FROM LibraryRecords 
where quantity >= 5 group by language;
