use companydb;
#more on window func
#aliases
select 
	ssn,
    concat(fname, ' ', lname) as full_name,
	avg(salary) over(partition by dno) as avg_sal
from employee;

# Table Alias

SELECT 
    ssn, salary, employee.dno, avg_sal
FROM
    employee
        INNER JOIN
    (SELECT 
        dno, AVG(salary) AS avg_sal
    FROM
        employee
    GROUP BY dno) AS dept_avg_sal ON employee.dno = dept_avg_sal.dno
        AND employee.salary > dept_avg_sal.avg_sal;
        
        
#lag
select 
ssn,
fname,
salary,
lag(salary,1,0) over(order by salary) as prev_sal
from employee;

select 
dno,
ssn,
fname,
salary,
lag(salary,1,0) over(order by salary) as prev_sal,
lag(salary,1,0) over(partition by dno order by salary) as prev_sal
from employee;

select 
	ssn,
    fname,
    salary - lag(salary, 1) over(order by salary) as diff_sal
from employee;


#lead

select 
	ssn,
    fname,
    salary - lead(salary, 1) over(order by salary desc) as diff_sal
from employee;

#percentiles
select
	ssn,
    salary,
    sex,
    round(percent_rank() over(partition by sex order by salary), 2) as perc_sal
from 
	employee;