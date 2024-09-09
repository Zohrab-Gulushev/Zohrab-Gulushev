--You cannot create tables of the same name



CREATE TABLE table_name1 (
    id NUMBER,
    name varchar2(25),      -- Used to store variable-length strings
    surname char(25)        -- Stores fixed-length strings    
);



CREATE TABLE table_name2 (
    id NUMBER,                 -- Can be any number (integer or with decimal places)
    amount NUMBER(10, 2)       -- Number with two digits after the decimal point
);



CREATE TABLE Persons( 
    PersonID number, 
    LastName varchar2(20), 
    FirstName varchar2(20), 
    Address varchar2(20), 
    City varchar2(20) 
);



CREATE TABLE tablename AS --SUBQUERY;                --Creating a table using sub-queries
CREATE TABLE INCOGNITO AS SELECT * FROM Persons      --WE CREATE A TABLE WITH THE SAME DATA, DATE TYPES,COLUMNS,ROWS



--WRONG!!!
CREATE TABLE SELECT ( 
id NUMBER, 
name VARCHAR2(50) 
); -- 'SELECT' is a reserved word

CREATE TABLE 1employees ( 
id NUMBER, 
name VARCHAR2(50) 
); -- Table names cannot start with a digit

CREATE TABLE employee data ( 
id NUMBER, 
name VARCHAR2(50) 
); -- Spaces in table names are not allowed

CREATE TABLE employee@data ( 
id NUMBER, 
name VARCHAR2(50) 
); -- Special characters in table names are not allowed @, #, $, &

CREATE TABLE this_table_name_is_way_too_long_for_oracle ( 
id NUMBER, 
name VARCHAR2(50) 
); -- Table name must not exceed 30 characters

CREATE TABLE "CaseSensitiveTable" ( 
id NUMBER, 
name VARCHAR2(50) 
); -- Error if table was created with quotes



DESC PERSONS                                           --you can view the structure



INSERT INTO table_name (column1, column2, column3,...)
VALUES (value1, value2, value3,...);                          --To insert data into a table



SELECT * FROM CUSTOMERS;                                      --to display the data in the table 



ALTER TABLE tablename ADD (job_id VARCHAR2(9));                                      --Adding columns
ALTER TABLE tablename modify (last_name VARCHAR2(30));                               --Make a column
ALTER TABLE table_name RENAME COLUMN old_column_name TO new_column_name;             --Change the name of the column
ALTER TABLE old_table_name RENAME TO new_table_name;                                 --Change table name
ALTER TABLE table_name READ ONLY;                                                    --Make the table barely readable
ALTER TABLE table_name READ WRITE;                                                   --Reading and writing in the table



DROP TABLE table_name;                                       --delete the table so that it ends up in the trash



select * from recyclebin;
FLASHBACK TABLE  "object_name" TO BEFORE DROP;



DROP TABLE table_name PURGE                                                          --did not get into the trash



COMMENT ON TABLE table_name IS 'This table stores information about ...';            --comment on table
COMMENT ON COLUMN table_name.column_name IS 'This column stores ...';                --comment on column



SELECT  column1, 
        --column2
FROM table1;                                                -- Below is data filtering for the query

SQL
SELECT  column1, 
        /*column2,
        column3,
        column4, */
        column5
FROM table1;                                 /* Use this comment to provide explanations about the query and its purpose */



TRUNCATE TABLE table_name;                  --It is not possible to recover

