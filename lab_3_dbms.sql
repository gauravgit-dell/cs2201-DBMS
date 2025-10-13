-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 02: Program 02 - Implementation of DML Commands in SQL ( INSERT , SELECT, UPDATE and DELETE )
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: gaurav p rao
-- USN: 1RUA24BCA0027
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command


-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Scenario: You are managing a database for a library with two tables: Books and Members.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Task 01: Create Tables [ Check the below mentioned Instructions:
-- Create the Books and Members tables with the specified structure.
-- Books Table and Member Table : 
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task with the Instructed Column in the session 
CREATE DATABASE LIBRARY;
USE LIBRARY;
Create table books(
book_id int PRIMARY KEY,
author_name varchar(20),
book_genre varchar(10),
book_cover varchar(10),
ISBN varchar(10) UNIQUE,
PUBLISHEDYEAR  YEAR);
desc books;

create table members(
members_id int PRIMARY KEY,
member_name varchar(20),
contact int,
email varchar(20) unique);
desc members;

alter table books add column Title varchar(15);
alter table books add column available_copies varchar(5);
alter table books add column total_copies varchar(5);
alter table books drop column book_genre;
alter table books drop column book_cover;
alter table books drop column ISBN;
alter table books modify Title varchar(100);
alter table members drop column contact;
alter table members drop column email;
alter table members add column membership varchar(15);
alter table members add column joining_Date DATE;



desc books;

-- Paste the Output below for the given command ( DESC TableName;) 
/*
'book_id', 'int', 'NO', 'PRI', NULL, ''
'author_name', 'varchar(20)', 'YES', '', NULL, ''
'ISBN', 'varchar(10)', 'YES', 'UNI', NULL, ''
'PUBLISHEDYEAR', 'year', 'YES', '', NULL, ''
'Title', 'varchar(15)', 'YES', '', NULL, ''


'members_id', 'int', 'NO', 'PRI', NULL, ''
'member_name', 'varchar(20)', 'YES', '', NULL, ''
'contact', 'int', 'YES', '', NULL, ''
'email', 'varchar(20)', 'YES', 'UNI', NULL, ''

*/


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 02: Insert a New Book
-- Instructions: Insert a book titled "1984_The Black Swan" by George Orwell (published in 1949) with 04 available copies and 10 Total copies. 
-- Populate other fields as needed.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
desc books;
insert into books values('201','george orwell','1949','1984_The Black Swan','04','10');
select * from books;
alter table books add loc varchar(25);
select *from books;
update books set loc='Bengaluru' ;






-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
/*
'201', 'george orwell', 1949, '1984_The Black Swan', '04', '10'
'201', 'george orwell', 1949, '1984_The Black Swan', '04', '10', 'Bengaluru'

*/

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 03: Add New Members
-- Instructions: Insert two members: David Lee (Platinum, joined 2024-04-15) and Emma Wilson (Silver, joined 2024-05-22).
-- Populate other fields as needed.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
desc members;
insert into members values('2586' , 'David lee' , 'Platinum' , '2024-04-15');
insert into members values('1886' , 'Emma Wilson' , 'Silver' , '2024-05-22');

select * from members;






-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
/*
'1886', 'Emma Wilson', 'Silver', '2024-05-22'
'2586', 'David lee', 'Platinum', '2024-04-15'
*/

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 04: Update Book Details 
-- Instructions: The library acquired 2 additional copies of "1984_The Black Swan". Update the Books table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 05: Modify a Member's Information
-- Instructions: Update a member's membership type. Emma Wilson has upgraded her membership from 'Silver' to 'Gold'.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 06: Remove a Member
-- Instructions: Delete David Lee’s record from the Members table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 09: Borrowing Table 
-- Instructions: Create a Borrowing table with foreign keys referencing Books and Members.
-- Subtask 1: Borrow a Book
-- Scenario:Emma Wilson (member_id = 2) borrows the book "The Catcher in the Rye" (book_id = 102) on 2024-06-01. Insert this record into the Borrowing table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 10: Find the name of Borrower who book = 102 [ Advance and Optional ]
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Final Task 00: ER Diagram - Instructions:
-- Draw an ER diagram for the library database. Additional Upload the scanned copy of the created ER Daigram in the Google Classroom.



-- END of the Task -- 