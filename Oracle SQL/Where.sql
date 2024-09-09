-- Where

select
    *
from employees;

select
    *
from Employees 
where job_id = 'IT_PROG';


Select
    employee_id,
    last_name, 
    salary
From Employees
where job_id = 'IT_PROG';


select
    employee_id,
    last_name, 
    salary
from employees
where salary = 24000;


select
    employee_id,
    last_name, 
    department_id
from employees
where department_id = 30;


select
    employee_id,
    last_name, 
    department_id
from employees
where department_id < 30;


select
    employee_id,
    last_name, 
    department_id
from employees
where department_id <= 30;


select
    employee_id,
    last_name, 
    department_id
from employees
where department_id <> 30;

select
    employee_id,
    last_name, 
    department_id
from employees
where department_id != 30;


select
    employee_id,
    last_name, 
    department_id
from employees
where department_id ^= 30;


select
    employee_id,
    last_name, 
    department_id
from employees
where department_id is null;

select
    employee_id,
    last_name, 
    department_id
from employees
where department_id is not null;

--------------------------

-- between

select
    employee_id,
    last_name, 
    salary
from employees
where salary between 3000 and 4000;

select
    employee_id,
    last_name, 
    salary
from employees
where salary not between 3000 and 4000;


select
    employee_id,
    last_name, 
    hire_date
from employees
where hire_date between '01-jan-2001' and '31-dec-2002';

-- in
select
    employee_id,
    last_name, 
    job_id
from employees
where job_id in ('IT_PROG', 'AC_ACCOUNT', 'AD_VP');


select
    employee_id,
    last_name, 
    job_id
from employees
where job_id not in ('IT_PROG', 'AC_ACCOUNT', 'AD_VP');


select
    employee_id,
    last_name, 
    department_id
from employees
where department_id in (20, 40, 90, 500);


select
    employee_id,
    last_name, 
    department_id
from employees
where department_id not in (20, 40, 90, 500);


--- like % _
-- meta character
select
    employee_id,
    last_name, 
    job_id
from employees
where job_id like 'ST%';


select
    employee_id,
    last_name, 
    job_id
from Employees
where job_id like '%MAN';


select
    employee_id,
    last_name
from Employees
where last_name like 'K%';


select
    employee_id,
    last_name
From Employees
where last_name like 'K%r'; 


select
    employee_id,
    last_name
from Employees
where last_name like '%a%';


select
    employee_id,
    last_name
from Employees
where last_name like '%A%';


select
    employee_id,
    last_name
from Employees
where last_name like '%ing';


select
    employee_id,
    last_name
from Employees
where last_name like '%ing%';

--------------
create table teller_transactions(id number generated AS identity,
                          dr varchar2(28),
                          cr varchar2(28),
                          trn_details varchar2(100));
                          
insert into  teller_transactions (dr, cr, trn_details)
values ('AZ10IBAR64567679', 'AZ12IBAR64567679', 'AZAL');

insert into  teller_transactions (dr, cr, trn_details)
values ('AZ20IBAR64567679', 'AZ22IBAR64567679', 'komisiya 10% odenilir');

insert into  teller_transactions (dr, cr, trn_details)
values ('AZ20IBAR64567679', 'AZ22IBAR64567679', 'xidmet haqqi 10% odenilir');

insert into  teller_transactions (dr, cr, trn_details)
values ('AZ20IBAR64567679', 'AZ22IBAR64567679', 'komisiya 10 AZN odenilir');

commit;
------------------------------

select * from teller_transactions;

select * from teller_transactions
where trn_details like '%10% odenilir%';


select 
    * 
from teller_transactions
where trn_details like '%10/% odenilir%' escape '/';


select
    employee_id,
    last_name
from Employees
where last_name like '_a%';

select
    employee_id,
    last_name
from Employees
where last_name like '__a%';

 
select
    employee_id,
    last_name
from Employees
where last_name like '_ay%';

select
    employee_id,
    last_name
from Employees
where last_name like '_ay_%';


select
    employee_id,
    last_name, 
    salary
from Employees
where last_name like '%a__';


select
    postal_code
from locations
where postal_code like '% %';


select
    postal_code
from locations
where postal_code not like '% %';


select
    street_address
from locations
where street_address like '% % %';


select
    street_address
from locations
where street_address like '% % % %';


select 
    last_name, 
    job_id
from employees
where job_id like '%_R%';


select 
    last_name, 
    job_id
from employees
where job_id like '%/_R%' escape '/';

-------------------------------------

select
    last_name,
    first_name
from employees
where last_name = 'King';


select
    last_name,
    first_name
from employees
where last_name = 'King' and first_name = 'Steven';


select
    last_name
from employees
where last_name = 'King' or last_name = 'Grant';



select
    employee_id,
    last_name,
    department_id,
    salary
from employees
where department_id =50 AND salary >=5000;


select
    employee_id,
    last_name,
    department_id,
    salary
from employees
where department_id = 50 AND salary < 5000;


select
    employee_id,
    last_name,
    department_id,
    salary
from employees
where department_id = 50 OR salary >= 5000;


select
    employee_id,
    last_name,
    department_id,
    job_id
from employees
where department_id =10 or job_id = 'IT_PROG';


select
    employee_id,
    last_name,
    department_id,
    salary,
    hire_date
from employees
where department_id = 50 
        AND 
    hire_date between '01-jan-2004' and '31-dec-2004';


select
    employee_id,
    last_name,
    department_id,
    salary,
    hire_date
