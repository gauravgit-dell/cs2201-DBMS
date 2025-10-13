create database StudentMarks;
use StudentMarks;
create table students(
USN varchar(10) primary key,
StudentName varchar(50),
Age int,
Combination varchar(10),
Marks1 int,
Marks2 int,
Marks3 int);
desc students;
insert into students values('0028','Sam','19','Bca','15','12','10');
insert into students values('0027','Danny','19','Bcom','17','20','19');
insert into students values('0038','Tom','20','Bca','5','13','16');
insert into students values('0108','Tam','19','Bcom','17','18','19');
insert into students values('0058','arya','19','Bca','15','12','10');
insert into students values('0098','Ram','18','Btech','15','19','20');
insert into students values('0008','aria','19','Bdes','5','2','20');
insert into students values('0018','Diya','19','Bca','15','16','13');
insert into students values('0078','Sammy','19','Bca','15','12','10');
insert into students values('0048','parth','18','Bcom','17','17','7');
desc students;
select *from students;
alter table students add (Total int, Average int , Result varchar(5));
select * from students;
update students set Total=Marks1+Marks2+Marks3;
update students set Average = (Total/3);
update students set Result="Pass" where Marks1>=8 and Marks2>=8 and Marks3>=8;
update students set Result="Fail" where Marks1<8 or Marks2<8 and Marks3<8;
select * from students;