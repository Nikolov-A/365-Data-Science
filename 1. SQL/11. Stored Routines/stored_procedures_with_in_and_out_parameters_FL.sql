-- following the lecture -- 

-- create a procedure which takes emp_no as input and gives avg salary for this employee as output --

DROP PROCEDURE IF EXISTS emp_avg_salary_out; -- we type _out just to distinct from the old one procedure --

DELIMITER $$

CREATE PROCEDURE emp_avg_salary_out(in p_emp_no INTEGER, out p_avg_salary DECIMAL(10,2))

BEGIN
		SELECT 
			AVG(s.salary)
		INTO p_avg_salary
		FROM
			employees e
				JOIN
			salaries s ON e.emp_no = s.emp_no
		WHERE
			e.emp_no = p_emp_no;
END$$

DELIMITER ;
			