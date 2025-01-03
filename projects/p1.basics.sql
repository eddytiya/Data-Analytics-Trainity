create database if not exists temp_db;

use temp_db;

show databases;

drop database temp_db

# create a new table
create table if not exists students_data (
roll_no bigint primary key,
name varchar(20),
age int,
gender char(1),
hobbies varchar(50)
);



#truncate an existing table
use mysql;
show tables;
SELECT * FROM db;

truncate db;

SELECT * FROM db;

# drop table

drop table db;

# alter table

use db;

# add new column

alter table student_data
add column hometown varchar(10) 
after age;


alter table students_data
add column(
emergency_contact varchar(20),
address varchar (30)
);

# change column datatype
alter table student_data
modify address varchar(50)

# rename a column
alter table student_data
change column emergency_contact contact varchar(10);

# rename a table
alter table student_data
rename to student;
