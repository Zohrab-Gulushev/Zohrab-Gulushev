-- Subquery

select
    max(salary)
from employees;

select
    first_name, last_name, salary 
from employees
where salary = 24000;


select
    first_name, last_name, salary 
from employees
where salary = (select
                    max(salary)
                from employees);
                                

select
    first_name, 
    last_name, 
    salary,
    (select max(salary) from employees) as max_salary
from employees;


select
    first_name, 
    last_name, 
    salary,
    (select max(salary) from employees) as maxsalary,
    (select max(salary) from employees) - salary as salary_vs_maxsalary
from employees;


select
    * 
from departments
where department_id IN (select
                            department_id
                        from employees);

--

select
    * 
from departments
where department_id NOT IN (select
                                department_id
                            from employees);


select
    * 
from departments
where department_id NOT IN (select
                                department_id
                            from employees
                            where department_id is not null);



----  exists/not exists (correlated subquery)
select
    * 
from departments dep
where EXISTS (select * from employees emp
                where emp.department_id = dep.department_id);


select
    * 
from departments dep
where NOT EXISTS (select * from employees emp
                    where emp.department_id = dep.department_id);


--- multiple-column

select 
     employee_id, 
     last_name, 
     department_id, 
     manager_id 
from employees
where (department_id, manager_id)
             in 
                 (select department_id, manager_id from departments)
order by employee_id;



-----------------------------------------

select 
    salary
from employees
where last_name = 'Abel';

select
    last_name, 
    salary
from employees
where salary = (select salary from employees
                where last_name = 'Abel');
                

select
    last_name, 
    salary
from employees
where salary = (select salary from employees
                where last_name = 'Abel')
    and last_name <> 'Abel';
    
 
select
    first_name, 
    last_name, 
    salary
from employees
where salary = (select salary from employees
                where last_name = 'King');
                
--ORA-01427: single-row subquery returns more than one row                

     
select
    first_name, 
    last_name, 
    salary
from employees
where salary IN (select salary from employees
                where last_name = 'King');
                

select
    first_name, 
    last_name, 
    salary
from employees
where salary = (select salary from employees
                where last_name = 'King'
                     and first_name = 'Steven');
                     

select
    first_name, 
    last_name, 
    salary
from employees
where salary = (select salary from employees
                where last_name = 'King' and first_name = 'Steven')
    and not (last_name = 'King' and first_name = 'Steven');
------------------------------------------

select
    last_name, 
    salary
from employees
order by salary asc
fetch first 5 rows only;


select
    last_name, 
    salary
from employees
order by salary asc
offset 5 rows fetch next 1 rows only;


select
    last_name, 
    salary
from employees
where rownum <=5
order by salary asc;  -- sehv mentiq



-- inline view
select * from 
            (select
                last_name, salary
            from employees
            order by salary asc)
where rownum <=5;


select * from 
            (select
                last_name, salary
            from employees
            order by salary asc)
where rownum =5;


select * from
    (
     select last_name, salary, rownum as rn from 
        (
         select
            last_name, salary
         from employees
         order by salary asc
        )
    )
where rn = 5;



---- CTE -  Common Table Expression

with
    S1 as  
    (select
        last_name, salary
    from employees
    order by salary asc)
Select * from S1    
where rownum <=5;



with
    S1 as  
    (select
        last_name, salary
    from employees
    order by salary asc),
    S2 as
    (select S1.*, rownum as rn from S1)
Select * from S2    
where rn = 5;

-------------------------------------

select
    first_name, last_name, salary 
from employees
where salary = (select
                    max(salary)
                from employees);
-- Subquery: First, Once               


select
    first_name, last_name, salary, department_id 
from employees e1
where salary = (select
                    max(salary)
                from employees e2
                where e2.department_id = e1.department_id);

-- Correlated Subquery: Main>>Sub>>Main (N times)
                

---
select
    * 
from departments
where department_id 
        IN (select
                department_id
            from employees);


select
    * 
from departments dep
where exists (select * from employees emp
            where emp.department_id = dep.department_id);


select
    * 
from departments dep
where not exists (select * from employees emp
                    where emp.department_id = dep.department_id);

            
select
    * 
from departments dep
where not exists (select 1 from employees emp
                    where emp.department_id = dep.department_id);

---------- The End ----------