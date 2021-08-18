## ASSIGNMENT ###

/* 
------ 1 ------

How many male and how many female managers do we have in the "employees" database?

*/

SELECT 
    e.gender, COUNT(m.emp_no) AS managers
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
GROUP BY e.gender
ORDER BY managers DESC;