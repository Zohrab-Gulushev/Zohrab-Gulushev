-----------------------/* SELECT */-----------------------


--Selecting all columns and rowS

SELECT * FROM JOBS;
SELECT * FROM HR.JOBS;


--Selecting specific columns

SELECT JOB_ID, JOB_TITLE FROM HR.JOBS;


--Calculation Examples

SELECT JOB_ID, MIN_SALARY*12  "1 YEAR"
FROM HR.JOBS;

SELECT JOB_ID, JOB_TITLE, 100 + 50 AS TOTAL
FROM HR.JOBS;

SELECT HR.JOBS.*, MAX_SALARY - MIN_SALARY AS TOTAL
FROM HR.JOBS;
--HR.JOBS.* indicates that all columns from the HR.JOBS table are selected


--Describing the table structure

DESC HR.JOBS;

DESCRIBE HR.JOBS;


--DUAL is virtual table

SELECT 100 * 5 FROM DUAL;

SELECT 'Example Text' FROM DUAL;

SELECT 100 + 200, 'Example Text' FROM DUAL;


--Using Aliases

SELECT JOB_ID AS ID, JOB_TITLE AS TITLE FROM HR.JOBS;

SELECT 100 + 5 AS RESULT FROM DUAL;

SELECT 'Sample Text' AS TEXT FROM DUAL;

SELECT 100 - 5 "RESULT" FROM DUAL;

SELECT 'Sample Text' "TEXT" FROM DUAL;


--Combining Columns

SELECT JOB_ID, JOB_TITLE FROM HR.JOBS;

SELECT JOB_ID || ' - ' || JOB_TITLE AS JOB_DETAILS
FROM HR.JOBS;


--Using DISTINCT and UNIQUE

SELECT DISTINCT JOB_TITLE FROM HR.JOBS;

SELECT UNIQUE JOB_ID FROM HR.JOBS;


-----------------------/* INSERT */-----------------------

--Adding a New Row to a Table

/* Create with alias copy DEPARTMENTS */


--CREATE TABLE DEPARTMENT1 AS SELECT * FROM departments;


INSERT INTO DEPARTMENT1 
VALUES (70,'Public Relations',100,1700);
--If the data type is string, write it in quotation marks.

SELECT * FROM DEPARTMENT1;

INSERT INTO DEPARTMENT1 (department_id,department_name,manager_id,location_id) 
VALUES (80,'Public Relations',101,1701); 
--Same as the above query.

SELECT * FROM DEPARTMENT1;

--And what if you swap the columns location_id and manager_id
INSERT INTO DEPARTMENT1 (department_id,department_name,location_id,manager_id) 
VALUES (90,'Public Relations',102,1702); 

SELECT * FROM DEPARTMENT1;

--WRONG!!!

INSERT INTO DEPARTMENT1 (department_id,location_id,manager_id) 
VALUES (90,'Public Relations',102,1702);

--WRONG!!!

INSERT INTO DEPARTMENT1 (department_id,department_name,manager_id,location_id) 
VALUES (90,null,null,1702);
--?annot insert NULL into "DEPARTMENT_NAME"
--We will cover this topic of constraints in the next lesson
desc DEPARTMENT1;


--Inserts the value NULL into the manager_id column. This indicates that there is no information available for the manager.

INSERT INTO DEPARTMENT1 (department_id,department_name,manager_id,location_id) 
VALUES (90,'Public Relations',null,1702);


--Inserts the string 'null' into the department_name column. This is a string literal and not a SQL NULL value.

INSERT INTO DEPARTMENT1 (department_id,department_name,manager_id,location_id) 
VALUES (90,'null',null,1702);
--Use NULL when you want to denote the absence of a value. This is useful for representing unknown or inapplicable information.



--Creating a Script

INSERT INTO DEPARTMENT1 (department_id,department_name,manager_id,location_id) 
VALUES (&department_id,'&department_name',&manager_id,&location_id);  --SHIFT + 7


-----------------------/* UPDATE */-----------------------


--Specific row or rows are modified if you specify the WHERE clause
--'WHERE' we will cover this topic in the next lessons 

UPDATE DEPARTMENT1
SET department_id = 99          --This is for what we want to change.
WHERE manager_id = 1702;        --This is what we are changing.


--Update all rows in the table 

UPDATE DEPARTMENT1
SET department_id = 99;


-----------------------/* DELETE */-----------------------


--Delete a row 

DELETE FROM DEPARTMENT1
WHERE department_id = 99;        --Only rows with DEPARTMENT_ID = 99 are changed.


--Delete all rows in the table 

DELETE FROM DEPARTMENT1;


-----------------------/* MERGE */-----------------------


--We create a copy of employees with columns ...

CREATE TABLE copy_emp as 
SELECT employee_id,first_name,last_name,phone_number,department_id FROM employees;


--We find matches existing records (copy_emp) are updated with data (employees).

MERGE INTO copy_emp c
USING employees e
ON (e.employee_id = c.employee_id)
WHEN MATCHED THEN
    UPDATE SET
        c.FIRST_NAME = e.FIRST_NAME,
        c.last_name = e.last_name,
        c.phone_number = e.phone_number,
        c.department_id = e.department_id
WHEN NOT MATCHED THEN
    INSERT (employee_id, FIRST_NAME, last_name, phone_number, department_id)
    VALUES (e.employee_id, e.FIRST_NAME, e.last_name, e.phone_number, e.department_id);

















