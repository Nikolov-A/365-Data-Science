-- following the lecture --

SELECT 
    *
FROM
    dept_emp;
    
    
CREATE OR REPLACE VIEW v_dept_emp_latest_date AS
SELECT 
    emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
FROM
    dept_emp
GROUP BY emp_no;
