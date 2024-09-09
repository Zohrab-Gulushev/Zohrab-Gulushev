-- Hierarchical SQL
-- Tree structured SQL

select 
    employee_id,
    last_name,
    manager_id
from employees
order by 1;

select
    last_name as ozu,
    prior last_name as prioru 
from employees
start with manager_id is null
connect by prior employee_id = manager_id;


select
    last_name as ozu,
    prior last_name as prioru,
    level
from employees
start with manager_id is null
connect by prior employee_id = manager_id;



select
    last_name as ozu,
    prior last_name as prioru
from employees
start with last_name ='Zlotkey'
connect by prior employee_id = manager_id;


--  walking top to down
select
    last_name as ozu,
    prior last_name as prioru,
    level
from employees
start with manager_id is null
connect by prior employee_id = manager_id; 
-- prior parent.id  = child.parentid


--  walking bottom to up
select
    last_name as ozu,
    prior last_name as prioru,
    level
from employees
start with last_name = 'Greenberg'
connect by prior manager_id = employee_id; 
-- prior child.parentid = parent.id


select
    lpad(' ', 2*level-2, ' ') ||
    last_name,
    level
from employees
start with manager_id is null
connect by prior employee_id = manager_id;

---

select
    lpad(' ', 2*level-2, ' ') ||
    last_name,
    level
from employees
where last_name != 'Kochhar'
start with manager_id is null
connect by prior employee_id = manager_id;


select
    lpad(' ', 2*level-2, ' ') ||
    last_name,
    level
from employees
start with manager_id is null
connect by prior employee_id = manager_id 
                    and last_name != 'Kochhar';

----------------------

select 
    level
from dual
connect by level<=2;


select 
    level,
    last_name
from employees
connect by level<=2;

select 107*108 from dual;

/*
Level 1 - 107
level 2 - 107*107
Cem - 107 + 107*107 = 107 * (1+107) = 107 * 108
*/
----------------------------------------------