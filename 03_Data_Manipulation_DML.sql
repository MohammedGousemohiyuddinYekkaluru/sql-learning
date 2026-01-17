/*   Table of Contents:
     1. INSERT - Adding Data to Tables
     2. UPDATE - Modifying Existing Data
     3. DELETE - Removing Data from Tables
=================================================================================
*/

/* ============================================================================== 
   INSERT
=============================================================================== */
/* #1 Method: Manual INSERT using VALUES */
-- Insert new records into the customers table
INSERT INTO customers (id, first_name, country, score)
VALUES 
    (6, 'Anna', 'USA', NULL),
    (7, 'Sam', NULL, 100);

SELECT * FROM CUSTOMERS;

INSERT INTO customers (id, first_name, country, score)
VALUES 
    (8, 'Max', 'USA', NULL);
    
-- Incorrect data type in values
INSERT INTO customers (id, first_name, country, score)
VALUES 
	('Max', 9, 'Max', NULL);

-- Insert a new record with full column values
INSERT INTO customers (id, first_name, country, score)
VALUES (8, 'Max', 'USA', 368);

-- Insert a new record without specifying column names (not recommended)
INSERT INTO customers 
VALUES 
    (9, 'Andreas', 'Germany', NULL);
    
-- Insert a record with only id and first_name (other columns will be NULL or default values)
INSERT INTO customers (id, first_name)
VALUES 
    (10, 'Sahra');
    
/* #2 Method: INSERT DATA USING SELECT - Moving Data From One Table to Another */
-- Copy data from the 'customers' table into 'persons'
CREATE TABLE persons(
	id INT NOT NULL,
    person_name VARCHAR(30) NOT NULL,
    country VARCHAR(15),
    score INT
);

INSERT INTO persons (id, person_name, country, score)
SELECT
    id,
    first_name,
    country,
    score
FROM customers;

SELECT * FROM persons;

