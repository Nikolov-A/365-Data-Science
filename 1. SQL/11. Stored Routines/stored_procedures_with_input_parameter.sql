-- following the lecture --

-- Create stored procedure that returns the name, salary, start date, and end date of each contracts for specific employee --

DROP PROCEDURE IF EXISTS emp_salary;

DELIMITER $$

CREATE PROCEDURE emp_salary(IN p_emp_no INTEGER)

BEGIN
		SELECT 
			e.first_name, e.last_name, s.salary, s.from_date, s.to_date
		FROM
			employees e
				JOIN
			salaries s ON e.emp_no = s.emp_no
		WHERE
			e.emp_no = p_emp_no;
			
    END$$

DELIMITER ;

-- check --

call emp_salary(11300);

-- Create stored procedure that returns the avg salary for specific employee --

SELECT 
    round(AVG(salary),2)
FROM
    salaries
WHERE
    emp_no = 11300;

DROP PROCEDURE IF EXISTS emp_avg_salary;

DELIMITER $$

CREATE PROCEDURE emp_avg_salary(IN p_emp_no INTEGER)

BEGIN
		SELECT 
			round(AVG(salary),2)
		FROM
			salaries
		WHERE
			emp_no = p_emp_no; 
END$$

DELIMITER ;

-- check --

CALL emp_avg_salary(11300);