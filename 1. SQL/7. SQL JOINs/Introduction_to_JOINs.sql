## ASSIGNMENT ###

/* 
------ 1 ------

If you currently have the ‘departments_dup’ table set up, use DROP COLUMN to remove the ‘dept_manager’ column from the ‘departments_dup’ table.

*/

ALTER TABLE departments_dup
DROP COLUMN dept_manager;


/* 
------ 2 ------

Then, use CHANGE COLUMN to change the ‘dept_no’ and ‘dept_name’ columns to NULL.

*/

ALTER TABLE departments_dup
CHANGE COLUMN dept_no dept_no CHAR(4) NULL,
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL; 

/* 
------ 3 ------

Then, insert a record whose department name is “Public Relations”.

*/

INSERT INTO departments_dup
(dept_name)
VALUES
('Public Relations');


/* 
------ 4 ------

Delete the record(s) related to department number two.

*/

DELETE FROM departments_dup 
WHERE
    dept_no = 'd002';
    

/* 
------ 5 ------

Insert two new records in the “departments_dup” table. 
Let their values in the “dept_no” column be “d010” and “d011”.

*/

SELECT 
    *
FROM
    departments_dup;

/* 
------ 6 ------

Create and fill in the ‘dept_manager_dup’ table, using the following code:
*/ 

DROP TABLE IF EXISTS dept_manager_dup;
CREATE TABLE dept_manager_dup 
(
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    from_date DATE NOT NULL,
    to_date DATE NULL
);
 
INSERT INTO dept_manager_dup
SELECT * FROM dept_manager;
 
INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES 
(999904, '2017-01-01'),
(999905, '2017-01-01'),
(999906, '2017-01-01'),
(999907, '2017-01-01');
 
DELETE FROM dept_manager_dup 
WHERE
    dept_no = 'd001';
   
INSERT INTO departments_dup (dept_name)
VALUES 
('Public Relations');
 
DELETE FROM departments_dup
WHERE
   dept_no = 'd002';
   
