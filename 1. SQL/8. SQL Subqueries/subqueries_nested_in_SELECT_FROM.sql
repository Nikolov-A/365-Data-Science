## ASSIGNMENT ###

/* 
------ 1 ------

Starting your code with “DROP TABLE”, create a table called “emp_manager”:
(emp_no – integer of 11, not null; 
dept_no – CHAR of 4, null; 
manager_no – integer of 11, not null). 

*/

USE employees;

DROP TABLE IF EXISTS emp_manager;
CREATE TABLE emp_manager (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    manager_no INT(11) NOT NULL
);

/* 
------ 2 ------

Fill emp_manager with data about employees, the number of the department they are working in, and their managers. 


Your query skeleton must be:

Insert INTO emp_manager SELECT
U.*
FROM
                (A)
UNION (B) UNION (C) UNION (D) AS U;

A and B should be the same subsets used in the last lecture (SQL Subqueries Nested in SELECT and FROM). 
In other words, assign employee number 110022 as a manager to all employees from 10001 to 10020 (this must be subset A), and employee number 110039 as a manager to all employees from 10021 to 10040 (this must be subset B).

Use the structure of subset A to create subset C, where you must assign employee number 110039 as a manager to employee 110022.

Following the same logic, create subset D. Here you must do the opposite - assign employee 110022 as a manager to employee 110039.
Your output must contain 42 rows.

*/


/* 
------ 2.1 ------

Create subset(A)
Assign employee number 110022 as a manager to all employees from 10001 to 10020 (this must be subset A)

*/

SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS emp_no,
            MIN(de.dept_no) AS dept_no,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_no
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A; 

/* 
------ 2.2 ------

Create subset(B)
employee number 110039 as a manager to all employees from 10021 to 10040 (this must be subset B)

*/

SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS emp_no,
            MIN(de.dept_no) AS dept_no,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_no
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS B; 

/* 
------ 2.3 ------

Create subset(C)
Use the structure of subset A to create subset C, where you must assign employee number 110039 as a manager to employee 110022.

*/

SELECT 
    C.*
FROM
    (SELECT 
        e.emp_no AS emp_no,
            MIN(de.dept_no) AS dept_no,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_no
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS C;
    

/* 
------ 2.4 ------

Create subset(D)
Following the same logic, create subset D. 
Here you must do the opposite - assign employee 110022 as a manager to employee 110039.

*/


SELECT 
    D.*
FROM
    (SELECT 
        e.emp_no AS emp_no,
            MIN(de.dept_no) AS dept_no,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_no
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS D;


/* 
------ 2.5 ------

Combining all the table A,B,C,D

*/

SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS emp_no,
            MIN(de.dept_no) AS dept_no,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_no
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A 
UNION SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS emp_no,
            MIN(de.dept_no) AS dept_no,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_no
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS B 
UNION SELECT 
    C.*
FROM
    (SELECT 
        e.emp_no AS emp_no,
            MIN(de.dept_no) AS dept_no,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_no
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS C 
UNION SELECT 
    D.*
FROM
    (SELECT 
        e.emp_no AS emp_no,
            MIN(de.dept_no) AS dept_no,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_no
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS D;
    
/* 
------ 2.6 ------

Fill emp_manager with data about employees, the number of the department they are working in, and their managers. 

*/

INSERT INTO emp_manager 
SELECT
	U.*
FROM
	(SELECT 
		A.*
	FROM
		(SELECT 
			e.emp_no AS emp_no,
				MIN(de.dept_no) AS dept_no,
				(SELECT 
						emp_no
					FROM
						dept_manager
					WHERE
						emp_no = 110022) AS manager_no
		FROM
			employees e
		JOIN dept_emp de ON e.emp_no = de.emp_no
		WHERE
			e.emp_no <= 10020
		GROUP BY e.emp_no
		ORDER BY e.emp_no) AS A 
	UNION SELECT 
		B.*
	FROM
		(SELECT 
			e.emp_no AS emp_no,
				MIN(de.dept_no) AS dept_no,
				(SELECT 
						emp_no
					FROM
						dept_manager
					WHERE
						emp_no = 110039) AS manager_no
		FROM
			employees e
		JOIN dept_emp de ON e.emp_no = de.emp_no
		WHERE
			e.emp_no > 10020
		GROUP BY e.emp_no
		ORDER BY e.emp_no
		LIMIT 20) AS B 
	UNION SELECT 
		C.*
	FROM
		(SELECT 
			e.emp_no AS emp_no,
				MIN(de.dept_no) AS dept_no,
				(SELECT 
						emp_no
					FROM
						dept_manager
					WHERE
						emp_no = 110039) AS manager_no
		FROM
			employees e
		JOIN dept_emp de ON e.emp_no = de.emp_no
		WHERE
			e.emp_no = 110022
		GROUP BY e.emp_no
		ORDER BY e.emp_no) AS C 
	UNION SELECT 
		D.*
	FROM
		(SELECT 
			e.emp_no AS emp_no,
				MIN(de.dept_no) AS dept_no,
				(SELECT 
						emp_no
					FROM
						dept_manager
					WHERE
						emp_no = 110022) AS manager_no
		FROM
			employees e
		JOIN dept_emp de ON e.emp_no = de.emp_no
		WHERE
			e.emp_no = 110039
		GROUP BY e.emp_no
		ORDER BY e.emp_no) AS D) AS U;

-- check -- 
SELECT 
    *
FROM
    emp_manager;
