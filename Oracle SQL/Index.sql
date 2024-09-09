                        /*Index*/
-- BTree
-- Bitmap

-- BTree

drop table sample_data;

create table sample_data
as
select
    rownum as id, e.employee_id, e.first_name, e.last_name, c.country_id, c.country_name
from employees e cross join countries c cross join countries d cross join countries t;


select * from sample_data;

select * from sample_data
where id between 1000 and 1010;

select * from user_indexes
where table_name = 'SAMPLE_DATA';

create index ind_data_id on sample_data(id);

select * from user_indexes
where table_name = 'SAMPLE_DATA';

select * from user_ind_columns
where table_name = 'SAMPLE_DATA';

select * from sample_data sd
where id between 1000 and 1010;

select * from sample_data sd
where id between 1000 and 1010000;

-- hint
select /*+ index(sd ind_data_id) */ 
    * 
from sample_data sd
where id between 1000 and 10100000;


select * from sample_data
where id between 1000 and 1010;

select * from sample_data
where round(id) between 1000 and 1010;

create index ind_data_id_r on sample_data(round(id)); 
-- function-based index

select * from sample_data
where round(id) between 1000 and 1010;

drop index ind_data_id;
drop index ind_data_id_r;


select * from user_indexes
where table_name = 'SAMPLE_DATA';

select * from user_ind_columns
where table_name = 'SAMPLE_DATA';

alter table sample_data
modify id constraint pk_sample_id primary key;

select * from user_ind_columns
where table_name = 'SAMPLE_DATA';

select * from user_indexes
where table_name = 'SAMPLE_DATA';

select * from sample_data
where id between 1000 and 1010;

select * from sample_data
order by id;

------------------------------

-- Bitmap

select * from sample_data;

select count(distinct country_id) from sample_data;

select * from sample_data
where country_id like 'AR%';

create bitmap index ind_bit_sample_conid 
                    on sample_data(country_id);

select * from sample_data
where country_id like 'AR%';


select * from sample_data
where country_id like '%AR%';


select * from sample_data
where country_id like '%AR';


select /*+ index(sample_data ind_bit_sample_conid) */ 
    * 
from sample_data
where country_id like '%AR';


select --+ index(sd ind_bit_sample_conid) 
    * 
from sample_data sd
where country_id like '%AR';

--

alter table sample_data
drop constraint pk_sample_id;
drop index IND_BIT_SAMPLE_CONID;

---------- The End ----------