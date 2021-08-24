## Hackerrank exercises but in the context of `employee database`###


/* 
------ 1 ------
https://www.hackerrank.com/challenges/weather-observation-station-6/problem

Query the list of employees' first_name starting with vowels (i.e., a, e, i, o, or u) from employees. 
Your result cannot contain duplicates.

*/

USE employees;

-- Solution 1 --
SELECT DISTINCT
    first_name
FROM
    employees
WHERE
    first_name LIKE ('a%')
        OR first_name LIKE ('e%')
        OR first_name LIKE ('i%')
        OR first_name LIKE ('o%')
        OR first_name LIKE ('u%');
    
-- Solution 2 --

SELECT 
    first_name
FROM
    employees
WHERE
    first_name LIKE ('a%')
        OR first_name LIKE ('e%')
        OR first_name LIKE ('i%')
        OR first_name LIKE ('o%')
        OR first_name LIKE ('u%')
GROUP BY first_name; 

-- Solution 3 --

SELECT DISTINCT
    first_name
FROM
    employees
WHERE
    first_name REGEXP '^[aeiou]';
    
-- Solution 4 --

SELECT 
    first_name
FROM
    employees
WHERE
    first_name REGEXP '^[aeiou]'
GROUP BY first_name;
    
