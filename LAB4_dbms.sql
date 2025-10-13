-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 03: Implementation of different types of SQL functions.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: GAURAV P RAO
-- USN: 1RUA24BCA0027
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command
create database lb004;
use lb004;
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- PreCoded Relational Schema and Instance.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- 1. create a table named Employee with EmpID ,FirstName,LastName Salary BirthDate HireDate 
create table Employee(
EmpID varchar(15) primary key,
FirstName varchar(50),
LastName varchar(25),
salary int,
BirthDate date,
HireDate date);
desc Employee;
drop table Employee;

-- 2. Insert 10 records to employee;
insert into Employee values('0589', 'Raja' ,'kumar','45000' , '1985-06-15','2020-05-07');
insert into Employee values('0089', 'Ram' ,'rao','49000' , '1975-01-1','2020-01-07');
insert into Employee values('0189', 'Ramesh' ,'lal','25000' , '1988-12-05','2023-04-17');
insert into Employee values('0780', 'sanjay' ,'dutt','75000' , '1979-04-10','2018-03-27');
insert into Employee values('0559', 'anil' ,'kapoor','40000' , '1989-03-15','2020-12-17');
insert into Employee values('0586', 'Ranveer' ,'singh','85000' , '1984-12-15','2016-10-15');
insert into Employee values('0509', 'Raj' ,'kumar','95000' , '1982-06-14','2015-09-07');
insert into Employee values('0709', 'king' ,'kaleesha','15000' , '1981-02-15','2024-12-27');
insert into Employee values('0567', 'prince' ,'man','48000' , '1977-06-10','2020-08-07');
insert into Employee values('0056', 'ravan' ,'demon','100000' , '1970-08-15','2015-1-07');
select * from Employee;
-- 3. create a table named Orders with OrderID , OrderDate, totalAmount, EmpID(foreign key)  
create table Orders(
OrderID varchar(15) Primary key,
OrderDate date,
totalAmount int,
EmpID varchar(15),
foreign key (EmpID) references Employee(EmpID));
desc Orders;
-- 4. Insert 10 records to Orders
insert into Orders values('4528','2025-09-15','45200','0056');
insert into Orders values('4128','2025-05-14','4000','0567');
insert into Orders values('4358','2024-10-05','56200','0709');
insert into Orders values('4028','2023-11-25','5200','0509');
insert into Orders values('4558','2022-09-01','5100','0586');
insert into Orders values('4108','2024-05-11','85200','0559');
insert into Orders values('4568','2021-04-15','78000','0780');
insert into Orders values('4520','2020-01-15','40020','0189');
insert into Orders values('4521','2024-10-05','78960','0089');
insert into Orders values('4525','2025-09-11','40200','0589');
select * from Orders;

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Print the Information of the Employee and Order Table. [ Hint: SELECT * FROM TABLENAME ]
-- Write the SQL Query below this line.
/*'4028', '2023-11-25', '5200', '0509'
'4108', '2024-05-11', '85200', '0559'
'4128', '2025-05-14', '4000', '0567'
'4358', '2024-10-05', '56200', '0709'
'4520', '2020-01-15', '40020', '0189'
'4521', '2024-10-05', '78960', '0089'
'4525', '2025-09-11', '40200', '0589'
'4528', '2025-09-15', '45200', '0056'
'4558', '2022-09-01', '5100', '0586'
'4568', '2021-04-15', '78000', '0780'*/




-- Output: 



-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Number Functions Section
-- ------------------------------------------------------------
/* a. Round Salaries: Round employee salaries to nearest integer */
select round(salary) as roundsalary from Employee;

-- Output: 
	
/*	100000
	49000
	25000
	95000
	40000
	48000
	85000
	45000
	15000
	75000 */
/* b. Absolute Values: Show absolute values of salaries */
select abs(salary) as abssalary from Employee;
-- Output: 
/* 	abssalary
	100000
	49000
	25000
	95000
	40000
	48000
	85000
	45000
	15000
	75000 */
