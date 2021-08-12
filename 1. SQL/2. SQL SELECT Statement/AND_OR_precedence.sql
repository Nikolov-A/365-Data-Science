## ASSIGNMENT ###

/* 
------ 1 ------

Retrieve a list with all female employees whose first name is either Kellie or Aruna.

*/ 

SELECT 
    *
FROM
    employees
WHERE
    gender = 'F' AND (first_name = 'Kellie' OR first_name = 'Aruna');