## ASSIGNMENT ###

/* 
------ 1 ------

Create a visualization that provides a breakdown between the male and female employees working in the company each year, starting from 1990.


*/

-- Create a desired query and extract it as csv -- 

SELECT 
    YEAR(de.from_date) AS calendar_year,
    e.gender AS gender,
    COUNT(e.emp_no) AS num_of_employees
FROM
    t_employees e
        JOIN
    t_dept_emp de ON e.emp_no = de.emp_no
WHERE
    YEAR(de.from_date) >= 1990
GROUP BY calendar_year , gender;

-- The visualization can be found there --
https://public.tableau.com/app/profile/alex6736/viz/SQLTableaue-Task1/Employees?publish=yes