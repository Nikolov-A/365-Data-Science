## ASSIGNMENT ###

/* 
------ 1 ------

Change the “Business Analysis” department name to “Data Analysis”.

Hint: To solve this exercise, use the “departments” table.

*/

SELECT 
    *
FROM
    departments;
    
UPDATE departments 
SET 
    dept_name = 'Data Analysis'
WHERE
    dept_no = 'd010';
    
SELECT 
    *
FROM
    departments
ORDER BY 
	dept_no;