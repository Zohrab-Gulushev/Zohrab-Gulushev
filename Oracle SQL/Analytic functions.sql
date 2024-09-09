-- Analytic Functions

select
    first_name,
    last_name,
    salary,
    row_number() over(order by salary desc) as rn
from employees;

select
    employee_id,
    first_name,
    last_name,
    salary,
    row_number() over(order by salary desc, 
                            employee_id desc) as rn
from employees;


select
    first_name,
    last_name,
    salary,
    rank() over(order by salary desc) as rank
from employees;


select
    first_name,
    last_name,
    salary,
    dense_rank() over(order by salary desc) as drank
from employees;


select
    first_name,
    last_name,
    salary,
    row_number() over(order by salary desc) as rn,
    rank() over(order by salary desc) as rank,
    dense_rank() over(order by salary desc) as drank
from employees;


with
    EMP as
    (select
        first_name,
        last_name,
        salary,
        dense_rank() over(order by salary desc) as drn
    from employees)
Select * from EMP
Where drn = 2;



with 
    EMP as
    (select
        first_name,
        last_name,
        salary,
        dense_rank() over(order by salary desc) as drn
    from employees)
Select * from EMP
Where drn in (3, 9);


    
Select * 
from (select
        first_name,
        last_name,
        salary,
        dense_rank() over(order by salary desc) as drn
    from employees)
Where drn in (3, 9);


with
    EMP as
    (select
        first_name,
        last_name,
        salary,
        dense_rank() over(order by salary desc) as drn
    from employees)
Select * from EMP
Where drn between 3 and 9;


select
    employee_id,
    first_name,
    last_name,
    salary,
    sum(salary) over(order by employee_id asc) as ss
from employees;


--Task: Maashi en chox olan 10 neferin maash cemini tapaq:
with
    EMP as
        (select
            employee_id,
            first_name,
            last_name,
            salary,
            sum(salary) over(order by salary desc, employee_id asc) as sum_salary,
            row_number() over(order by salary desc, employee_id asc) as rn
        from employees)
Select * from EMP
Where rn=10;

--------------

select
    employee_id,
    first_name,
    last_name,
    salary,
    sum(salary) over(order by employee_id asc) - salary as ss
from employees;


select
    department_id,
    sum(salary) 
from employees
group by department_id;


select
    employee_id,
    first_name,
    last_name,
    salary,
    department_id,
    sum(salary) over(partition by department_id) as ss
from employees;


select
    employee_id,
    first_name,
    last_name,
    salary,
    department_id,
    count(*) over(partition by department_id) as cc,
    sum(salary) over(partition by department_id) as ss
from employees;


select
    employee_id,
    first_name,
    last_name,
    salary,
    department_id,
    sum(salary) over(partition by department_id) as ss,
    round(salary/sum(salary) over(partition by department_id)*100, 2) as salary_pct
from employees;


select
    employee_id,
    first_name,
    last_name,
    salary,
    department_id,
    sum(salary) over(),
    round(salary/sum(salary) over()*100, 2) as ss
from employees;


select
    employee_id,
    first_name,
    last_name,
    salary,
    department_id,
    round(avg(salary) over(partition by department_id), 2) as av,
    round(salary - avg(salary) over(partition by department_id), 2) as diff_avg
from employees;


with
    EMP as
    (select
        employee_id,
        first_name,
        last_name,
        salary,
        department_id,
        round(avg(salary) over(partition by department_id), 2) as av,
        round(salary - avg(salary) over(partition by department_id), 2) as diff_avg
    from employees)
Select 
    EMP.*,
     case  
       when diff_avg < 0 then 'Ashagi'
       when diff_avg > 0 then 'Yuxari'
       else 'Normal'
    end as status
From EMP;


Select 
    EMP.*,
     case  
       when diff_avg < 0 then 'Ashagi'
       when diff_avg > 0 then 'Yuxari'
       else 'Normal'
    end as status
From
(select
        employee_id,
        first_name,
        last_name,
        salary,
        department_id,
        round(avg(salary) over(partition by department_id), 2) as av,
        round(salary - avg(salary) over(partition by department_id), 2) as diff_avg
    from employees) EMP;


select
    employee_id,
    first_name,
    last_name,
    salary,
    department_id,
    dense_rank() over(partition by department_id 
                            order by salary desc) as drn
from employees;


select
    employee_id,
    first_name,
    last_name,
    department_id,
    salary,
    min(salary) over (partition by department_id) as min_salary
