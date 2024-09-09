-- SET OPERATORS

/*
union all   - A birleshsin B
union       - A birleshsin B, distinct, order by 1
minus       - A-da olan, B-de olmayan setirler, distinct, order by 1 
intersect   - A-a ve B-de eyni zamanda olanlar, distinct, order by 1
-----

Set operatorlarin tetbiq olundugu 
select listlerin her birinde
sutun sayi ve muvafiq sutunlarin datatype-lari
eyni olmalidir
*/


select country_name from countries
union all
select city from locations;


select 'Country: ', country_name from countries
union all
select 'City:', city from locations;


select '>>>>>>>>>>>>Countries:' from dual
union all
select country_name from countries
union all
select '>>>>>>>>>>>>>Cities:' from dual
union all
select city from locations;


select '>>>>>>>>>>>>Countries:' as List from dual
union all
select country_name from countries 
union all
select '>>>>>>>>>>>>>Cities:' from dual
union all
select city from locations;



select 100 as ord, '>>>>>>>>>>>>Countries:' as List from dual
union all
select 200, country_name from countries
union all
select 300, '>>>>>>>>>>>>>Cities:' from dual
union all
select 400, city from locations
order by 1;
-------

select * from employees
where last_name = 'King';

select last_name from employees where department_id =90
union all
select last_name from employees where department_id =80;

select last_name from employees where department_id =90
union
select last_name from employees where department_id =80;

select department_id, last_name from employees where department_id =90
union
select department_id, last_name from employees where department_id =80;
---

select last_name from employees where department_id =90
minus
select last_name from employees where department_id =80;
---

select last_name from employees where department_id =90
intersect
select last_name from employees where department_id =80;

---

select region_id as id, region_name as name from regions
union all
select country_id, country_name from countries;


select to_char(region_id) as id, region_name as name from regions
union all
select country_id, country_name from countries;

---
select first_name, last_name from employees
union all
select department_name from departments;


select first_name, last_name from employees
union all
select department_name, null from departments;

-----

select 
    country_name 
from countries 
where region_id = 1 or region_id = 3;


select 
    country_name 
from countries 
where region_id in (1, 3);



select 
    country_name 
from countries 
where region_id = 1
union all
select 
    country_name 
from countries 
where region_id = 3;

--------------------The End---------------------------