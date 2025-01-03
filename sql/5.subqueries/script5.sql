use companydb;

select * from employee;
# Print Details of all the Managers from the employee table

select distinct super_ssn from employee
where super_ssn is not null;

-- answer to above question

select ssn,dno,fname from employee
where ssn in (
	select distinct super_ssn from employee
	where super_ssn is not null
);

# Print details of employees who are working on a project(nested subquery)

select * from works_on;

select distinct essn from works_on
where essn is not null;

select ssn,fname,lname from employee
where ssn in (
		select distinct essn from works_on
		where essn is not null
        );
        
# Print max and min avg salaries across all departments(inline subquery)'
select dno,avg(salary) as avg_salary from employee
group by dno;

select min(avg_salary),max(avg_salary)
from(
	select dno,avg(salary) as avg_salary 
    from employee
	group by dno
) as dept_avg;  

# Print all employees who are earning more than the avg salary across all employees
-- (scalar subqueries)

select ssn, fname, salary
from employee
where salary >(
select avg(salary) as avg_salary from employee
);

# Print Name, deparment and total hours that each has worked


select * from employee_hours;