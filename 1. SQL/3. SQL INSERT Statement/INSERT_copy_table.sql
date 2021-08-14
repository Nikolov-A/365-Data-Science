--  following the lecture --

SELECT 
    *
FROM
    departments;
 
DROP TABLE IF EXISTS departments_dup; 
CREATE TABLE IF NOT EXISTS departments_dup 
(
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);

SELECT 
    *
FROM
    departments_dup;
    
INSERT INTO departments_dup
(
	dept_no,
    dept_name
)
SELECT 
	* 
FROM 
	departments;

SELECT 
    *
FROM
    departments_dup;