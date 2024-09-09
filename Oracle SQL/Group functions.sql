-- Group Functions

select
    count(*)
from employees;


select
    count(*)
from employees
where department_id = 90;


select
    department_id, 
    count(*)
from employees
group by department_id;


select
    department_id, 
    sum(salary)
from employees
group by department_id;


select
    department_id, 
    count(*), 
    sum(salary)
from employees
group by department_id;


select
    department_id, 
    count(*), 
    sum(salary), 
    avg(salary)
from employees
group by department_id;


select
    job_id, 
    min(salary), 
    max(salary)
from employees
group by job_id;


select 
    median(employee_id)
from employees;

select 
    median(salary)
from employees;


select 
    employee_id
from employees
order by employee_id;

select 
    salary
from employees
order by salary;


select
    job_id, 
    variance(salary), 
    stddev(salary)
from employees
group by job_id;

-- https://shahinkarimov.com/stddev/


select
    department_id, 
    count(*),
    listagg(last_name,', ') 
        within group(order by last_name asc)
from employees
group by department_id;


select
    department_id, 
    count(*),
    listagg(last_name,chr(10)) 
        within group(order by last_name asc)
from employees
group by department_id;


select
    department_id, 
    count(*),
    listagg(concat(last_name, salary),', ') 
        within group(order by last_name asc)
from employees
group by department_id;

select
    department_id, 
    count(*),
    listagg(salary,', ') 
        within group(order by salary asc)
from employees
group by department_id;

--------------------------------------------

SELECT
    COUNT(*),
    COUNT(employee_id),
    COUNT(manager_id),
    COUNT(commission_pct)
FROM
    employees;


SELECT
    COUNT(*), 
    COUNT(commission_pct) 
FROM
    employees
WHERE commission_pct is null;


SELECT
    COUNT(*) as all_count,
    COUNT(commission_pct)               as values_count,
    COUNT(*) - COUNT(commission_pct)    as nulls_count
FROM
    employees;
    

select
    avg(commission_pct), sum(commission_pct), count(commission_pct)
from employees;

-------------------------------------------

select
    count(*)
from employees
where salary > 6000;


select
    department_id,
    count(*)
from employees
where salary > 6000
group by department_id;


select
    department_id, 
    max(salary)
from employees
group by department_id;


select
    department_id, 
    max(salary)
from employees
where max(salary) < 8000
group by department_id;


select
    department_id, 
    max(salary)
from employees
group by department_id
having max(salary) < 8000;

/*
    select
    from
    where
    group by
    having
    order by
    fetch
*/

select
    department_id,
    count(*)
from employees
group by department_id
having count(*)>= 2;


select
    department_id,
    count(*)
from employees
group by department_id
having count(*)= 1;

-------------------------------------

select
    department_id,
    sum(salary)
from employees;


select
    department_id,
    sum(salary)
from employees
group by department_id;


select
    sum(salary)
from employees
group by department_id;


select
    count(*),
    count(commission_pct),
    count(all commission_pct),
    count(distinct commission_pct)
from employees;
--------------------------------------------------

select
    department_id,
    sum(salary)
from employees
group by department_id;


select
    avg(sum(salary))
from employees
group by department_id;


select
    sum(salary)
from employees;


select
    avg(sum(salary))
from employees;  -- sehvdir

-- ORA-00978: nested group function without GROUP BY


select
    max(avg(sum(salary))) -- sehvdir max 2 level
from employees
group by department_id;
-- ORA-00935: group function is nested too deeply


select
   round(avg(stddev(salary)), 2)
from employees
group by department_id
;

-----------------------------------

select
    department_id,
    manager_id,
    sum(salary)
from employees
group by department_id, manager_id;


select
    department_id,
    manager_id,
    job_id,
    count(*),
    sum(salary)
from employees
group by department_id, manager_id, job_id
order by department_id;

--

select
    first_name,
    count(*)
from employees
group by first_name
order by count(*) desc;


select
    first_name,
    last_name,
    count(*)
from employees
group by first_name, last_name
order by count(*) desc;

----------------

select
    last_name,
    department_id
from employees;


select
    last_name,
    department_id,
    case
        when department_id < 50 then 'S1'
        when department_id = 50 then 'S2'
        else 'S3'
    end as Segment
from employees;



select
    case
        when department_id < 50 then 'S1'
        when department_id = 50 then 'S2'
        else 'S3'
    end as Segment,
    count(*)
from employees
group by    case
                when department_id < 50 then 'S1'
                when department_id = 50 then 'S2'
                else 'S3'
            end
order by Segment;

----------- The End -------------