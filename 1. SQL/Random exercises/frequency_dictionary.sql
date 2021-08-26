/* 

Create a word frequency table containing the following columns:

- id
- word
- frequency


 */
 USE employees;
 
 DROP TABLE IF EXISTS words;
 
 CREATE TABLE words
 (
	id INT AUTO_INCREMENT,
    word VARCHAR(255),
    frequency INT NOT NULL,
PRIMARY KEY (id),
UNIQUE KEY (word)

);

-- insert random value --

INSERT INTO words 
(	
	word,
	frequency)
VALUES
(
	'pesho',
    3
);

-- insert duplicated value  --
-- in this case our frequency value will be updated + 1 if we try to insert duplicated value-- 
INSERT INTO words
(
    word,
    frequency
)
VALUES
(
	'pesho',
    5
)
ON DUPLICATE KEY UPDATE
	frequency = frequency + 1;




