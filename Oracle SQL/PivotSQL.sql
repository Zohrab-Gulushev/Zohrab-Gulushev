------- PIVOT/UNPIVOT --------

-- PIVOT SQL

select
    department_id,
    count(*)
from employees
group by department_id;

select * from 
    (select department_id from employees)
pivot
    (
        count(*)
        for department_id in (10, 20, 30) 
    );

select * from 
    (select department_id from employees)
pivot
    (
        count(*)
        for department_id in (10 as D10, 20 as D20, 30 as D30) 
    );    

------------------------------

select
    substr(first_name, 1, 1) as Herf,
    count(*) as CNT
from employees
where substr(first_name, 1, 1) in ('A', 'S')
group by substr(first_name, 1, 1);



select * from 
    (select
        substr(first_name, 1, 1) as Herf
    from employees)
PIVOT
    (
        count(*)
        for herf in ('A', 'S')
    );

select * from        
    (select
        substr(first_name, 1, 1) as Herf
    from employees)
PIVOT
    (
        count(*)
        for herf in ('A' as A, 'S' as S)
    );
    
    
select * from 
    (select job_id, salary from employees)
PIVOT
    (
        sum(salary)
        for job_id in ('MK_MAN', 'ST_CLERK', 'SH_CLERK')
    );
    
    
select * from 
    (select job_id, salary, department_id from employees
        where job_id in ('MK_MAN', 'ST_CLERK', 'SH_CLERK')
        )
PIVOT
    (
        sum(salary)
        for job_id in ('MK_MAN', 'ST_CLERK', 'SH_CLERK')
    );

select employee_id, first_name, last_name from employees;

select * from    
    (select employee_id, first_name, last_name from employees)
UNPIVOT
    (
        "Value"
        for "Key" in (first_name, last_name)
    );

select employee_id, "Value" from    
    (select employee_id, first_name, last_name from employees)
UNPIVOT
    (
        "Value"
        for "Key" in (first_name, last_name)
    );


select *  from    
    (select to_char(employee_id) as employee_id, first_name, last_name from employees)
UNPIVOT
    (
        "Value"
        for "Key" in (employee_id, first_name, last_name)
    );

    
select "Key", listagg("Value", ', ') within group( order by 1) from    
    (select first_name, last_name, job_id from employees)
UNPIVOT
    (
        "Value"
        for "Key" in (first_name, last_name, job_id)
    )
group by "Key";

----------- The End -----------    
    