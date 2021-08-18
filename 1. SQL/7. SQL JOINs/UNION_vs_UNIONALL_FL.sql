-- following lecture --

-- create employees duplicated table --

DROP TABLE IF EXISTS employees_dup;
CREATE TABLE employees_dup (
    emp_no INT(11),
    birth_date DATE,
    first_name VARCHAR(14),
    last_name VARCHAR(16),
    gender ENUM('M', 'F'),
    hire_date DATE
);

-- duplicate the employees table only with first 20 records --

INSERT INTO employees_dup 
SELECT 
	e.* 
FROM 
	employees e 
LIMIT 20;

-- check --

SELECT 
    *
FROM
    employees_dup;
    
-- insert a duplicate of the first row --

INSERT INTO employees_dup 
VALUES 
('10001', '1953-09-02', 'Georgi', 'Facello', 'M', '1986-06-26');

-- check --

SELECT 
    *
FROM
    employees_dup;
    
-- UNION vs UNION ALL --

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    NULL AS dept_no,
    NULL AS from_date
FROM
    employees_dup e
WHERE
    e.emp_no = '10001' 
UNION ALL SELECT 
    NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    m.dept_no,
    m.from_date
FROM
    dept_manager m; 