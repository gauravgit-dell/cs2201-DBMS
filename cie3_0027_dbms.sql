create database rms;
use rms;
create table orders(
orderid int primary key,
ordername varchar(50),
quantity int,
price float);

create table customers(
customerid int primary key,
orderid int,
ordername varchar(50),
customername varchar(50),
customermail varchar(50),
foreign key (orderid) references orders(orderid));

insert into orders values('10','pizza','3','100');
insert into orders values('11','fried rice','5','70');
insert into orders values('12','vadapav','4','40');
select * from orders;

insert into customers values('111','11','fried rice','ram','ram@gmail.com');
insert into customers values('122','10','pizza','tim','tim@gmail.com');
insert into customers values('133','12','pizza','lucy','lucy@gmail.com');
select * from customers;

select  o.ordername, c.customerid,c.customername,c.orderid
from orders o
inner join customers c
on o.orderid = c.orderid;

select o.orderid, c.customerid, c.ordername
from orders o
left join customers c
on o.ordername = c.ordername;

select orderid, count(ordername) as quantity_ordered from orders group by orderid;

select max(quantity) as highest_order_value from orders;

select avg(price) as avg_price from orders;