from employees;


with 
    T as 
        (select
            employee_id,
            first_name,
            last_name,
            department_id,
            salary,
            min(salary) 
                over (partition by department_id) as min_s
        from employees)
Select * From T
Where salary = min_s;


with 
    T as 
        (select
            employee_id,
            first_name,
            last_name,
            department_id,
            salary,
            dense_rank() over (partition by department_id 
                            order by salary asc) as drn
        from employees)
Select * From T
Where drn=1;


select
    employee_id,
    last_name,
    hire_date,
    salary,
    max(salary) over(order by hire_date asc)
from employees
where hire_date between to_date('01.01.2000', 'dd.mm.yyyy') 
                    and to_date('31.12.2006', 'dd.mm.yyyy');


select
    employee_id,
    last_name,
    hire_date,
    to_char(hire_date, 'YYYY') as yy,
    to_char(hire_date, 'MM') as mm,
    salary,
    max(salary) over(partition by 
                        to_char(hire_date, 'YYYY'), 
                        to_char(hire_date, 'MM')) as max_s
from employees;


with
    EMP as
        (select
            employee_id,
            last_name,
            hire_date,
            to_char(hire_date, 'YYYY') as yy,
            to_char(hire_date, 'MM') as mm,
            salary
        from employees)
Select 
    EMP.*, 
    max(salary) over(partition by yy, mm) as max_s
From EMP;

----

------------------------------------------------
with
    T as
    (select 
        city, 
        length(city),
        
        row_number() 
            over(order by length(city) asc, city asc) as min_l,
        
        row_number() 
            over(order by length(city) desc, city asc) as max_l
    
        from locations)    
Select * From T
where min_l = 1 or max_l = 1;


Select * From
        (select 
                city, length(city) as ll,
                row_number() over(order by length(city), city asc) as min_l,
                row_number() over(order by length(city) desc, city asc) as max_l
        from locations) T
where T.min_l = 1 or T.max_l = 1;

-------------------
with
    T as
    (select 
        city, length(city),
        row_number() over(order by length(city), city asc) as min_l,
        row_number() over(order by length(city) desc, city asc) as max_l
    from locations)
Select * From T
where 1 in (min_l, max_l);
----------------------------------------------------------------------------

select
    last_name,
    hire_date,
    salary,
    lag(salary, 1) over(order by hire_date) as prev_s
from employees;



select
    last_name,
    hire_date,
    salary,
    lag(salary, 2) over(order  by hire_date) as prev_s
from employees;


select
    last_name,
    hire_date,
    salary,
    lag(salary, 2, 0) over(order  by hire_date) as prev_s
from employees;


select
    last_name,
    hire_date,
    salary,
    lag(salary, 2, salary) over(order  by hire_date) as prev_s
from employees;


select
    last_name,
    hire_date,
    salary,
    lag(salary) over(order  by hire_date) as prev_s
from employees;


select
    last_name,
    hire_date,
    salary,
    lag(salary, 1, salary) over(order  by hire_date) as prev_s,
    salary - lag(salary, 1, salary) over(order  by hire_date) as diff_s
from employees;


select
    last_name,
    hire_date,
    salary,
    lead(salary, 1) over(order by hire_date) as fwd_s
from employees;


select
    last_name,
    hire_date,
    salary,
    lead(salary, 1, 1) over(order  by hire_date) as fwd_s
from employees;


select
    last_name,
    hire_date,
    lead(last_name, 1, 'not found') over(order by hire_date, employee_id) as fwd_s
from employees;


select
    last_name,
    hire_date,
    lead(last_name, 1, 0) over(order  by hire_date) as fwd_s
from employees;


select
    last_name,
    hire_date,
    salary,
    lead(salary, 1, 'yoxdur') over(order  by hire_date) as fwd_s
from employees;


select
    last_name,
    hire_date,
    salary,
    lag(salary, 1, 'yoxdur') over(order  by hire_date) as fwd_s
from employees;


select count(*) from
(select
    last_name,
    hire_date,
    salary/0,
    lead(salary, 1, 'yoxdur') over(order  by hire_date) as fwd_s
from employees);


select count(fwd_s) from
(select
    last_name,
    hire_date,
    salary,
    lead(salary, 1, 'yoxdur') over(order  by hire_date) as fwd_s
from employees);

-------------------------------------------
with
    T as
    (select
        last_name,
        hire_date,
        salary,
        lag(salary, 1, salary) over(order by hire_date) as prev_s
    from employees)
