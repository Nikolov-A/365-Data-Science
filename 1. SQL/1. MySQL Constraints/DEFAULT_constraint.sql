### ASSIGNMENT ###

/* 
------ 1 ------
Recreate the “companies” table

(company_id – VARCHAR of 255,  

company_name – VARCHAR of 255,  

headquarters_phone_number – VARCHAR of 255),    

This time setting the “headquarters phone number” to be the unique key, and default value of the company's name to be “X”.   
*/ 

DROP TABLE IF EXISTS companies;

-- Method 1 --
CREATE TABLE IF NOT EXISTS companies
(
	company_id VARCHAR(255),
    company_name VARCHAR(255) DEFAULT 'X',
    headquarters_phone_number VARCHAR(255),
PRIMARY KEY (company_id),
UNIQUE KEY (headquarters_phone_number)
);

-- Method 2--
CREATE TABLE IF NOT EXISTS companies
(
	company_id VARCHAR(255),
    company_name VARCHAR(255),
    headquarters_phone_number VARCHAR(255),
PRIMARY KEY (company_id)
);

ALTER TABLE companies
ADD UNIQUE KEY (headquarters_phone_number),
CHANGE COLUMN company_name company_name VARCHAR(255) DEFAULT 'X';


/*

------ 2 ------
After you execute the code properly, drop the “companies” table.

*/

DROP TABLE companies;
