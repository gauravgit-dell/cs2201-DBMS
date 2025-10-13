-- Lab Experiment 08: Implementation of Procedure ( insert, update and delete)
-- STUDENT NAME: 
-- USN: 
-- SECTION: 

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
# USER(), Host_Name, MySQL_Version, Current_Date_Time
/*'root@localhost', 'Gaurav', '8.4.6', '2025-10-13 21:28:11'*/

-- Scenario: Employee Management System
-- CREATE AND LOAD THE database DBLab008
-- Write your SQL query below Codespace:
create database db008;
use db008;
-- Task 1: Create the Employee Table
-- Create a table to store information about Employee.
-- Include the following columns:
 --   empid INT PRIMARY KEY,
   -- empname VARCHAR(50),
   -- age INT,
   -- salary DECIMAL(10,2),
   -- designation VARCHAR(30),
   -- address VARCHAR(100),
   -- date_of_join DATE
-- Write your SQL query below Codespace:
CREATE TABLE Employee (
    empid INT PRIMARY KEY,
    empname VARCHAR(50),
    age INT,
    salary DECIMAL(10,2),
    designation VARCHAR(30),
    address VARCHAR(100),
    date_of_join DATE
);
DESC Employee;

-- DESCRIBE THE SCHEMA -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code
/*
# Field, Type, Null, Key, Default, Extra
'empid', 'int', 'NO', 'PRI', NULL, ''
'empname', 'varchar(50)', 'YES', '', NULL, ''
'age', 'int', 'YES', '', NULL, ''
'salary', 'decimal(10,2)', 'YES', '', NULL, ''
'designation', 'varchar(30)', 'YES', '', NULL, ''
'address', 'varchar(100)', 'YES', '', NULL, ''
'date_of_join', 'date', 'YES', '', NULL, ''
*/
-- insert 10 records to the table 
-- Write your SQL query below Codespace:
INSERT INTO Employee VALUES
(101, 'Ravi Kumar', 25, 30000, 'Developer', 'Bangalore', '2020-03-10'),
(102, 'Asha R', 29, 35000, 'Manager', 'Chennai', '2018-07-23'),
(103, 'Kiran P', 41, 28000, 'Clerk', 'Mysore', '2015-02-14'),
(104, 'Sneha L', 22, 25000, 'Intern', 'Hyderabad', '2024-01-05'),
(105, 'Vikram S', 45, 40000, 'Manager', 'Mumbai', '2012-11-18'),
(106, 'Divya N', 38, 31000, 'Clerk', 'Pune', '2017-08-09'),
(107, 'Arun B', 26, 27000, 'Developer', 'Delhi', '2019-04-21'),
(108, 'Meera D', 31, 29000, 'Tester', 'Bangalore', '2021-05-11'),
(109, 'Rahul T', 50, 36000, 'Manager', 'Kolkata', '2010-10-29'),
(110, 'Priya K', 23, 22000, 'Intern', 'Chennai', '2023-09-01');


select * from Employee;
-- COPYPASTE OF THE OUTPUT in CSV Format and terminate with ;
/*
# empid, empname, age, salary, designation, address, date_of_join
'101', 'Ravi Kumar', '25', '30000.00', 'Developer', 'Bangalore', '2020-03-10'
'102', 'Asha R', '29', '35000.00', 'Manager', 'Chennai', '2018-07-23'
'103', 'Kiran P', '41', '28000.00', 'Clerk', 'Mysore', '2015-02-14'
'104', 'Sneha L', '22', '25000.00', 'Intern', 'Hyderabad', '2024-01-05'
'105', 'Vikram S', '45', '40000.00', 'Manager', 'Mumbai', '2012-11-18'
'106', 'Divya N', '38', '31000.00', 'Clerk', 'Pune', '2017-08-09'
'107', 'Arun B', '26', '27000.00', 'Developer', 'Delhi', '2019-04-21'
'108', 'Meera D', '31', '29000.00', 'Tester', 'Bangalore', '2021-05-11'
'109', 'Rahul T', '50', '36000.00', 'Manager', 'Kolkata', '2010-10-29'
'110', 'Priya K', '23', '22000.00', 'Intern', 'Chennai', '2023-09-01'
*/
-- perform the following procedures on the employee database and copy paste the output in the space provided
-- A. Insert Procedure
DELIMITER //
CREATE PROCEDURE InsertEmployee(
    IN pid INT,
    IN pname VARCHAR(50),
    IN page INT,
    IN psalary DECIMAL(10,2),
    IN pdesignation VARCHAR(30),
    IN paddress VARCHAR(100),
    IN pjoin DATE
)
BEGIN
    INSERT INTO Employee VALUES(pid, pname, page, psalary, pdesignation, paddress, pjoin);
END //
DELIMITER ;

-- 1. Write a stored procedure named InsertEmployee to insert a new employee record into the Employee table with all fields as input parameters.
-- 2. Modify the insert procedure to ensure the employee’s age must be between 18 and 60.
      -- If not, display a message: "Invalid age, employee not added."
      DELIMITER //
