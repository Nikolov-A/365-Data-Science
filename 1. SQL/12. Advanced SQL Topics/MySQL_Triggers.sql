## ASSIGNMENT ###

COMMIT;

/* 
------ 1 ------

Create a trigger that checks if the hire date of an employee is higher than the current date. 
If true, set this date to be the current date. 
Format the output appropriately (YY-MM-DD).

*/

DELIMITER $$

CREATE TRIGGER before_employees_insert
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN 
	IF NEW.hire_date > DATE_FORMAT(SYSDATE(), '%Y-%m-%d') THEN 
		SET NEW.hire_date = DATE_FORMAT(SYSDATE(), '%Y-%m-%d'); 
	END IF; 
END $$

DELIMITER ;

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC;

INSERT INTO employees VALUES ('999904', '1977-09-30', 'Aleksandar', 'Nikolov', 'M', '9999-01-01');

DELETE FROM employees 
WHERE
    emp_no = '999904';
    
ROLLBACK;