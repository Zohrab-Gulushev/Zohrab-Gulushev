-------- Single-Row SQL Functions /*PART1*/
/*
    1. Single-row
    2. Multiple-row (Group functions)
    3. Analytic
*/


--- character 
--- number
--- date
--- datatype convertion
--- General (Null, If Then Else)

------------------ character functions

------ case manipulation

select  
    lower('Oracle SQL lessons'), 
    upper('Oracle SQL lessons'), 
    initcap('Oracle SQL lessons') 
from dual;


select 
    lower(last_name) 
from employees;


select 
    last_name 
from employees
where last_name like '%a%';


select 
    last_name
from employees
where lower(last_name) like '%a%';


--- character manipulation

-- Length
select 
    last_name, 
    length(last_name)
from employees;


select 
    employee_id,
    last_name
from employees
where length(last_name) = 5;


-- Concat
select 
    last_name, 
    first_name,
    concat(last_name, first_name) 
from employees;


select 
    last_name, 
    first_name,
        concat(
            concat(last_name, ' '), 
            first_name
        )  
from employees;
---- Nested function

select 
    last_name, 
    first_name,
    concat(    
        concat(
                concat(last_name, ' '), 
                first_name
            ), 
        concat(' - ', salary)
        )
from employees;


select 
    last_name, 
    first_name,
    last_name || ' ' || first_name
from employees;


-- SubStr
select 
    last_name, 
    substr(last_name, 1, 1) as "1,1",
    substr(last_name, 1, 2) as "1,2",
    substr(last_name, 3, 1) as "3,1",
    substr(last_name, 3, 2) as "3,2",
    substr(last_name, 3) as "3,sona qeder",
    substr(last_name, -3, 3) as "-3,3 sondan 3",
    substr(last_name, -3, 1) as "-3,1",
    substr(last_name, -2) as "-2,sondan 2"
from employees; 


---- phone number mask
select 
    last_name,
    concat(
            concat( substr(phone_number, 1, 3), '***'), 
            substr(phone_number, -4)
            ) as masked 
from employees;


-- InStr
select 
    last_name, 
    instr(last_name, 'a'),          -- ilk a-nin indexi
    instr(last_name, 'a', 1, 1),    -- ilk a-nin indexi
    instr(last_name, 'a', 1, 2),    -- 2-ci a-nin indexi
    instr(last_name, 'a', 3, 1),    -- 3-cu simvoldan bashlayaraq ilk a-nin indexi
    instr(last_name, 'a', 3, 2),    -- 3-cu simvoldan bashlayaraq 2-ci a-nin indexi
    instr(last_name, 'a', -1, 1)    -- sagdan sola ilk a-nin indexi
from employees;


-- LPad, RPad
select  
    last_name, 
    lpad(last_name, 6, '*') as "LPad", -- uzunlugu 6-a tamamlayir, chatishmayan sayi * simvollari ile tamamlayir (left - soldan)
    rpad(last_name, 6, '*') as "RPad"-- uzunlugu 6-a tamamlayir, chatishmayan sayi * simvollari ile tamamlayir (right - sagdan)
from employees;  
-- 6-dan artiq olsa, hemishe axirdan kesir artigini


select
    lpad('*', 10, '*'),
    lpad('a', 10, 'a')
from dual;


-- Trim, LTrim, RTrim
select trim('   Oracle SQL example   ') from dual;

select ltrim('   Oracle SQL example   ') from dual;

select rtrim('   Oracle SQL example   ') from dual;

select ltrim('   Oracle SQL example   ', ' ') from dual;

select ltrim('xxxx   Oracle SQL example   xxxxx', 'x') from dual;

select rtrim('xxxx   Oracle SQL example   xxxxx', 'x') from dual;

select rtrim('xxxx   Oracle SQL example   xxxxx', 'x ') from dual;


-- Replace
select 
    last_name, 
    replace(last_name, 'a', '#'),
    replace(last_name, 'an', '@'),
    replace(last_name, 'King', 'Aslan'),
    replace(last_name, 'a')
from employees;


select 
    last_name, 
    replace(
            replace(last_name, 'a', 'b'), 
            'A', 
            'B') 
from employees; --nested function


-- Translate
select 
    last_name, 
    replace(last_name, 'abcdi', '@$!.*'),
    translate(last_name, 'abcdi', '@$!.*') 
from employees;


select 
    last_name, 
    translate(last_name, 'aA', 'bB'),
    translate(last_name, '*aA', '*') 
from employees;


select 
    street_address, 
    translate(street_address, '#0123456789', '#') 
from locations;

-- Reverse
select
    last_name,
    reverse(last_name)
from employees;

------------ NUMBER

-- Round (riyazi yuvarlaqlashdirma)
select 
    round(2231.574),
    round(2231.574, 0),
    round(2231.574, 1),
    round(2231.574, 2),
    round(2261.574, -1),
    round(2261.574, -2) 
from dual;

