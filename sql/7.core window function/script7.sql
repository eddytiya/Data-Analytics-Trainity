use companydb;

select dno,avg(salary)as avg_sal from employee
group by dno;

select avg(salary) over() as avg_sal
from employee;

#the above querie can be done with a window func
select
avg(salary) over() as avg_sal,
sum(salary) over() as sum_sal
from employee;

#the above querie can be done with a window func

with dept_avg as (
SELECT 
    dno, AVG(salary) AS avg_sal
FROM
    employee
GROUP BY dno
)
select * from employee
inner join dept_avg
on employee.dno = dept_avg.dno;

#the above query can be done with a window func
select ssn, salary ,dno,
avg(salary) over(partition by dno) as avg_sal 
from employee;




select ssn, salary ,dno,
avg(salary) over(partition by dno) as avg_sal, 
sum(salary) over(partition by sex) as sum_sal
from employee;




select 
	ssn,dno,sex,
    count(*) over(partition by dno,sex) AS total_emp
from employee;

#aggregate window func

select ssn ,salary,
rank() over(order by salary) as sal_rank
from employee;


select ssn ,salary,
rank() over(order by salary desc) as sal_rank
from employee;

select ssn ,salary,
rank() over(order by salary desc) as sal_rank,
rank() over(partition by sex order by salary desc) as sex_sal_rank
from employee;

select ssn ,salary,
dense_rank() over(order by salary desc) as sal_rank
from employee;


select 
	ssn, salary, sex,
    dense_rank() over(partition by sex order by salary) as sal_rank
from
	employee;
    
#row_number()

select
	ssn, salary, sex,
    row_number() over(partition by sex order by salary) as row_num
from employee;