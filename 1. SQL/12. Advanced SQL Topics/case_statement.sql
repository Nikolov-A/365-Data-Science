## ASSIGNMENT ###


/* 
------ 1 ------

Similar to the exercises done in the lecture, obtain a result set containing the employee number, first name, and last name of all employees with a number higher than 109990.
Create fourth column in the query, indicating whether this employee is also a manager, acording to the data provided in the dept_manager table, or a regular employee.

*/

SELECT 
    e.emp_no, 
    e.first_name, 
    e.last_name,
    CASE 
		WHEN dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employee'
	END AS is_manager
FROM
    employees e
		LEFT JOIN
	dept_manager dm on e.emp_no = dm.emp_no
WHERE
    e.emp_no > 109990;

/* 
------ 2 ------

Extract a dataset conaining the following information about the managers: employee number, first name and last name.
Add two columns at the end:
- one showing the difference between the maximum and minimum salary of that employee, 
- and another one saying whether this salary raise was higher than $30,000 or NOT.

If possible, provide more than one solution

*/

SELECT 
    dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    CASE
        WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary rise was higher than $30,000'
        ELSE 'Salary rise was lower or equal to $30,000'
    END AS salary_increase
FROM
    dept_manager dm
        JOIN
    salaries s ON dm.emp_no = s.emp_no
        JOIN
    employees e ON dm.emp_no = e.emp_no
GROUP BY e.emp_no;
		

-- Solution 2 --

SELECT 
    dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    IF(MAX(s.salary) - MIN(s.salary) > 30000,
        'Salary rise was higher than $30,000',
        'Salary rise was lower or euqal to $30,000') AS salary_increase
FROM
    dept_manager dm
        JOIN
    salaries s ON dm.emp_no = s.emp_no
        JOIN
    employees e ON dm.emp_no = e.emp_no
GROUP BY e.emp_no;



/* 
------ 3 ------

Extract the employee number, first_name, and last_name of the first 100 employees, and add a fourth column, called `current_employee` 
saying `is still employed` if the employee is still workiing in the company, 
or `Not an employee anymore` if they aren't.

Hint: You'll need to use data from both the 'employees' and the 'dept_emp' table to solve this exercise'

*/

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    IF(de.to_date > SYSDATE(),
        'still employed',
        'Not an employee anymore') AS current_employee
FROM
    employees e
        JOIN
    dept_emp de ON e.emp_no = de.emp_no
GROUP BY de.emp_no
LIMIT 100;

-- SOLUTION 2 --

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN MAX(de.to_date) > SYSDATE() THEN 'still employed'
        ELSE 'Not an employee anymore'
    END AS current_employee
FROM
    employees e
        JOIN
    dept_emp de ON e.emp_no = de.emp_no
GROUP BY de.emp_no
LIMIT 100;
