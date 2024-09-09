-- JOIN

select 
    *
from employees
where department_id=60;


select
    *
from departments 
where department_id = 60;

--   

select 
    emp.first_name,
    emp.last_name,
    dep.department_name
from hr.employees emp inner join hr.departments dep
     on emp.department_id = dep.department_id;
     
     
select 
    first_name,
    last_name,
    department_name
from employees emp inner join departments dep
     on emp.department_id = dep.department_id;
     
     
select 
    first_name,
    last_name,
    department_name,
    department_id
from employees emp inner join departments dep
     on emp.department_id = dep.department_id;   
-- ORA-00918: column ambiguously defined



select 
    first_name,
    last_name,
    department_name,
    emp.department_id
from employees emp inner join departments dep
     on emp.department_id = dep.department_id;  
     
---      
select * from employees;    

select * from jobs;


select 
    e.first_name,
    e.last_name,
    jb.job_title
from employees e inner join jobs jb
            on e.job_id = jb.job_id;


select 
    *
from employees e inner join jobs j
            on e.job_id = j.job_id;
            

select 
    e.*,
    j.job_title
from employees e inner join jobs j
            on e.job_id = j.job_id;

-----

select 
    emp.first_name,
    emp.last_name,
    dep.department_name
from employees emp inner join departments dep
     on emp.department_id = dep.department_id;

-- 106 rows
          
select 
    * 
from employees
where department_id is null;


select 
    emp.first_name,
    emp.last_name,
    dep.department_name
from employees emp left outer join departments dep
     on emp.department_id = dep.department_id;  

-- 107 = 106 +1


select 
    emp.first_name,
    emp.last_name,
    dep.department_name
from employees emp right outer join departments dep
     on emp.department_id = dep.department_id; 

-- 122 = 106 + 16
     

-- 106 + 1 + 16 = 123    

select 
    emp.first_name,
    emp.last_name,
    dep.department_name
from employees emp full outer join departments dep
     on emp.department_id = dep.department_id; -- 123 
     
---

select * from departments;

select * from locations;


select 
    loc.city,
    dep.department_name
from locations loc left outer join departments dep
                on (loc.location_id = dep.location_id);


select 
    loc.city,
    dep.department_name,
    department_id
from locations loc left outer join departments dep
                on (loc.location_id  = dep.location_id)
where dep.location_id is null;

---

select
    emp.first_name,
    emp.last_name,
    dep.department_name,
    loc.city
from employees emp left outer join departments dep
            on emp.department_id = dep.department_id
                   left outer join locations loc
            on dep.location_id = loc.location_id
;


select
    emp.first_name,
    emp.last_name,
    dep.department_name,
    loc.city,
    con.country_name,
    reg.region_name
from employees emp left outer join departments dep
                    on emp.department_id = dep.department_id
                   left outer join locations loc
                    on dep.location_id = loc.location_id
                   left outer join countries con
                    on loc.country_id = con.country_id
                   left outer join regions reg
                    on con.region_id = reg.region_id
;


select
    emp.first_name,
    emp.last_name,
    con.country_name
from employees emp left outer join departments dep
                    on emp.department_id = dep.department_id
                   left outer join locations loc
                    on dep.location_id = loc.location_id
                   left outer join countries con
                    on loc.country_id = con.country_id
;

-- using

select 
    emp.first_name,
    emp.last_name,
    dep.department_name
from employees emp inner join departments dep
        using(department_id);


select 
    emp.first_name,
    emp.last_name,
    dep.department_name,
    department_id
from employees emp inner join departments dep
        using(department_id);


select 
    *
from employees emp inner join departments dep
        using(department_id);
        

select 
    *
from employees emp inner join departments dep
        on(emp.department_id = dep.department_id);        

----

select
    *
from employees e cross join departments d;
-- 107 x 27 = 2889  Rows

----

-- cross join bashqa numune

select
    reg.region_name,
    con.country_name
from  regions reg cross join countries con;
        
----
/*
Joins

Cross
Inner Join
Outer
    Left
    Right
    Full
*/    
--------------------------------------------------

-- self join

select
    employee_id,
    first_name,
    last_name,
    manager_id
from employees
order by employee_id;


select
    emp.employee_id,
    emp.first_name,
    emp.manager_id,
    man.first_name,
    man.employee_id
from employees emp inner join employees man
            on emp.manager_id = man.employee_id;
                    

select
    emp.employee_id,
    emp.first_name || ' ' || emp.last_name as "Emp full name",
    emp.manager_id as "Employee's Manager ID",
    man.first_name || ' ' || man.last_name as "Man full name",
    man.employee_id as "Manager's Employee ID"
from employees emp left outer join employees man
                    on emp.manager_id = man.employee_id;

--------------------------------------------------------------

/*
    inner join        ->> join
    left outer join   ->> left join
    right outer join  ->> right join
    full outer join   ->> full join
*/

-- bura qeder ANSI Syntax

-- burdan sonra Oracle (OLD) Syntax

select 
    emp.first_name,
    emp.last_name,
    dep.department_name
from employees emp inner join departments dep
     on emp.department_id = dep.department_id;
     

select 
    emp.first_name,
    emp.last_name,
    dep.department_name
from employees emp , departments dep
where emp.department_id = dep.department_id;
-- inner


select 
    emp.first_name,
    emp.last_name,
    dep.department_name
from employees emp , departments dep
where emp.department_id = dep.department_id(+);
-- left outer



select 
    emp.first_name,
    emp.last_name,
    dep.department_name
from employees emp , departments dep
where emp.department_id(+) = dep.department_id;
-- right outer

select 
    emp.first_name,
    emp.last_name,
    dep.department_name
from employees emp , departments dep
where emp.department_id(+) = dep.department_id(+);
-- sehv


select
    *
from employees, departments;
-- cross

     
-- ad/mentiq
select 
    emp.first_name,
    emp.last_name,
    dep.department_name
from  employees emp, departments dep
where dep.department_id = emp.department_id(+);


select 
    emp.first_name,
    emp.last_name,
    dep.department_name,
    loc.city
from employees emp , departments dep, locations loc
where emp.department_id = dep.department_id and dep.location_id = loc.location_id;

------------------------

select
    *
from employees cross join employees;


select
    *
from employees e1 cross join employees e2;


select
    e1.employee_id,
    e1.last_name,
    e2.employee_id,
    e2.last_name
from employees e1 cross join employees e2;

-- oz-ozu ile oynayanlarin setirlerini neticeden kenarlashdiraq


select
    e1.employee_id,
    e1.last_name,
    e2.employee_id,
    e2.last_name
from employees e1 cross join employees e2
where e1.employee_id <> e2.employee_id;



select
    e1.employee_id,
    e1.last_name,
    e2.employee_id,
    e2.last_name
from employees e1 inner join employees e2
        on e1.employee_id <> e2.employee_id;


        
select
    e1.employee_id,
    e1.last_name,
    e2.employee_id,
    e2.last_name
from employees e1 cross join employees e2
where  e1.employee_id <> e2.employee_id;

198     199 
199     198 

200     205
205     200


select
    e1.employee_id,
    e1.last_name,
    e2.employee_id,
    e2.last_name
from employees e1 cross join employees e2
where  e1.employee_id < e2.employee_id;


198  <   199    -- T
199  <   198    -- F

200  <  205     -- T
205  <  200     -- F

----------------------------- The End -----------------------