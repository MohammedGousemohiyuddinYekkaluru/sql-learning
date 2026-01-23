/* ============================================================================== 
   SQL Filtering Data
-------------------------------------------------------------------------------
   This document provides an overview of SQL filtering techniques using WHERE 
   and various operators for precise data retrieval.

   Table of Contents:
     1. Comparison Operators
        - =, <>, >, >=, <, <=
     2. Logical Operators
        - AND, OR, NOT
     3. Range Filtering
        - BETWEEN
     4. Set Filtering
        - IN
     5. Pattern Matching
        - LIKE
=================================================================================
*/

/* ============================================================================== 
   COMPARISON OPERATORS
=============================================================================== */

-- Retrieve all customers from Germany.
SELECT *
FROM customers
WHERE country = "Germany";

-- Retrieve all customers who are not from Germany.
SELECT *
FROM customers
WHERE country != "Germany"; -- we can also use "<>" this symbol for showing not equal to

-- Retrieve all customers with a score greater than 500.
SELECT *
FROM customers
WHERE score > 500;

-- Retrieve all customers with a score of 500 or more.
SELECT *
FROM customers
WHERE score >= 500;

-- Retrieve all customers with a score less than 500.
SELECT *
FROM customers
WHERE score < 500;

-- Retrieve all customers with a score of 500 or less.
SELECT *
FROM customers
WHERE score <= 500;

/* ============================================================================== 
   LOGICAL OPERATORS
=============================================================================== */

/* Combining conditions using AND, OR, and NOT */

-- Retrieve all customers who are from the USA and have a score greater than 500.
SELECT *
FROM customers
WHERE country = "USA" AND score > 500;

-- Retrieve all customers who are either from the USA or have a score greater than 500.
SELECT *
FROM customers
WHERE country = "USA" OR score > 500;

-- Retrieve all customers with a score not less than 500.
SELECT *
FROM customers
WHERE NOT score < 500;


