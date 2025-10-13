-- Lab Experiment 01: Implementation of DDL Commands in SQL for the given scenarios
-- STUDENT NAME: GAURAV P RAO
-- USN: 1RUA24BCA0027
-- SECTION: A

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- Scenario: College Student Management System

-- CREATE AND LOAD THE database
create database DB002;
use DB002;

-- Write your SQL query below Codespace:

-- Task 1: Create the Tables under this system (min 5 tables)
  -- Table 01: Departments ( DepartmentID, DepartmentName, HOD,ContactEmail,PhoneNumber,Location )
  create table Departments(
DepartmentID varchar(10),
DepartmentName varchar(50),
HOD varchar(20),
contactEmail varchar(15),
phoneNumber varchar(10),
Location varchar(50)
);
desc Departments;
  -- Table 02: Course (CourseID, CourseName,Credits,DepartmentID,Duration,Fee )
create table Course(
CourseID varchar(10) PRIMARY KEY,
CourseName varchar(20),
credits int,
DepartmentID varchar(10),
Duration int,
fee float
);

  -- Table 03: Students (StudentID,FirstName,LastName,Email,DateOfBirth,CourseID)
    create table Students(
StudentID varchar(10),
FirstName varchar(50),
LastName varchar(20),
Email varchar(15),
CourseID varchar(10),
FOREIGN KEY (CourseID) references Course(CourseID),
DOB date
);
  -- Table 04: Faculty FacultyID,FacultyName,DepartmentID,Qualification,Email,PhoneNumber)
  create table Faculty(
FacultyID varchar(10),
FacultyName varchar(50),
DepartmentID varchar(10),
Qualification varchar(15),
Email varchar(20),
PhoneNumber varchar(10)
);
  -- Table 05: Enrollments (  EnrollmentID,StudentID,CourseID,Semester,Year,Grade)
      create table Enrollments(
EnrollmentID varchar(10),
StudentID varchar(50),
Semester int,
Year int,
CourseID varchar(10),
FOREIGN KEY (CourseID) references Course(CourseID),
Grade varchar(2)
);
desc Departments;
desc Course;
desc Students;
desc Faculty;
desc Enrollments;

-- Specify the Key (Primary and Foreign) for each table while creating


-- Write your SQL query below Codespace:

-- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
/*'DepartmentID', 'varchar(10)', 'YES', '', NULL, ''
'DepartmentName', 'varchar(50)', 'YES', '', NULL, ''
'HOD', 'varchar(20)', 'YES', '', NULL, ''
'contactEmail', 'varchar(15)', 'YES', '', NULL, ''
'phoneNumber', 'varchar(10)', 'YES', '', NULL, ''
'Location', 'varchar(50)', 'YES', '', NULL, ''

'CourseName', 'varchar(20)', 'YES', '', NULL, ''
'credits', 'int', 'YES', '', NULL, ''
'DepartmentID', 'varchar(10)', 'YES', '', NULL, ''
'Duration', 'int', 'YES', '', NULL, ''
'fee', 'float', 'YES', '', NULL, ''

'FirstName', 'varchar(50)', 'YES', '', NULL, ''
'LastName', 'varchar(20)', 'YES', '', NULL, ''
'Email', 'varchar(15)', 'YES', '', NULL, ''
'CourseID', 'varchar(10)', 'YES', 'MUL', NULL, ''
'DOB', 'date', 'YES', '', NULL, ''

'FacultyID', 'varchar(10)', 'YES', '', NULL, ''
'FacultyName', 'varchar(50)', 'YES', '', NULL, ''
'DepartmentID', 'varchar(10)', 'YES', '', NULL, ''
'Qualification', 'varchar(15)', 'YES', '', NULL, ''
'Email', 'varchar(20)', 'YES', '', NULL, ''
'PhoneNumber', 'varchar(10)', 'YES', '', NULL, ''

'EnrollmentID', 'varchar(10)', 'YES', '', NULL, ''
'StudentID', 'varchar(50)', 'YES', '', NULL, ''
'Semester', 'int', 'YES', '', NULL, ''
'Year', 'int', 'YES', '', NULL, ''
'CourseID', 'varchar(10)', 'YES', 'MUL', NULL, ''
'Grade', 'varchar(2)', 'YES', '', NULL, ''

*/


-- OUTPUT : Disclaimer - This code is not the part of the SQL Code


--  describe the structure of each table and copy paste the Output 

-- Perform the following operations on the each of the tables
-- 01: add 2 new columns for each table
alter table Departments add DepartmentStaffNumber int , add Website varchar(15);
alter table Course add CourseMarks int , add CourseOutcome varchar(50);
alter table Students add PhoneNumber int , add address varchar(100);
alter table Faculty add designation varchar(20) , add Specialization varchar(15);
alter table Enrollments add EnrollmentNumber int , add PhoneNumber varchar(10);



-- 02: Modify the existing column from each table
alter table Departments modify DepartmentID varchar(15);
alter table Course modify CourseID varchar(15);
alter table Students modify LastName varchar(25);
alter table Faculty modify Qualification varchar(25);
alter table Enrollments modify PhoneNumber varchar(11);


-- 03 change the datatypes
alter table Faculty modify FacultyName text;

-- 04: Rename a column
alter table Faculty rename column FacultyName to StaffName;

-- 05: Drop a column
alter table Enrollments drop PhoneNumber;
-- 06: Rename the table
Rename table Enrollments to Registrations;
-- 07: describe the structure of the new table
desc Departments;
desc Course;
desc Students;
desc Faculty;
desc Registrations;

/*  Additional set of questions 
--1 Add a new column Address (VARCHAR(100)) to the Students table.*/
/*done*/

/*--2 Add a column Gender (CHAR(1)) to the Students table.*/
ALTER TABLE Students ADD COLUMN Gender CHAR(1);

/*--3 Add a column JoiningDate (DATE) to the Faculty table.*/
ALTER TABLE Faculty
ADD COLUMN JoiningDate DATE;

/*--4 Modify the column CourseName in the Courses table to increase its size from VARCHAR(50) to VARCHAR(100).*/
ALTER TABLE Courses
MODIFY COLUMN CourseName VARCHAR(100);

/*--5 Modify the column Location in the Departments table to VARCHAR(80).*/
ALTER TABLE Departments
MODIFY COLUMN Location VARCHAR(80);

/*--6 Rename the column Qualification in the Faculty table to Degree.*/
ALTER TABLE Faculty
CHANGE Qualification Degree VARCHAR( 15 );

/*--7 Rename the table Faculty to Teachers.*/
RENAME TABLE Faculty TO Teachers;

/*--8 Drop the column PhoneNumber from the Departments table.*/
ALTER TABLE Departments
DROP COLUMN PhoneNumber;

/*--9 Drop the column Email from the Students table.*/
ALTER TABLE Students
DROP COLUMN Email;

/*--10 Drop the column Duration from the Courses table.*/
ALTER TABLE Courses
DROP COLUMN Duration;

SHOW TABLES; -- Before dropping the table

-- Drop the 'Courses' and 'Enrollments' tables from the database.
Drop table Registrations;
-- Write your SQL query below Codespace:

SHOW TABLES; -- After dropping the table Enrollement and Course

-- Note: Perform the specified operations on all the 5 tables in the system
-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabScenario01

lab1A_Std_Copy(Scenario).sql
Displaying lab1A_Std_Copy(Scenario).sql.
