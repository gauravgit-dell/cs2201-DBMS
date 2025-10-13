
-- Lab Experiment 05: To implement different types of joins: Inner Join, Outer Join (Left, Right, Full), and Natural Join.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: gaurav
-- USN: 1rua24bca0027
-- SECTION: a
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Write your code below this line along with the output 
create database CUSTOMERS;
use CUSTOMERS;

-- table 01: Customers
-- CREATE  a TABLE named Customers (customer_id INT PRIMARY KEY,customer_name VARCHAR(50),city VARCHAR(50)
create table customers(
customer_id int primary key,
customer_name varchar(50),
city varchar(50));
-- insert 5 records
insert into customers values ('10','sam','bangalore');
insert into customers values ('11','jim','mysore');
insert into customers values ('12','dim','hyderabad');
insert into customers values ('13','lucy','mangalore');
insert into customers values ('14','chen','london');
select *from customers;
-- TABLE:02 Orders Table
create table orders(
ordrer_id int primary key,
customer_id int,
product_name varchar(50),
order_date date,
foreign key (customer_id) references customers(customer_id));
-- CREATE a TABLE named Orders (order_id INT PRIMARY KEY,customer_id INT foreign key,product_name VARCHAR(50),order_date DATE,
    -- insert 5 records
insert into orders values ('101','10','boat','2025-06-12');
insert into orders values ('111','11','rolex','2024-09-18');
insert into orders values ('121','12','patek philippe','2023-02-10');
insert into orders values ('131','13','titan','2022-04-15');
insert into orders values ('141','14','fossil','2025-02-15');
select *from orders;
-- TASK FOR STUDENTS 

 
-- Write and Execute Queries
/*
1. Inner Join – 
   Find all orders placed by customers from the city "Bangalore."*/
SELECT ordrer_id, order_date, customer_name
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
WHERE customers.city = 'Bangalore';

   /*List all customers with the products they ordered.*/
SELECT customer_name, product_name
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id;


/*   Show customer names and their order dates.*/
SELECT customer_name, order_date
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id;
/*
   Display order IDs with the corresponding customer names.*/
   SELECT ordrer_id, customer_name
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id;
/*
   Find the number of orders placed by each customer.*/
   SELECT customer_name, COUNT(ordrer_id) AS order_count
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customer_name;
/*
   Show city names along with the products ordered by customers.
*/
SELECT city, product_name
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id;


/* 
2  Left Outer Join – 
    Find all customers and their orders, even if a customer has no orders.*/
    SELECT customer_name, product_name
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id;
/*
    List all customers and the products they ordered.*/
    SELECT customer_name, product_name
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id;
/*
    Show customer IDs, names, and their order IDs.*/
    SELECT customer_id, customer_name, order_id
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id;
/*
    Find the total number of orders (if any) placed by each customer.*/
    SELECT customer_name, COUNT(ordrer_id) AS order_count
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customer_name;
/*
    Retrieve customers who have not placed any orders.*/
    SELECT customer_name
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id
WHERE ordrer_id IS NULL;
/*
	Display customer names with their order dates.*/
    SELECT ordrer_id, customer_name
FROM orders
RIGHT JOIN customers ON orders.customer_id = customers.customer_id;
/*
-- Write your code below this line along with the output 
*/
 
/* 3: Right Outer Join – 
      Find all orders and their corresponding customers, even if an order doesn't have a customer associated with it.
      Show all orders with the customer names.
      Display product names with the customers who ordered them.
	  List order IDs with customer cities.
      Find the number of orders per customer (include those without orders).
	  Retrieve customers who do not have any matching orders.
     Write your code below this line along with the output 
 */
 SELECT ordrer_id, customer_name
FROM orders
RIGHT JOIN customers ON orders.customer_id = customers.customer_id;
SELECT o.ordrer_id, c.customer_name
FROM orders 
RIGHT JOIN customers c ON o.customer_id = c.customer_id;
SELECT o.product_name, c.customer_name
FROM orders o
RIGHT JOIN customers c ON o.customer_id = c.customer_id;
SELECT o.ordrer_id, c.city
FROM orders o
RIGHT JOIN customers c ON o.customer_id = c.customer_id;
SELECT c.customer_name, COUNT(o.ordrer_id) AS order_count
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;
SELECT c.customer_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.ordrer_id IS NULL;


/* 4: Full Outer Join – 
        Find all customers and their orders, including those customers with no orders and orders without a customer.
        List all customers and products, whether they placed an order or not.
        Show customer IDs with order IDs (include unmatched ones).
		Display customer names with order dates.
		Find all unmatched records (customers without orders and orders without customers).
        Show customer cities with products.
     Write your code below this line along with the output 
  */   
  SELECT c.customer_id, c.customer_name, o.ordrer_id, o.product_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id

UNION

SELECT c.customer_id, c.customer_name, o.ordrer_id, o.product_name
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;
SELECT c.customer_name, o.product_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id

UNION

SELECT c.customer_name, o.product_name
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;
SELECT c.customer_id, o.ordrer_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id

UNION

SELECT c.customer_id, o.ordrer_id
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;
SELECT c.customer_name, o.order_date
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id

UNION

SELECT c.customer_name, o.order_date
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;
SELECT c.customer_name, o.ordrer_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.ordrer_id IS NULL

UNION

SELECT c.customer_name, o.ordrer_id
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;
SELECT c.city, o.product_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id

UNION

SELECT c.city, o.product_name
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;

  /* 5: Natural Join – 
          Find all orders placed by customers.
          List all customers with the products they ordered using NATURAL JOIN.
          Show customer names along with their order dates using NATURAL JOIN.
          Find all customer cities and the products ordered by those customers using NATURAL JOIN.

     Write your code below this line along with the output 
  */
  SELECT *
FROM orders
NATURAL JOIN customers;
SELECT customer_name, product_name
FROM customers
NATURAL JOIN orders;
SELECT customer_name, order_date
FROM customers
NATURAL JOIN orders;
SELECT city, product_name
FROM customers
NATURAL JOIN orders;


/*  -- END OF THE EXPERIMENT
Lab Experiment 05 (1).sql
Displaying Lab Experiment 05 (1).sql.*/