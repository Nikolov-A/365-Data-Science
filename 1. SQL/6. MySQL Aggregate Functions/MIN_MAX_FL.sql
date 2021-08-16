-- following the lecture --

SELECT 
    *
FROM
    salaries;

SELECT 
    emp_no, MIN(salary) AS minimum_salary
FROM
    salaries
GROUP BY emp_no
ORDER BY MIN(salary);