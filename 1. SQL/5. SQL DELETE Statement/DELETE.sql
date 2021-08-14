## ASSIGNMENT ###

/* 
------ 1 ------

Remove the department number 10 record from the "departments" table.

Hint: To solve this exercise, use the "departments" table.

*/

SELECT 
    *
FROM
    departments;
    
COMMIT;

DELETE FROM departments 
WHERE
    dept_no = 'd010';
    

