## ASSIGNMENT ###

/* 
------ 1 ------

Create a procedure called "emp_info" that uses as parameters the first and the last name of an individual, and returns their employee number.

*/

DROP PROCEDURE IF EXISTS emp_info;

DELIMITER $$

CREATE PROCEDURE emp_info(in p_first_name VARCHAR(14), in p_last_name VARCHAR(16), out p_emp_no INTEGER)

BEGIN
		SELECT
			e.emp_no
		INTO p_emp_no
		FROM
			employees e
		WHERE
			e.first_name = p_first_name
				AND
			e.last_name = p_last_name;

END$$


DELIMITER ;

-- create a stored procedure that takes first and last name and return table with emp_no --

DROP PROCEDURE IF EXISTS test_emp_info;

DELIMITER $$

CREATE PROCEDURE test_emp_info(in p_first_name VARCHAR(14), in p_last_name VARCHAR(16))

BEGIN
		SELECT
			emp_no
		FROM
			employees
		WHERE
			first_name = p_first_name
				AND
			last_name = p_last_name;

END$$


DELIMITER ;

SELECT 
    emp_no
FROM
    employees
WHERE
    first_name = 'Georgi'
        AND last_name = 'Facello';