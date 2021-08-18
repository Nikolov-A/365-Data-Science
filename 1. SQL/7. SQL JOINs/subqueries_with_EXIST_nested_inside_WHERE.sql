## ASSIGNMENT ###

/* 
------ 1 ------

Select the entire information for all employees whose job title is "Assistant Engineer".

Hint: To solve this exercise, use the 'employees' table.
*/

SELECT 
    *
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            titles t
        WHERE
            e.emp_no = t.emp_no
                AND t.title = 'Assistant Engineer');
                