from employees
where department_id = 50 
    AND hire_date between '01-jan-2004' and '31-dec-2004'
    AND salary >= 4000;



select
    employee_id,
    last_name,
    department_id,
    salary,
    hire_date
from employees
where department_id = 80 AND salary >= 7000
    OR hire_date between '01-jan-2004' and '31-dec-2005'
        ;
        
        
select
    employee_id,
    last_name,
    job_id
from employees
where employee_id > 154 OR job_id like 'ST%';


select
    employee_id,
    last_name,
    salary,
    job_id
from employees
where (job_id like 'ST%' OR  employee_id > 154) 
        AND salary<=3000;


select
    employee_id,
    last_name,
    salary,
    job_id
from employees
where job_id like 'ST%' OR employee_id > 154 
            AND salary<=3000;


select
    street_address
from locations
where street_address like '% % %' 
        AND street_address not like '% % % %';


select
    street_address
from locations
where street_address like '%a%a%'  -- 2 ve daha chox 
        AND street_address not like '%a%a%a%'; -- 3 ve daha chox olmasin => 2 ve daha az olsun


select
    last_name,
    department_id
from employees
where department_id = 70 
        AND 
      department_id = 90;



select
    last_name,
    department_id
from employees
where department_id = 70 
    OR 
      department_id = 90;

------------------



select
    employee_id,
    first_name,
    last_name, 
    salary
from employees
where salary between 3000 and 4000;


select
    employee_id,
    first_name,
    last_name, 
    salary
from employees
where salary >= 3000 and salary <= 4000;


select
    employee_id,
    first_name,
    last_name, 
    department_id
from employees
where department_id in (20, 30);


select
    employee_id,
    first_name,
    last_name, 
    department_id
from employees
where department_id =20 OR department_id =30;


select
    employee_id,
    first_name,
    last_name, 
    department_id
from employees
where  department_id in (20, 30);
-- 8 rows


select
    employee_id,
    first_name,
    last_name, 
    department_id
from employees
where  department_id not in (20, 30) ;


select
    employee_id,
    first_name,
    last_name, 
    department_id
from employees
where  department_id not in (20, 30) 
        or department_id is null;


select
    employee_id,
    first_name,
    last_name, 
    department_id
from employees
where  department_id in (20, 30) 
        or department_id is null;



select
    employee_id,
    first_name,
    last_name, 
    department_id
from employees
where  not department_id in (20, 30);


select
    employee_id,
    first_name,
    last_name, 
    department_id
from employees
where  not (department_id =20 OR department_id =30);


select 
    * 
from dual
where 1=1;


select 
    * 
from dual
where 1=2;

select 
    * 
from dual
where null=null;


select 
    * 
from dual
where not 1=2;

select 
    * 
from dual
where NOT null=null;

select
    *
from employees
where 5=5;


select
    *
from employees
where 4=5;

--------------------------------------

-- Sorting

select 
    employee_id,
    last_name,
    salary
from employees
order by employee_id;


select 
    employee_id,
    last_name,
    salary
from employees
order by employee_id asc;


select 
    employee_id,
    last_name,
    salary
from employees
order by employee_id desc;


select 
    employee_id,
    last_name,
    salary
from employees
order by 1 asc;

select 
    last_name,
    salary
from employees
order by last_name asc;


select 
    last_name,
    salary
from employees
order by last_name desc;


select 
    employee_id,
    last_name,
    salary
from employees
order by last_name asc;


select 
    employee_id,
    last_name,
    salary
from employees
order by last_name asc, salary asc;


select 
    employee_id,
    last_name,
    salary
from employees
order by last_name desc, salary desc;


select 
    employee_id,
    last_name,
    salary * 12 as annual_salary
from employees
order by last_name desc, annual_salary asc;


-- null

select 
    employee_id,
    last_name,
    department_id
from employees
order by department_id asc;


select 
    employee_id,
    last_name,
    department_id
from employees
order by department_id asc nulls first;


select 
    employee_id,
    last_name,
    department_id
from employees
order by department_id desc;

select 
    employee_id,
    last_name,
    department_id
from employees
order by department_id desc nulls last;
--------------------------------------

-- fetch

select 
    employee_id,
    last_name,
    salary
from employees
order by salary desc;


select
    employee_id,
    last_name,
    salary
from employees
order by salary desc
    fetch first 7 rows only;


select 
    employee_id,
    first_name,
    last_name,
    salary
from employees
order by salary desc 
    fetch first 7 rows with ties;


select 
    employee_id,
    last_name,
    salary
from employees
order by salary desc
    offset 5 rows fetch next 5 rows only;


select 
    employee_id,
    last_name,
    salary
from employees
order by salary desc 
    fetch first 10 percent rows only;



select 
    employee_id,
    first_name,
    last_name,
    salary
from employees
where job_id = 'ST_CLERK'
order by salary desc 
    fetch first 10 percent rows only;

--------------------------------------
select
    employee_id,
    last_name,
    department_id
from employees
where department_id = &depid;

-- AMPERSAND & (SHIFT+7)

define depid = 30;

select
    employee_id,
    last_name,
    department_id
from employees
where department_id = &depid;

undefine depid;

select
    employee_id,
    last_name,
    department_id
from employees
where department_id = &&depid;

undefine depid;

select
    employee_id,
    last_name,
    salary,
    department_id,
    job_id
from employees
where &cond;


select
    &sel_list
from employees
where &cond;

select
    *
from employees
where department_id = 50
order by employee_id desc 
    fetch first &N rows only;

--------------------- The End -------------------
