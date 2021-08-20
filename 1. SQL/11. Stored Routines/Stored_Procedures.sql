## ASSIGNMENT ###

/* 
------ 1 ------

Create a procedure that will provide the average salary of all employees.
Then, call the procedure.

*/

SELECT 
    ROUND(AVG(salary), 2)
FROM
    salaries;
    
DROP PROCEDURE IF EXISTS avg_salary;

DELIMITER $$

CREATE PROCEDURE avg_salary()

BEGIN
	SELECT 
		ROUND(AVG(salary), 2)
	FROM
		salaries;
END$$

DELIMITER ;

CALL avg_salary();