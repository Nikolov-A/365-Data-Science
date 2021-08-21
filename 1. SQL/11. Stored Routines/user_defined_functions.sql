## ASSIGNMENT ###

/* 
------ 1 ------

Create a function called "emp_info" that takes for parameters the first and last name of an employee, and returns the salary from the newest contract of that employee.

Hint: 
In the BEGIN-END block of this program, you need to declare and use two variables: 
- v_max_from_date that will be of the DATE type, and 
- v_salary, that will be of the DECIMAL (10,2) type.

Finally, select this function.

*/
--

-- 1 step - take the beigining of the latest contract --
SELECT 
    MAX(from_date)
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = 'Aruna'
        AND e.last_name = 'Journel';

-- 2 step - take the salary according to first name, last name and latest contract --
SELECT 
    s.salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = 'Georgi'
        AND e.last_name = 'Facello'
        AND s.from_date = '2002-06-22';
        


-- step 3 create function --

DROP FUNCTION IF EXISTS f_emp_info;


DELIMITER $$

CREATE FUNCTION f_emp_info(p_first_name VARCHAR(255), p_last_name VARCHAR(255)) RETURNS DECIMAL(10,2)

BEGIN

	DECLARE v_max_from_date DATE; -- keeps the latest contract date
	DECLARE v_salary DECIMAL(10,2); -- keeps the salary --
	
SELECT 
    MAX(from_date)
INTO v_max_from_date FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name;
		
SELECT 
    s.salary
INTO v_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name
        AND s.from_date = v_max_from_date;
           
               RETURN v_salary;
END$$

DELIMITER ;

-- check --

SELECT f_emp_info('Aruna', 'Verspoor');


############# METHOD 2 ###########

-- create desired query --

SELECT 
    s.salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = 'Aruna'
        AND e.last_name = 'Verspoor'
        AND s.from_date IN (SELECT -- table with all salaries for all contracts -- 
            MAX(from_date)
        FROM
            employees e
                JOIN
            salaries s ON e.emp_no = s.emp_no
        GROUP BY e.emp_no)
ORDER BY salary DESC
LIMIT 1;

-- create function --

DROP FUNCTION IF EXISTS f_emp_info_2;

DELIMITER $$
				
CREATE FUNCTION f_emp_info_2(p_first_name VARCHAR(255), p_last_name VARCHAR(255)) RETURNS DECIMAL(10,2)

BEGIN

	DECLARE v_salary DECIMAL(10,2);

SELECT 
    s.salary
INTO v_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name
        AND s.from_date IN (SELECT 
            MAX(from_date)
        FROM
            employees e
                JOIN
            salaries s ON e.emp_no = s.emp_no
        GROUP BY e.emp_no)
ORDER BY salary DESC
LIMIT 1;

	
               RETURN v_salary;
END$$

DELIMITER ;


-- check --

SELECT F_EMP_INFO_2('Aruna', 'Verspoor');
