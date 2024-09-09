--- View

select
    e.employee_id,
    e.last_name, 
    e.salary,
    d.department_name 
from employees e left outer join departments d 
            on (e.department_id = d.department_id);

drop view v_emp_info;

create view v_emp_info
as
select
    e.employee_id, e.last_name, e.salary, d.department_name 
from employees e left outer join departments d 
                on (e.department_id = d.department_id);

select * from v_emp_info;


select 
    object_name, 
    object_type 
from user_objects
where object_name in ('EMPLOYEES', 'V_EMP_INFO');


select * from all_views
where view_name = 'V_EMP_INFO';


select 
    last_name, salary 
from v_emp_info
where department_name = 'Sales';


create or replace view v_emp_info
as
select
    e.employee_id, 
    e.last_name, 
    e.salary as gross_salary, 
    e.salary - coalesce(e.salary * e.commission_pct, 0) as net_salary,
    d.department_name 
from employees e left outer join departments d 
                on (e.department_id = d.department_id);

select 
    *
from v_emp_info
where department_name = 'Sales';

describe v_emp_info;

create or replace view v_dep
as
select 
    department_id, 
    department_name 
from departments;

select * from v_dep;

insert into v_dep(department_id, department_name)
    values (310, 'New Department');

select * from v_dep;
    
select * from departments;


create or replace view v_dep
as
select 
    department_id, 
    manager_id 
from departments;

select * from v_dep;

insert into v_dep(department_id, manager_id)
    values (320, 100);

select * from v_dep;

describe departments;

select * from user_tab_columns
where table_name = 'DEPARTMENTS'; 


create or replace view v_dep
as
select 
    department_id, 
    department_name 
from departments
where length(department_name)>3;


select * from v_dep;

insert into v_dep(department_id, department_name)
    values (320, 'RD');

select * from v_dep;
select * from departments;
    
rollback;


create or replace view v_dep
as
select 
    department_id, 
    department_name 
from departments
where length(department_name)>3
with check option;

insert into v_dep(department_id, department_name)
    values (320, 'RD');


insert into v_dep(department_id, department_name)
    values (320, 'RISK DEPARTMENT');
    
select * from v_dep;    


create or replace view v_dep
as
select 
    department_id, 
    department_name 
from departments
with read only;

insert into v_dep(department_id, department_name)
    values (330, 'FINANCE DEPARTMENT');

select * from v_dep;

select * from departments;


delete from departments 
where department_id >270;

commit;

--  1 Kompleks Select sorgularindan can qurtarmaq
--  2 Movcud relation-larin murekkebliyi problem yaratmasin (DWH - Data Ware House)
--  3 DML restriction (row level)
--  4 Column-level access(security)

create or replace view v_user_employees
as
select
    employee_id,
    last_name,
    first_name,
    hire_date
from employees;

select * from v_user_employees;

create or replace view v_user_employees
as
select
    employee_id,
    last_name,
    first_name,
    hire_date,
    concat('***', substr(phone_number, -4)) as phone_number
from employees;

select * from v_user_employees;

--  5 Row-level access(security)
create or replace view v_user_employees
as
select
    employee_id,
    last_name,
    first_name,
    hire_date
from employees
where job_id not in ('AD_PRES', 'AD_VP');

select * from v_user_employees;

---------------------The End--------------------