/* c. Ceiling Values: Get ceiling values of order amounts */
select ceil(salary) as ceiltotalamounts from Employee;
-- Output: 
/* 	ceiltotalamounts
	100000
	49000
	25000
	95000
	40000
	48000
	85000
	45000
	15000
	75000 */
-- ------------------------------------------------------------
-- Aggregate Functions Section
-- ------------------------------------------------------------
/* a. Count of Employees: Find total number of employees */
select count(*) as totalemployees from Employee;
-- Output: 
/* 	totalemployees
	10 */
/* b. Sum of Salaries: Calculate total salary expense */
select sum(salary) as Totalsalary from Employee;
-- Output: '577000'


/* c. Average Order Amount: Find average order value */
select avg(salary) as averageSalary from Employee;
-- Output: '57700.0000'


/* d. Max/Min Salary: Find highest and lowest salaries */
select min(salary) as MinimumSalary from Employee;
select max(salary) as MaximumSalary from Employee;

-- Output: '15000' '100000'



-- ------------------------------------------------------------
-- Character Functions Section
-- ------------------------------------------------------------
/* a. Case Conversion: Show names in uppercase and lowercase */
select upper(FirstName) as Uppername , lower(LastName) as lowername from Employee;
-- Output: 
/*'RAVAN', 'demon'
'RAM', 'rao'
'RAMESH', 'lal'
'RAJ', 'kumar'
'ANIL', 'kapoor'
'PRINCE', 'man'
'RANVEER', 'singh'
'RAJA', 'kumar'
'KING', 'kaleesha'
'SANJAY', 'dutt'
*/

/* b. Concatenate Names: Create full names */
select concat (FirstName , LastName) as Fullname from Employee;
-- Output: 
/*'ravandemon'
'Ramrao'
'Rameshlal'
'Rajkumar'
'anilkapoor'
'princeman'
'Ranveersingh'
'Rajakumar'
'kingkaleesha'
'sanjaydutt'
*/
/* c. Extract Substring: Get first 3 characters of first names */
select substring(Firstname, 1,3) as threecharacters from Employee;
-- Output: 
/*'rav'
'Ram'
'Ram'
'Raj'
'ani'
'pri'
'Ran'
'Raj'
'kin'
'san'
*/
-- ------------------------------------------------------------
-- Conversion Functions Section
-- ------------------------------------------------------------
/* Convert String to Date: Convert date to text type */
select cast(OrderDate as CHAR) as convertedDAte from Orders;
-- Output: 
/*'2023-11-25'
'2024-05-11'
'2025-05-14'
'2024-10-05'
'2020-01-15'
'2024-10-05'
'2025-09-11'
'2025-09-15'
'2022-09-01'
'2021-04-15'
*/
-- ------------------------------------------------------------
-- Date Functions Section
-- ------------------------------------------------------------
/* a. Current Date/Time: Get current timestamp */
select now() as currentTimestamp;
-- Output: '2025-09-08 12:59:10'


/* b. Extract Year: Get year from order dates */
select OrderID, year(OrderDate) as Orderyear from Orders;
-- Output: 
/*'4028', 2023
'4108', 2024
'4128', 2025
'4358', 2024
'4520', 2020
'4521', 2024
'4525', 2025
'4528', 2025
'4558', 2022
'4568', 2021
*/
/* c. Add Months: Add 3 months to order dates */
select date_add(OrderDate, interval 3 month) as finalDate from Orders;
-- Output:
/*'2024-02-25'
'2024-08-11'
'2025-08-14'
'2025-01-05'
'2020-04-15'
'2025-01-05'
'2025-12-11'
'2025-12-15'
'2022-12-01'
'2021-07-15'
*/
/* d. Days Since Order: Calculate days between order date and now */
select OrderID, datediff(OrderDate, now()) as Daysinceorder from Orders;
-- Output: 
/*'4028', '-653'
'4108', '-485'
'4128', '-117'
'4358', '-338'
'4520', '-2063'
'4521', '-338'
'4525', '3'
'4528', '7'
'4558', '-1103'
'4568', '-1607'
*/

-- END of the Task -- 