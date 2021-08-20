-- following the lecture --

-- create a stored procedure that return the first 1,000 rows from the 'employees' table --

-- Step 1. -> create a desired query --

SELECT 
    *
FROM
    employees
LIMIT 1000;

-- Step 2. -> put this query inside a stored procedure --

DROP PROCEDURE IF EXISTS select_employees;

DELIMITER $$ 
CREATE PROCEDURE select_employees() 
BEGIN 

		SELECT * FROM employees 
		LIMIT 1000; 
        
END$$ 

DELIMITER ;

-- Step 3. -> Check --

CALL employees.select_employees();
CALL select_employees();
CALL select_employees; -- <- it's not a good practice, because it's not clear what kind of object is that!