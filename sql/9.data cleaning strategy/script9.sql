use companydb;

#left()

select * from employee;

select left("HR-001",2) as dept_id;

select left(address,11) as address from employee;

select address,left(address,4) as address from employee;

#right

select right("HR-001",2) as dept_id;

select address,right(address,11) as address from employee;

#substr()

select substr("HR-001",4,3) as dept_id;


select address,substr(address,13,8) as address from employee;
--                    string,start char,length of char



SELECT 
    address,
    SUBSTR(address, 2, 5) AS substring_,
    SUBSTR(address FROM 2 FOR 5) AS sub_2
FROM
    employee;
    
#concat
select fname, lname, concat(fname, " ", lname) as full_name
from employee;


#CAST()
-- convert data type of any 
select cast("1965-01-10" as date);


#postion 

select position('st' in 'string');

select position('houston' in address) as h_post from employee;

#coalesce
-- retuens the first non null value

select coalesce(salary) from employee;

select coalesce(null, null, null);