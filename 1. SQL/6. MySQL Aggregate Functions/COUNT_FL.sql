-- following the lecture --

USE employees;

SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10;

SELECT 
    COUNT(salary)
FROM
    salaries;
    
-- How many employee start dates are in the database? -- 

SELECT 
    COUNT(DISTINCT from_date)
FROM
    salaries;
    
-- Counting NULL values `` 

SELECT 
    COUNT(*)
FROM
    salaries;
    
    
