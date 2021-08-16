-- (preamble) --

/* 
So, let's adjust the "Departments" duplicate in a way that suits the purposes of the next video,
in which we will work with IF NULL() and COALESCE().
*/

SELECT 
    *
FROM
    departments_dup;
    
ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL; 

ALTER TABLE departments_dup
CHANGE COLUMN dept_no dept_no CHAR(4) NULL;

INSERT INTO departments_dup(dept_no) 
VALUES ('d010'), ('d011');

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

ALTER TABLE departments_dup
ADD COLUMN dept_manager VARCHAR(255) NULL AFTER dept_name;

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

COMMIT;

-- following the lecture --

SELECT 
    dept_no,
    IFNULL(dept_name,
            'Department name not provided') AS dept_name
FROM
    departments_dup;
    

SELECT 
    dept_no,
    COALESCE(dept_name,
            'Department name not provided') AS dept_name
FROM
    departments_dup;
    
SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_manager, dept_name, 'N/A') AS dept_manager
FROM
    departments_dup;
    

SELECT 
    dept_no,
    dept_name,
    COALESCE('department manager name') AS fake_col
FROM
    departments_dup;