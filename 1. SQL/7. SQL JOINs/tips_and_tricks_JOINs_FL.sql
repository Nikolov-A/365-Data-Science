-- following lecture --


-- Let's obtain the names of all departments and calculate the average salary paid to the managers and each of them --
-- dept_name, average_salary --

SELECT 
    d.dept_name, ROUND(AVG(s.salary),2) AS average_salary
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    salaries s ON m.emp_no = s.emp_no
GROUP BY d.dept_name
HAVING average_salary > 60000
ORDER BY average_salary DESC;