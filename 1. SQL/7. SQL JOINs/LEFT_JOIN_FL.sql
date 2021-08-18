-- following lecture --
USE employees;


SELECT 
    *
FROM
    dept_manager_dup;
    
SELECT 
    *
FROM
    departments_dup;
    
-- left join --
SELECT m.dept_no, m.emp_no, d.dept_name
FROM
	dept_manager_dup m
    LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY m.dept_no;

-- left join changed order --

SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    departments_dup d
        LEFT JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY d.dept_no;

