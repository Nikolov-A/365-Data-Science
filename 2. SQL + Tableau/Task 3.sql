## ASSIGNMENT ###

/* 
------ 1 ------

Create a visualization that compares the average salary of female versus male employees in the entire company untill year 2002.
Add a filter allowing you to see that per each departments. 


*/

-- Which columns we are going to have ?--
-- gender, dept_name, avg_salary, calendar_year

-- We are going to use t_employees, t_salaries, t_dept_emp and t_departments --
-- What do we have in each single table we are going to use ?--

-- t_employees --
SELECT 
    *
FROM
    t_employees;
    
-- t_salaries --
SELECT 
    *
FROM
    t_salaries;
    
-- t_dept_emp --
SELECT 
    *
FROM
    t_dept_emp;
    
-- t_departments --
SELECT 
    *
FROM
    t_departments;
    
-- Let's create desired output --

SELECT 
    e.gender AS gender,
    d.dept_name AS dept_name,
    ROUND(AVG(s.salary), 2) AS salary,
    YEAR(s.from_date) AS calendar_year
FROM
    t_employees e
        JOIN
    t_salaries s ON e.emp_no = s.emp_no
        JOIN
    t_dept_emp de ON s.emp_no = de.emp_no
        JOIN
    t_departments d ON de.dept_no = d.dept_no
GROUP BY e.gender , d.dept_no , calendar_year
HAVING calendar_year <= 2002
ORDER BY gender , dept_name , calendar_year;

-- The visualization can be found there --
https://public.tableau.com/app/profile/alex6736/viz/SQLTableaue-Task1/AVGSalary?publish=yes



    