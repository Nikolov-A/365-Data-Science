### ASSIGNMENT ###

/* 
------ 1 ------

Retrieve a list with all female employees whose first name is Kellie.

*/ 

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';