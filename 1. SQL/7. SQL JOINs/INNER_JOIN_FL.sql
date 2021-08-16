-- following the lecture --

# dept_manager_dup

SELECT 
    *
FROM
    dept_manager_dup
ORDER BY dept_no;

# deparments_dup

DELETE FROM departments_dup 
WHERE
    dept_name = 'Public Relations' 
LIMIT 2;

# deparments_dup

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

-- Joining both tables with INNER JOIN --

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;


