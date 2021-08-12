## ASSIGNMENT ###

/* 
------ 1 ------

Use the IN operator to select all individuals from the “employees” table, whose first name is either “Denis”, or “Elvis”.

*/ 

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Denis' , 'Elvis');

/* 
------ 2 ------

Extract all records from the ‘employees’ table, aside from those with employees named John, Mark, or Jacob.

*/ 
 
 SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('Jonh' , 'Mark', 'Jacob');

