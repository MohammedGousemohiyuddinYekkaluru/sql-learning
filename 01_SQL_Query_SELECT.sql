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

/* ==============================================================================
   WHERE
=============================================================================== */

-- Retrieve customers with a score not equal to 0
SELECT *
FROM customers
WHERE score != 0;

-- Retrieve customers from Germany
SELECT *
FROM customers
WHERE country = 'Germany';

-- Retrieve the name and country of customers from Germany
SELECT 
	first_name,
    country
FROM customers
WHERE country = 'Germany';

/* ==============================================================================
   ORDER BY
=============================================================================== */

/* Retrieve all customers and 
   sort the results by the highest score first. */
SELECT *
FROM customers
ORDER BY score DESC;

/* Retrieve all customers and 
   sort the results by the lowest score first. */
SELECT *
FROM customers
ORDER BY score ASC; /* using ASC or not is optional it is by default ascending order */

/* Retrieve all customers and 
   sort the results by the country. */
SELECT *
FROM customers
ORDER BY country;

/* Retrieve all customers and 
   sort the results by the country and then by the highest score. */
SELECT *
FROM customers
ORDER BY country, score DESC;

/* Retrieve the name, country, and score of customers 
   whose score is not equal to 0
   and sort the results by the highest score first. */
SELECT 
	first_name,
    country,
    score
FROM customers
WHERE score != 0
ORDER BY score DESC;