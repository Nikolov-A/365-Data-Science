## ASSIGNMENT ###

/* 
------ 1 ------

1. Which is the lowest employee number in the database?

*/
    
SELECT 
    MIN(emp_no) AS min_emp_no
FROM
    employees;


/* 
------ 2 ------

2. Which is the highest employee number in the database?

*/

SELECT 
    MAX(emp_no) AS max_emp_no
FROM
    employees;