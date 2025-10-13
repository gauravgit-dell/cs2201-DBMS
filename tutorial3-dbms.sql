Create database library;
use library;
create table Books (
BookID int PRIMARY KEY,
Title varchar(10),
Author varchar(15),
Price int ,
PublishDate date
);
alter table Books  Modify Title varchar(1000); 
desc Books;
/* 	Field	Type	Null	Key	Default	Extra
	BookID	int	NO	PRI		
	Title	varchar(10)	YES			
	Author	varchar(15)	YES			
	Price	int	YES			
	PublishDate	date	YES			*/

create table Customers (
CustomerID int PRIMARY KEY,
Name varchar(10),
Email varchar(15),
OrderDate date
);
ALTER TABLE Customers RENAME COLUMN OrderDate TO  JoinDate;

desc Customers;
/* 	Field	Type	Null	Key	Default	Extra
	CustomerID	int	NO	PRI		
	Name	varchar(10)	YES			
	Email	varchar(15)	YES			
	OrderDate	date	YES			*/

create table Orders (
OrderID int PRIMARY KEY,
CustomerID int ,
BookID int,
OrderDate date,
Quantity int,
foreign key(CustomerID) references Customers(CustomerID),
foreign key(BookID) references Books(BookID)
);
desc Orders;
/* 	Field	Type	Null	Key	Default	Extra
	OrderID	int	NO	PRI		
	CustomerID	int	YES	MUL		
	BookID	int	YES	MUL		
	OrderDate	date	YES			
	Quantity	int	YES			*/

insert into Customers values ('101', 'Siri','Siri@gmail.com', '2025-09-18');
insert into Customers values('102', 'Arya', 'Arya@gmail.com', '2025-09-20');
insert into Customers values('103', 'Riya', 'Riya@gmail.com', '2025-09-22');
insert into Customers values('104', 'Jay', 'Jay@gmail.com', '2025-09-24');
insert into Customers values('105', 'Aksh', 'Aksh@gmail.com', '2025-09-26');
select*from Customers;
/* 	101	Siri	Siri@gmail.com	2025-09-18
	102	Arya	Arya@gmail.com	2025-09-20
	103	Riya	Riya@gmail.com	2025-09-22
	104	Jay	Jay@gmail.com	2025-09-24
	105	Aksh	Aksh@gmail.com	2025-09-26 */
    
SELECT UPPER(name) AS uppercase_name FROM Customers;
/* 	uppercase_name
	SIRI
	ARYA
	RIYA
	JAY
	AKSH*/
    
insert into Books values('001', 'Rich Dad Poor Dad', 'Robert','199','2023-04-11');
insert into Books values('002','Diary of a Wimpy Kid', 'Jeff Kenny','299','2004-06-23');
insert into Books values('003','The Alchemist', 'Paulo Coelho','399','2019-08-12');
insert into Books values('004','Murder on orient express', 'Agatha Christee','499','2017-12-08');
insert into Books values('005','Atomic Habits', 'James Clear','599','2020-02-15');
select*from Books;
/* 	1	Rich Dad Poor Dad	Robert	199	2023-04-11
	2	Diary of a Wimpy Kid	Jeff Kenny	299	2004-06-23
	3	The Alchemist	Paulo Coelho	399	2019-08-12
	4	Murder on orient express	Agatha Christee	499	2017-12-08
	5	Atomic Habits	James Clear	599	2020-02-15*/
    
insert into Orders values('010','101','001','2025-10-01','3');
insert into Orders values('011','102','002','2025-10-02','4');
insert into Orders values('012','103','003','2025-10-03','5');
insert into Orders values('013','104','004','2025-10-04','6');
insert into Orders values('014','105','005','2025-10-05','7');
select*from Orders;
/* 	10	101	1	2025-10-01	3
	11	102	2	2025-10-02	4
	12	103	3	2025-10-03	5
	13	104	4	2025-10-04	6
	14	105	5	2025-10-05	7 */
SELECT LOWER(name) AS name_lower FROM Customers;
/* 	name_lower
	siri
	arya
	riya
	jay
	aksh */
SELECT SUBSTRING(Title, 1, 3) AS first_three_letters FROM Books;
/* 	first_three_letters
	Ric
	Dia
	The
	Mur
	Ato*/
    
 SELECT Title, LENGTH(Title) AS Title_length FROM Books;
 /*	Title	Title_length
	Rich Dad Poor Dad	17
	Diary of a Wimpy Kid	20
	The Alchemist	13
	Murder on orient express	24
	Atomic Habits	13*/
    
 SELECT REPLACE(Title, 'Book', 'Text') AS updated_Title FROM Books;
 /* 	updated_Title
	Rich Dad Poor Dad
	Diary of a Wimpy Kid
	The Alchemist
	Murder on orient express
	Atomic Habits*/

SELECT CONCAT(Author,Title) AS 'Author and Book' from Books;   
/* 	Author and Book
	RobertRich Dad Poor Dad
	Jeff KennyDiary of a Wimpy Kid
	Paulo CoelhoThe Alchemist
	Agatha ChristeeMurder on orient express
	James ClearAtomic Habits*/
    
 SELECT title FROM books WHERE author LIKE '%a%';
/* 	title
	The Alchemist
	Murder on orient express
	Atomic Habits*/
    
SELECT (title), year(PublishDate) from Books;
/* 	title	year(PublishDate)
	Rich Dad Poor Dad	2023
	Diary of a Wimpy Kid	2004
	The Alchemist	2019
	Murder on orient express	2017
	Atomic Habits	2020*/
    
 SELECT name, MONTHNAME(JoinDate) AS join_month FROM Customers;
 /* 	name	join_month
	Siri	September
	Arya	September
	Riya	September
	Jay	September
	Aksh	September*/
    
SELECT *FROM Customers WHERE YEAR(JoinDate) = 2021;
SELECT OrderId, OrderDate, DAYNAME(OrderDate) AS day_name FROM Orders;
/* 	OrderId	OrderDate	day_name
	10	2025-10-01	Wednesday
	11	2025-10-02	Thursday
	12	2025-10-03	Friday
	13	2025-10-04	Saturday
	14	2025-10-05	Sunday*/
    
 SELECT BookID, PublishDate,TIMESTAMPDIFF(YEAR, PublishDate, CURDATE()) AS Book_age FROM Books;
   /* 	BookID	PublishDate	Book_age
	1	2023-04-11	2
	2	2004-06-23	21
	3	2019-08-12	6
	4	2017-12-08	7
	5	2020-02-15	5*/
    
 SELECT CustomerID, JoinDate,DATEDIFF(CURDATE(), JoinDate) AS days_since_join FROM Customers;
   /* 	CustomerID	JoinDate	days_since_join
	101	2025-09-18	-1
	102	2025-09-20	-3
	103	2025-09-22	-5
	104	2025-09-24	-7
	105	2025-09-26	-9*/
    
SELECT *FROM Orders WHERE MONTH(OrderDate) = 12;
SELECT COUNT(*) AS total_books FROM Books;
/* 5*/
SELECT AVG(Price) AS average_price FROM Books;
/* 	399.0000*/
SELECT MAX(Price) AS max_price,MIN(Price) AS min_price FROM Books;
/*599	199 */
    
		
    
    
  
    
    
    

    
