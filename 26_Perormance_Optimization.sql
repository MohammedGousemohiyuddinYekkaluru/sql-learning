/* ==============================================================================
   30x SQL Performance Tips
-------------------------------------------------------------------------------
   This section demonstrates best practices for fetching data, filtering,
   joins, UNION, aggregations, subqueries/CTE, DDL, and indexing.
   It covers techniques such as selecting only necessary columns,
   proper filtering methods, explicit joins, avoiding redundant logic,
   and efficient indexing strategies.
   
   Table of Contents:
     1. FETCHING DATA
     2. FILTERING
     3. JOINS
     4. UNION
     5. AGGREGATIONS
     6. SUBQUERIES, CTE
     7. DDL
     8. INDEXING
===============================================================================
*/

-- ###############################################################
-- #                        FETCHING DATA                        #
-- ###############################################################

-- ============================================
-- Tip 1: Select Only What You Need
-- ============================================

-- Bad Practice
SELECT * FROM Sales.Customers

-- Good Practice
SELECT CustomerID, FirstName, LastName FROM Sales.Customers

-- ============================================
-- Tip 2: Avoid unnecessary DISTINCT & ORDER BY
-- ============================================

-- Bad Practice
SELECT DISTINCT 
	FirstName 
FROM Sales.Customers 
ORDER BY FirstName

-- Good Practice
SELECT 
	FirstName 
FROM Sales.Customers

-- ============================================
-- Tip 3: For Exploration Purpose, Limit Rows!
-- ============================================

-- Bad Practice
SELECT 
	OrderID,
	Sales 
FROM Sales.Orders

-- Good Practice
SELECT TOP 10 
	OrderID,
	Sales 
FROM Sales.Orders