Select
    avg(abs(salary-prev_s))
From T;


with
    T as
    (select
        last_name,
        hire_date,
        department_id,
        salary,
        lag(salary, 1, salary) over(partition by department_id order by hire_date) as prev_s
    from employees)
Select
    department_id,
    avg(abs(salary-prev_s))
From T
group by department_id;


with
    T1 as
    (select
        last_name,
        hire_date,
        department_id,
        salary,
        lag(salary, 1, salary) over(partition by department_id order  by hire_date) as prev_s
    from employees),
    T2 as (select department_id, abs(salary-prev_s/10*22-360) as diff  from T1)
Select
    department_id,
    avg(diff)
From T2
group by department_id;


---------------------
select
    employee_id,
    last_name,
    department_id,
    salary,
    sum(salary) over(order by employee_id
                    rows between 
                    2 preceding and 3 following) as ss
from employees;



select
    employee_id,
    last_name,
    department_id,
    salary,
    sum(salary) over(partition by department_id 
                        order by employee_id
                    rows between 
                    2 preceding and 3 following) as ss
from employees;


select
    employee_id,
    last_name,
    department_id,
    salary,
    sum(salary) over(partition by department_id 
                        order by employee_id
                    rows between 
                    5 preceding and 2 preceding) as ss
from employees;



select
    employee_id,
    last_name,
    department_id,
    salary,
    sum(salary) over(partition by department_id 
                        order by employee_id
                    rows between 
                    2 following and 4 following) as ss
from employees;


select
    employee_id,
    last_name,
    department_id,
    salary,
    sum(salary) over(partition by department_id 
                        order by employee_id
                    rows between 
                    4 preceding and current row) as ss
from employees;


select
    employee_id,
    last_name,
    department_id,
    salary,
    sum(salary) over(partition by department_id 
                        order by employee_id
                    rows between 
                    current row and 3 following) as ss
from employees;



select
    employee_id,
    last_name,
    department_id,
    first_value(last_name) 
            over(partition by department_id 
                    order by employee_id asc) as fv
from employees;


select
    employee_id,
    last_name,
    department_id,
    commission_pct,
    first_value(commission_pct) 
                over(order by employee_id asc) as fv
from employees;


select
    employee_id,
    last_name,
    department_id,
    commission_pct,
    first_value(commission_pct ignore nulls) 
                    over(order by employee_id) as fv
from employees;


select
    employee_id,
    last_name,
    department_id,
    last_value(last_name) 
            over(partition by department_id 
                    order by employee_id) as fv
from employees;



select
    employee_id,
    last_name,
    department_id,
    last_value(last_name) 
                over(partition by department_id 
                        order by employee_id
                        rows between 
                    current row and unbounded following) as fv
from employees;

--------------------

select
    employee_id,
    last_name,
    commission_pct
from employees
order by salary desc;



select
    employee_id,
    last_name,
    commission_pct,
    last_value(commission_pct ignore nulls) 
                    over (order by salary desc) as lv
from employees
order by salary desc;


select 
    department_id,
    last_name
from employees
order by department_id;


with 
    TLevel as
        (select
            level +9 as depid
        from dual connect by level <=101)

select 
    t.depid,
    e.department_id,
    e.last_name
from TLevel t left outer join Employees e
    on (t.depid = e.department_id)
order by t.depid;


with 
    TLevel as
        (select
            level + 9 as depid
        from dual connect by level <=101),
    FLevel as
           (select 
                t.depid,
                e.department_id,
                e.last_name,
                e.employee_id
            from TLevel t left outer join Employees e
                on (t.depid = e.department_id)
            order by t.depid)
Select
    depid,
    last_value(last_name ignore nulls) 
                    over(order by depid, employee_id) as last_name
From FLevel e;


select
    level 
from dual connect by level <=10;


select
    sysdate - level as dat 
from dual connect by level <=90;


with 
    T as (select 1 from dual 
            union all select 1 from dual
            union all select 1 from dual
            union all select 1 from dual
            )
select row_number() over (order by 1) 
from T cross join T cross join T;

---

select
    lpad('*',level,'*') 
from dual connect by level <=10;


select
    lpad(' ', 10-level, ' ') ||
    '@'||lpad('*',2*level-1,'*') || '@'
from dual connect by level <=10
union all
select 'IIIIIIIIIIIIIIIIIIIIII' from dual;

------------ The End -----------