CREATE PROCEDURE InsertEmployeeCheckAge(
    IN pid INT,
    IN pname VARCHAR(50),
    IN page INT,
    IN psalary DECIMAL(10,2),
    IN pdesignation VARCHAR(30),
    IN paddress VARCHAR(100),
    IN pjoin DATE
)
BEGIN
    IF page BETWEEN 18 AND 60 THEN
        INSERT INTO Employee VALUES(pid, pname, page, psalary, pdesignation, paddress, pjoin);
    ELSE
        SELECT 'Invalid age, employee not added.' AS Message;
    END IF;
END //
DELIMITER ;

-- 3. Create a procedure that inserts a new employee record.
          -- If the salary is not provided, assign a default salary of 20000.
          DELIMITER //
CREATE PROCEDURE InsertEmployeeDefaultSalary(
    IN pid INT,
    IN pname VARCHAR(50),
    IN page INT,
    IN psalary DECIMAL(10,2),
    IN pdesignation VARCHAR(30),
    IN paddress VARCHAR(100),
    IN pjoin DATE
)
BEGIN
    IF psalary IS NULL THEN
        SET psalary = 20000;
    END IF;
    INSERT INTO Employee VALUES(pid, pname, page, psalary, pdesignation, paddress, pjoin);
END //
DELIMITER ;

-- 4. Write a procedure that inserts three new employee records in a single procedure using multiple INSERT statements.
DELIMITER //
CREATE PROCEDURE InsertThreeEmployees()
BEGIN
    INSERT INTO Employee VALUES (201, 'Manoj R', 28, 27000, 'Clerk', 'Pune', '2022-02-18');
    INSERT INTO Employee VALUES (202, 'Anita P', 33, 33000, 'Tester', 'Delhi', '2021-03-11');
    INSERT INTO Employee VALUES (203, 'Suresh B', 24, 25000, 'Intern', 'Mangalore', '2024-04-12');
END //
DELIMITER ;

-- B.  Update Procedure
/*
Update Salary:*/
-- Write a stored procedure named UpdateSalary to update an employee’s salary based on their empid.
DELIMITER //
CREATE PROCEDURE UpdateSalary(IN pid INT, IN newSalary DECIMAL(10,2))
BEGIN
    UPDATE Employee SET salary = newSalary WHERE empid = pid;
END //
DELIMITER ;
/*
Increment Salary by Percentage:*/
-- Create a procedure to increase the salary by 10% for all employees whose designation = 'Manager'.
DELIMITER //
CREATE PROCEDURE IncrementManagerSalary()
BEGIN
    UPDATE Employee SET salary = salary * 1.10 WHERE designation = 'Manager';
END //
DELIMITER ;

/*Update Designation:
Write a procedure to update the designation of an employee by empid.
Example: Promote an employee from 'Clerk' to 'Senior Clerk'.
*/DELIMITER //
CREATE PROCEDURE UpdateDesignation(IN pid INT, IN newDesig VARCHAR(30))
BEGIN
    UPDATE Employee SET designation = newDesig WHERE empid = pid;
END //
DELIMITER ;
/*
Update Address:
Write a procedure to update the address of an employee when empid is given as input.
*/DELIMITER //
CREATE PROCEDURE UpdateAddress(IN pid INT, IN newAddr VARCHAR(100))
BEGIN
    UPDATE Employee SET address = newAddr WHERE empid = pid;
END //
DELIMITER ;
/*
Conditional Update (Age Check):
Create a procedure that updates salary only if the employee’s age > 40; otherwise, print "Not eligible for salary update."

*/DELIMITER //
CREATE PROCEDURE ConditionalSalaryUpdate(IN pid INT, IN incSalary DECIMAL(10,2))
BEGIN
    DECLARE empAge INT;
    SELECT age INTO empAge FROM Employee WHERE empid = pid;
    IF empAge > 40 THEN
        UPDATE Employee SET salary = salary + incSalary WHERE empid = pid;
    ELSE
        SELECT 'Not eligible for salary update.' AS Message;
    END IF;
END //
DELIMITER ;

-- C. Delete Procedure
/*
Delete by empid:
Write a stored procedure named DeleteEmployee to delete an employee record using their empid.

Delete by Designation:
Create a procedure that deletes all employees belonging to a specific designation (e.g., 'Intern').

Delete Based on Salary Range:
Write a procedure to delete employees whose salary is less than ₹15000.

Delete by Joining Year:
Write a procedure to delete employees who joined before the year 2015.
*/
DELIMITER //
CREATE PROCEDURE DeleteEmployee(IN pid INT)
BEGIN
    DELETE FROM Employee WHERE empid = pid;
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE DeleteByDesignation(IN pdesig VARCHAR(30))
BEGIN
    DELETE FROM Employee WHERE designation = pdesig;
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE DeleteBySalaryRange()
BEGIN
    DELETE FROM Employee WHERE salary < 15000;
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE DeleteByJoiningYear()
BEGIN
    DELETE FROM Employee WHERE YEAR(date_of_join) < 2015;
END //
DELIMITER ;
select *from Employee;
-- End of Lab Experiment 
-- Upload the Completed worksheet in the google classroom with file name USN _ LabExperiment01
