## ASSIGNMENT ###

/* 
------ 1 ------

Create an SQL stored procedure that will allow you to obtain the average male and female salary per department within a certain salary range.
Let this range be defined by two values the user can insert when calling the procedure.
Finally, visualize the obrained result-set in Tableau as double bar chart


*/

-- Which columns we are going to have ?--
-- gender, dept_name, avg_salary --

-- We are going to use t_employees, t_salaries, t_dept_emp and t_departments --
-- What do we have in each single table we are going to use ?--

SELECT 
    *
FROM
    t_employees;

SELECT 
    *
FROM
    t_salaries;

SELECT 
    *
FROM
    t_dept_emp;

SELECT 
    *
FROM
    t_departments;
    
-- let's see what is min and max salary value --

SELECT 
    MIN(salary)
FROM
    t_salaries;
    
SELECT 
    MAX(salary)
FROM
    t_salaries;
    
-- Knowing from our boss that there have not been many people who have earned less than $50,000 or more than $90,000.
-- We are going to exclude salaries < 50K and salaries > 90K

-- This is the select statement we are going to use in order to create stored procedure --

SELECT 
    e.gender AS gender,
    d.dept_name AS dept_name,
    AVG(s.salary) AS avg_salary
FROM
    t_employees e
        JOIN
    t_salaries s ON e.emp_no = s.emp_no
        JOIN
    t_dept_emp de ON s.emp_no = de.emp_no
        JOIN
    t_departments d ON de.dept_no = d.dept_no
WHERE
    s.salary BETWEEN 50000 AND 90000
GROUP BY e.gender , d.dept_name;

-- create the desired stored procedure --

DROP PROCEDURE IF EXISTS filter_salary;

DELIMITER $$

CREATE PROCEDURE filter_salary(IN p_min_salary FLOAT, IN p_max_salary FLOAT)

BEGIN

	SELECT 
		e.gender AS gender,
		d.dept_name AS dept_name,
		AVG(s.salary) AS avg_salary
	FROM
		t_employees e
			JOIN
		t_salaries s ON e.emp_no = s.emp_no
			JOIN
		t_dept_emp de ON s.emp_no = de.emp_no
			JOIN
		t_departments d ON de.dept_no = d.dept_no
	WHERE
		s.salary BETWEEN p_min_salary AND p_max_salary
	GROUP BY e.gender , d.dept_name;

END$$

DELIMITER ;

CALL filter_salary(50000, 90000);
    
 
-- The visualization can be found there --
https://public.tableau.com/app/profile/alex6736/viz/SQLTableaue-Task1/Filter_AVG_Salary?publish=yes
    
    
    
    
    