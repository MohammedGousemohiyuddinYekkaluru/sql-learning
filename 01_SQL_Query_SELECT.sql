/* ==============================================================================
   SELECT ALL COLUMNS
=============================================================================== */

-- Retrieve All Customer Data
SELECT * 
FROM customers;

-- Retrieve All Order Data
SELECT * 
FROM orders;

/* ==============================================================================
   SELECT FEW COLUMNS
=============================================================================== */

-- Retrieve each customer's name, country, and score.
SELECT 
	first_name,
	country, 
	score
FROM customers;