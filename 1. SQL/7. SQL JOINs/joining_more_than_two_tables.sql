## ASSIGNMENT ###

/* 
------ 1 ------

Select all managers' first and last name, hire date, job title, start date, and department name.

*/

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
WHERE
    title = 'Manager'
ORDER BY e.emp_no;