-- Trunc (ashagi yuvarlama)
select 
    trunc(2231.574),
    trunc(2231.574, 0),
    trunc(2231.574, 1),
    trunc(2231.574, 2),
    trunc(2261.574, -1),
    trunc(2261.574, -2) 
from dual;


-- Mod (qaliq)
select 
    mod( 10, 3),
    mod( 15, 4),
    mod(-15, 4),
    mod( 5,  7)
from dual; 


select employee_id as "Tek", 
        last_name 
from employees
where mod(employee_id, 2) = 1;


select employee_id as "Cut", 
        last_name 
from employees
where mod(employee_id, 2) = 0;


-- Abs (mutleq qiymet)
select 
    abs(50),
    abs(-50)
from dual;


-- Power (quvvet)
select
    power(4,2),
    power(16, 1/3)
from dual;


-- Greatest (arqumentlerden en boyuyu)
select greatest(5, 10) from dual;
select greatest(5, 10, 33) from dual;


-- Least (arqumentlerden en kichiyi)
select least(5, 1, 3, 25) from dual;


------------- DATE    

-- Tarixler ile cebri emeliyyatlar
select 
    sysdate, 
    sysdate +3, -- 3 gun sonraya 
    sysdate -2 -- 2 gun evvele
from dual;

select 
    last_name, 
    hire_date, 
    sysdate - hire_date         as "Gun ferqi",
    trunc(sysdate - hire_date)  as "Gun ferqi tam eded"
from employees;


-- MonthS_Between (iki tarix arasinda ay ferqi)
select 
    last_name, 
    sysdate, 
    hire_date, 
    months_between(sysdate, hire_date),
    trunc(months_between(sysdate, hire_date))
from employees;


-- Add_MonthS (aylar elave etmek/chixmaq)
select 
    add_months(sysdate, 6),
    add_months(sysdate, -6) 
from dual;

-- Last_Day (tarixin aid oldugu ayin son gunu)
select 
    hire_date, 
    last_day(hire_date) 
from employees;

select 
    last_name,
    hire_date
from employees
where hire_date = last_day(hire_date);
-- ishe girme tarixi ayin son gunune tesaduf eden emekdash


-- Next_Day (heftenin istediyimiz gunu, novbeti, en yaxin)
select 
    next_day(sysdate, 'wednesday'),
    next_day(sysdate, 'wed'),
    next_day(sysdate, 'thu'),
    next_day(sysdate, 'sunday'),
    next_day(sysdate, 1)
from dual;


-- Round(tarixe tetbiqi)
select 
    round(sysdate, 'dd'),       -- gunun ichinde saata baxir
    round(sysdate, 'day'),      -- heftenin gunune gore
    round(sysdate, 'month'),    -- ayin gunune baxir
    round(sysdate, 'year')      -- ilin icherisinde baxir
from dual;
 
 
-- Trunc(tarixe tetbiqi)
select 
    trunc(sysdate),             -- gunun ilk saatina getirir ve yaxud saati legv edir
    trunc(sysdate, 'dd'),       -- gunun ilk saatina getirir ve yaxud saati legv edir
    trunc(sysdate, 'day'),      -- heftenin evveline
    trunc(sysdate, 'month'),    -- ayin evveline
    trunc(sysdate, 'year')      -- ilin evveline
from dual;


--PART2

----- DataType Convertion

-- To_Char(date) (return character datatype)

select 
    to_char(sysdate, 'dd.mm.yyyy'),
    to_char(sysdate, 'Day, ddth "of" Month'),
    to_char(sysdate, 'fmDay, ddth "of" Month'),
    to_char(sysdate, 'dd.mm.yyyy hh24:mi:ss'),
    to_char(sysdate, 'dd.mm.yyyy hh12:mi:ss AM')
from dual;


select  
    to_char(sysdate, 'd') as week,
    to_char(sysdate, 'dd') as month,
    to_char(sysdate, 'ddd') as year
from dual;


-- Extract (return number datatype)
select 
    sysdate,
    EXTRACT(day from sysdate),
    EXTRACT(month from sysdate),
    EXTRACT(year from sysdate)
from dual;


select
    first_name,
    last_name,
    salary,
    hire_date
from employees
where EXTRACT(day from hire_date) = 24;


select
    first_name,
    last_name,
    salary,
    hire_date
from employees
where EXTRACT(day from hire_date) = 24
    and EXTRACT(month from hire_date) = 3;


select
    first_name,
    last_name,
    salary,
    hire_date
from employees
where EXTRACT(day from hire_date) = EXTRACT(day from sysdate)
    and EXTRACT(month from hire_date) = EXTRACT(month from sysdate);
-- her hansi ilin bu tarixinde ishe giren emekdashlar


---- to_char(number) (character datatype qaytarir)
select 
    salary, 
    to_char(salary, '999,999.00') as number_format,
    to_char(salary, 'fm999,999.00') as number_format_fm
from employees;


select 
        to_char(commission_pct, '999,999.99'), 
        to_char(commission_pct, 'fm999,999.99'),
        to_char(commission_pct, 'fm999,990.00')
