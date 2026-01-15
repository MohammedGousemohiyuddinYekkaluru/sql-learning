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

/* ==============================================================================
   GROUP BY
=============================================================================== */

-- Find the total score for each country
SELECT
	country,
    SUM(score) AS total_score
FROM customers
GROUP BY country;

SELECT
	country,
    first_name,
    SUM(score) AS total_score
FROM customers
GROUP BY country;
/* This will not work because 'first_name' is neither part of the GROUP BY 
   nor wrapped in an aggregate function. SQL doesn't know how to handle this column. */

-- Find the total score and total number of customers for each country
SELECT
	country,
    SUM(score) AS total_score,
    COUNT(id) AS total_customers
FROM customers
GROUP BY country;

/* ==============================================================================
   HAVING
=============================================================================== */

/* Find the average score for each country
   and return only those countries with an average score greater than 430 */
SELECT 
	 country,
     AVG(score) as avg_score
FROM customers
GROUP BY country
HAVING avg_score > 430;

/* Find the average score for each country
   considering only customers with a score not equal to 0
   and return only those countries with an average score greater than 430 */
SELECT 
	 country,
     AVG(score) as avg_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING avg_score > 430;

/* ==============================================================================
   DISTINCT
=============================================================================== */

-- Return Unique list of all countries
SELECT DISTINCT country
FROM customers;

/* ==============================================================================
   LIMIT
=============================================================================== */

-- Retrieve only 3 Customers
SELECT *
FROM customers
LIMIT 3;

-- Retrieve the Top 3 Customers with the Highest Scores
SELECT *
FROM customers
ORDER BY score DESC
LIMIT 3;

-- Retrieve the Lowest 2 Customers based on the score
SELECT *
FROM customers
ORDER BY score
LIMIT 2;

-- Get the Two Most Recent Orders
SELECT *
FROM orders
ORDER BY order_date DESC
LIMIT 2;