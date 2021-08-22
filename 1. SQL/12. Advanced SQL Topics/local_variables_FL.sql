-- following the lecture --

-- Local Variables --

DROP FUNCTION IF EXISTS f_emp_avg_salary;

DELIMITER $$

CREATE FUNCTION f_emp_avg_salary(p_emp_no INTEGER) RETURNS DECIMAL(10,2)

BEGIN

DECLARE v_avg_salary DECIMAL(10,2);
-- declaring variable within begin-end block is visible only in declared begin-end block and can't be visible outside it --
BEGIN 
	DECLARE v_avg_salary_2 DECIMAL (10,2);
END;

SELECT 
    AVG(s.salary)
INTO v_avg_salary_2 FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;

RETURN v_avg_salary_2;

END$$

DELIMITER ;
