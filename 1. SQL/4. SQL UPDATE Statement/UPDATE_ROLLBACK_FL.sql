-- following the lecture --

USE employees;

UPDATE employees 
SET 
    first_name = 'Stella',
    last_name = 'Parkinson',
    birth_date = '1990-12-31',
    gender = 'F'
WHERE
    emp_no = 999901;

SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999901;
    
-- 2 --
DROP TABLE IF EXISTS departments_dup;

CREATE TABLE IF NOT EXISTS departments_dup
(
	dept_no CHAR(4),
    dept_name VARCHAR(40)
);

INSERT INTO departments_dup
SELECT * FROM departments
ORDER BY dept_no
LIMIT 9;

SET autocommit = 0;

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

COMMIT;

UPDATE departments_dup 
SET 
    dept_no = 'd011',
    dept_name = 'Quality Control';

ROLLBACK;

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;