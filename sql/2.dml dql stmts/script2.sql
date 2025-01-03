create database companydb;

use companydb;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    sex CHAR(1),
    dob DATE,
    hire_date DATE,
    department VARCHAR(50),
    job_title VARCHAR(100),
    salary DECIMAL(10, 2)
);

INSERT INTO employees (employee_id, fname, lname, sex, dob, hire_date, department, job_title, salary)
VALUES
    (1, 'John', 'Doe', 'M', '1990-05-15', '2015-03-20', 'Finance', 'Financial Analyst', 75000.00),
    (2, 'Jane', 'Smith', 'F', '1988-08-10', '2013-07-15', 'IT', 'Software Engineer', 95000.00),
    (3, 'Sam', 'Brown', 'M', '1995-02-25', '2018-11-01', 'HR', 'HR Manager', 65000.00),
    (4, 'Emily', 'Davis', 'F', '1992-06-30', '2016-09-12', 'Marketing', 'Digital Marketing Specialist', 72000.00),
    (5, 'Michael', 'Wilson', 'M', '1985-12-05', '2010-01-25', 'Operations', 'Operations Manager', 85000.00);

ALTER TABLE employees ADD address VARCHAR(255);

UPDATE employees SET address = '123 Main St, New York, NY' WHERE employee_id = 1;
UPDATE employees SET address = '456 Elm St, Los Angeles, CA' WHERE employee_id = 2;
UPDATE employees SET address = '789 Pine St, Chicago, IL' WHERE employee_id = 3;
UPDATE employees SET address = '321 Oak St, Houston, TX' WHERE employee_id = 4;
UPDATE employees SET address = '654 Maple St, Phoenix, AZ' WHERE employee_id = 5;


ALTER TABLE employees ADD plocation VARCHAR(100);

UPDATE employees SET plocation = 'New York' WHERE employee_id = 1;
UPDATE employees SET plocation = 'San Francisco' WHERE employee_id = 2;
UPDATE employees SET plocation = 'London' WHERE employee_id = 3;
UPDATE employees SET plocation = 'Paris' WHERE employee_id = 4;
UPDATE employees SET plocation = 'Tokyo' WHERE employee_id = 5;

#select
select * from employees;

#selecting particular cols
SELECT fname, lname FROM employees;

#using where clause
SELECT fname, lname, sex
FROM employees
WHERE sex = 'M';

#OR
SELECT fname
FROM employees
WHERE fname LIKE 'a%' 
OR fname LIKE 'e%'
OR fname LIKE 'i%';

#adding more columns
ALTER TABLE employees
ADD dno INT;

UPDATE employees SET dno = 101 WHERE employee_id = 1;
UPDATE employees SET dno = 102 WHERE employee_id = 2;
UPDATE employees SET dno = 5 WHERE employee_id = 3;
UPDATE employees SET dno = 104 WHERE employee_id = 4;
UPDATE employees SET dno = 105 WHERE employee_id = 5;


#and operator
SELECT fname, lname, dno, sex
FROM employees
WHERE sex = 'M' AND dno = 5;

#or operator
SELECT fname, lname, dno, sex
FROM employees
WHERE sex = 'M' OR dno = 5;

#increment decrement operator
SELECT *
FROM employees
WHERE salary >= 30000 AND sex <> 'M';


#like operator
SELECT fname, lname
FROM employees
WHERE fname LIKE 'J___';

#like operator for pattern matching
SELECT fname, address
FROM employees
WHERE address LIKE '%Houston%';
    
    #between operator
SELECT fname, salary
FROM employees
WHERE salary BETWEEN 80000 AND 100000;   
    
#OR
SELECT fname, plocation
FROM employees
WHERE plocation = 'New York'
        OR plocation = 'London'
        OR plocation = 'Tokyo';

#IN operator        
SELECT fname, plocation
FROM employees
WHERE plocation IN ('New York' , 'London', 'Tokyo');

#NOT operator
SELECT fname, plocation
FROM employees
WHERE plocation NOT IN ('New York' , 'London', 'Tokyo');


#adding more columns
ALTER TABLE employees
ADD ssn CHAR(11),
ADD super_ssn CHAR(11);

UPDATE employees SET ssn = '123-45-6789' WHERE employee_id = 1;
UPDATE employees SET ssn = '234-56-7890' WHERE employee_id = 2;
UPDATE employees SET ssn = '345-67-8901' WHERE employee_id = 3;
UPDATE employees SET ssn = '456-78-9012' WHERE employee_id = 4;
UPDATE employees SET ssn = '567-89-0123' WHERE employee_id = 5;

UPDATE employees SET super_ssn = NULL WHERE employee_id = 1;
UPDATE employees SET super_ssn = '123-45-6789' WHERE employee_id = 2;
UPDATE employees SET super_ssn = '123-45-6789' WHERE employee_id = 3;
UPDATE employees SET super_ssn = '234-56-7890' WHERE employee_id = 4;
UPDATE employees SET super_ssn = '123-45-6789' WHERE employee_id = 5;



SELECT fname, super_ssn
FROM employees;

SELECT fname, ssn
FROM employees
WHERE super_ssn IS NULL;

SELECT fname, ssn
FROM employees
WHERE super_ssn IS NOT NULL;

#order by
SELECT fname, salary
FROM employees
ORDER BY salary DESC;

SELECT fname, salary
FROM employees
WHERE sex = 'M'
ORDER BY salary DESC;


# update query
SET SQL_SAFE_UPDATES = 0;

UPDATE employees 
SET super_ssn = '333445555'
WHERE super_ssn IS NULL;

SELECT *
FROM employees;

DELETE FROM employees
WHERE
    super_ssn = '333445555'