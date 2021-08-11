### ASSIGNMENT ###

/* 
------ 1 ------
Using ALTER TABLE, first add the NOT NULL constraint to the headquarters_phone_number field in the "companies" table, and then drop that same constraint.
*/ 

DROP TABLE IF EXISTS companies;

CREATE TABLE IF NOT EXISTS companies
(
	company_id VARCHAR(255),
    company_name VARCHAR(255),
    headquarters_phone_number VARCHAR(255),
PRIMARY KEY (company_id)
);


ALTER TABLE companies
CHANGE COLUMN headquarters_phone_number headquarters_phone_number VARCHAR(255) NOT NULL;

ALTER TABLE companies
MODIFY headquarters_phone_number VARCHAR(255) NULL;