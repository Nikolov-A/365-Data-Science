## ASSIGNMENT ###

/* 
------ 1 ------

Select ten records from the “titles” table to get a better idea about its content.

*/

SELECT 
    *
FROM
    titles
LIMIT 10;

/* 
------ 2 ------

Then, in the same table, insert information about employee number 999903. State that he/she is a “Senior Engineer”, who has started working in this position on October 1st, 1997.

*/

INSERT INTO titles
(	
	emp_no,
	title,
    from_date
)
VALUES
(
	999903,
	'Senior Engineer',
	'1997-10-01'
);


/* 
------ 3 ------

At the end, sort the records from the “titles” table in descending order to check if you have successfully inserted the new record.
Hint: To solve this exercise, you’ll need to insert data in only 3 columns!

*/

SELECT 
    *
FROM
    titles
ORDER BY emp_no DESC;