from employees 
where commission_pct is not null;


----to_date(char) (date datatype qaytarir)

select '11.04.2020' + 1 from dual;

select to_date('11.04.2020', 'dd.mm.yyyy') +1 from dual;

select last_name, hire_date from employees
where hire_date < '01.jan.2003';
-- implicit datatype convertion (qeyri-ashkar)


select last_name, hire_date from employees
where hire_date < '01.01.2003'; -- error

select last_name, hire_date from employees
where hire_date < to_date('01.01.2003', 'dd.mm.yyyy'); 
-- explicit datatype convertion (ashkar)

alter session 
    set nls_date_format = 'dd.mm.yyyy hh12:mi:ss AM';

select sysdate from dual;

select to_date('03.01.2021 07:12:55 AM', 
                'dd.mm.yyyy hh12:mi:ss AM') from dual;


alter session set nls_date_format = 'dd-MON-yy';

select sysdate from dual;


-- INTERVAL
--- yminterval (year to month)
--- dsinterval (day to second)

select 
    numtoyminterval(33,'month'),
    numtoyminterval(1.4,'year'),
    numtodsinterval(2400,'second'),
    numtodsinterval(230,'minute') 
from dual;


select to_dsinterval('12 07:15:22') from dual;

select sysdate + '12 07:15:22' from dual;

select sysdate + to_dsinterval('22 07:15:33') from dual;

select to_yminterval('1-5') from dual;


select 
    sysdate,
    sysdate + numtodsinterval(8200, 'minute'),
    sysdate + interval '8200' minute 
from dual;


---- to_number(char) (number datatype qaytarir)

select '$12,376.33' +1 as "Char" from dual;

select to_number('$12,376.33', '$999,999.99') +1 as "Number" from dual;

select '12376.33' +1 as "Number" from dual;

-------------------------------------------


------- NULL FUNCTIONS

-- Nvl
select 
    commission_pct, 
    nvl(commission_pct, 0),
    nvl(commission_pct, 1)
from employees;

select 
    salary, 
    commission_pct, 
    salary - salary *     commission_pct    AS "Net salary",
    salary - salary * nvl(commission_pct,0) AS "Net salary new"
from employees;


select 
    commission_pct, 
    nvl(commission_pct, 'yoxdur') -- ikinci argument number-e chevrile bilmir, ona gore Error-dur
from employees;

select 
    commission_pct, 
    nvl(to_char(commission_pct,'0.00'), 'yoxdur') 
from employees;

select 
    commission_pct, 
    nvl(commission_pct, manager_id) 
from employees;


----

select 
    coalesce(1, null, 2, null, 3, 4, 5), 
    coalesce(null, null, 2, null, 3, 4, 5),
    coalesce(null, null, null, null, 3, 4, null) 
from dual;


select 
    salary, 
    commission_pct, 
    salary - salary * coalesce(commission_pct,0) 
from employees;


select 
    commission_pct, 
    coalesce(commission_pct, '111') -- argumentlerin datatype-lari ferqlidir, ona gore Error-dur
from employees;
-- Inconsistent datatypes: expected NUMBER got CHAR


----
select 
    commission_pct, 
    nvl2(commission_pct,'var', 'yoxdur'),
    nvl2(commission_pct, 1, 0)
from employees;

----

select 
    length(last_name),
    length(first_name), 
    nullif(length(last_name),length(first_name)) 
from employees;


select 
    nullif(1,2), 
    nullif(2,1), 
    nullif(1,1) 
from dual;

--------------------------------

----- IF THEN ELSE

---simple case
select 
    last_name, 
    job_id,
        case job_id
            when 'SA_REP' then 'Reporter'
            when 'IT_PROG' then 'Programmer'
            when 'SA_MAN' then 'Manager'
            else 'Other'
        end AS "Prof"
from employees;

---search case
select 
    last_name, 
    department_id, 
    job_id,
        case 
            when department_id = 50 then JOB_ID
            when job_id like 'ST%'  then 'ST-XXXXXXX'
            when job_id like '%PROG' then 'Programmer'
            else 'Other'
        end as "Prof"
from employees;


select 
    last_name, 
    department_id, 
    job_id,
        case 
            when department_id = 50 then JOB_ID
            when job_id like 'ST%'  then 'ST-XXXXXXX'
            when job_id like '%PROG' then 'Programmer'
        end as "Prof"
from employees;

-------------------------

select last_name, job_id,
        decode(job_id, 
                        'SA_REP'    ,'Reporter', 
                        'IT_PROG'   ,'Programmer', 
                        'SA_MAN'    ,'Manager', 
               'Other') AS "Prof-Decode"
from employees;


select last_name, job_id,
        decode(job_id, 
                        'SA_REP'    ,'Reporter', 
                        'IT_PROG'   ,'Programmer', 
                        'SA_MAN'    ,'Manager'
                ) AS "Prof-Decode"
from employees;

-- https://shahinkarimov.com/oraclesqlfunksiyalari/

---------------- The End --------------