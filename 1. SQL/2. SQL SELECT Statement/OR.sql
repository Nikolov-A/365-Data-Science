### ASSIGNMENT ###

/* 
------ 1 ------

Retrieve a list with all employees whose first name is either Kellie or Aruna.

*/ 

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' OR first_name = 'Aruna';