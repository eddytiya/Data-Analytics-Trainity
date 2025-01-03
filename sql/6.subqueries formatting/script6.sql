use companydb;

# Print all employees which are earning more than their department average

select 	
	ssn, fname, salary,dno
from 	
	employee AS outer_table
where salary > (
	SELECT AVG(salary) from employee
		where dno= outer_table.dno
        group by dno
	);
    
    
    create view male_emp_view as (
	select * from employee
    where sex = 'M'
);

select avg(salary) from male_emp_view;

select * from male_emp_view
inner join department
on male_emp_view.dno = department.dnumber;

create view dept_sal_avg as (
	select dno, avg(salary) as avg_sal
	from employee
	group by dno
);

select * from employee
inner join dept_sal_avg
on employee.dno = dept_sal_avg.dno 
where employee.salary > dept_sal_avg.avg_sal;

SELECT * FROM employee
INNER JOIN dept_sal_avg 
ON employee.dno = dept_sal_avg.dno
AND employee.salary > dept_sal_avg.avg_sal;