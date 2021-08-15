## ASSIGNMENT ###

/* 
------ 1 ------

How many departments are there in the "employees" database? 

Use the "dept_emp" table to answer the question.

*/

SELECT 
    COUNT(DISTINCT dept_no)
FROM
    dept_emp;