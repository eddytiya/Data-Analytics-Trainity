use companydb;
select * from employee;
#count function

select count(*) from employee;

#output is corresponding to 7 which means there is a null value
select count(super_ssn) from employee;

select count(*)-count(super_ssn) as Count_null_super_ssn from employee;

select * from employee
where super_ssn is NULL;

#sum
select sum(salary) from employee;


#min and max
select min(salary) as min_salary, max(salary) as max_salary
from employee
where sex = 'M';

select sum(salary)/count(salary) as avg_salary
from employee;
#avg
select max(salary), avg(salary) from employee;

select sex, avg(salary) as avg_salary
from employee
group by sex;

select * from works_on;

select essn, sum(hours)
from works_on
group by essn;

# Calculate avg salary for male employee for each department.

select dno, sex, avg(salary)
from employee where sex = 'M'
group by dno;

# FROM -> WHERE -> GROUP BY -> SELECT -> ORDER BY

select dno, sex, avg(salary) as avg_salary
from employee where sex = 'M'
group by dno
order by avg_salary desc;

#2 grup by
select dno, sex, avg(salary)
from employee
group by dno, sex;

# Print all the unique manager ids
#distinct
select distinct super_ssn from employee;

select distinct sex, super_ssn from employee;

select count(distinct super_ssn) from employee;

# Calculate avg salary of deparmnents with average more than 32000;
select * from employee;

#having caluse
select dno,avg(salary) as salaryCap from employee
group by dno
having salaryCap > 32000;

#DATE FUNCTIONS
select * from employee;

SELECT COUNT(*), 
       EXTRACT(YEAR FROM bdate) AS year_of_birth,
       EXTRACT(MONTH FROM bdate) AS month_of_birth
FROM employee
GROUP BY year_of_birth, month_of_birth
LIMIT 0, 1000;

#case stmts
select avg(salary) from employee;

select ssn, salary,
	case
		when salary < 35125
			then "Less"
		when salary = 35125
			then "Equal"
		else "More"
	end as pay_scale
from employee;


# Extras
select * from employee;


select extract(year from bdate) as _year, extract(month from bdate) as _month
from employee
order by _year, _month;