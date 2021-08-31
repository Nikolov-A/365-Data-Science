## ASSIGNMENT ###

/* 
------ 1 ------

Create a visualization that compares the number of male managers to the number of female managers from different departments for each year, starting from 1990.


*/

-- activate database --

USE employees_mod;

-- what do we have in each single table we are going to use --

SELECT 
    *
FROM
    t_departments;

SELECT 
    *
FROM
    t_dept_manager;

SELECT 
    *
FROM
    t_employees;

-- create a desired query and extract it as csv file --

SELECT 
    d.dept_name AS dept_name,
    ee.gender AS gender,
    m.emp_no AS emp_no,
    m.from_date AS from_date,
    m.to_date AS to_date,
    e.calendar_year AS calendar_year,
    CASE
        WHEN e.calendar_year BETWEEN YEAR(m.from_date) AND YEAR(m.to_date) THEN 1
        ELSE 0
    END AS active
FROM
    (SELECT 
        YEAR(hire_date) AS calendar_year
    FROM
        t_employees) e
        CROSS JOIN
    t_dept_manager m
        JOIN
    t_departments d ON d.dept_no = m.dept_no
        JOIN
    t_employees ee ON ee.emp_no = m.emp_no
GROUP BY m.emp_no , calendar_year
ORDER BY m.emp_no , calendar_year;

-- The visualization can be found there --
-- https://public.tableau.com/app/profile/alex6736/viz/SQLTableaue-Task1/ActiveManagers?publish=yes --
        

        
