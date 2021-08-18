-- following lecture --

SELECT 
    *
FROM
    dept_manager;
    
-- Select the first and last name from the `Employeess` table for the same employee numbers that can be found in the `Department Manager` table --

SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm);