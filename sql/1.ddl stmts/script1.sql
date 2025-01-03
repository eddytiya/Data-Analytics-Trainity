create database if not exists tem_db;

use tem_db;

show databases;

drop database tem_db

# create a new table
create table if not exists `students data` (
roll_no bigint primary key,
`name` varchar(20),
age int,
gender char(1),
hobbies varchar(50)
);

show tables;
#truncate an existing table
CREATE DATABASE company_db;
use company_db;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    works_on VARCHAR(255)
);

SELECT *FROM employees;

truncate employees;

SELECT * FROM employees;

# drop table

drop table employees;

# alter table

use tem_db;

# add new column

alter table `students data`
add column hometown varchar(10) 
after age;


alter table `students data`
add column(
emergency_contact varchar(20),
address varchar (30)
);

# change column datatype
alter table `students data`
modify address varchar(50)

# rename a column
alter table `students data`
change column emergency_contact contact varchar(10);

# rename a table
alter table `students data`
rename to student;