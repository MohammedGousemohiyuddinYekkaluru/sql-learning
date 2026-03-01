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

-- ###########################################################
-- #                        FILTERING                        #
-- ###########################################################

/* ==============================================================================
   Tip 4: Create nonclustered Index on frequently used Columns in WHERE clause
===============================================================================*/

SELECT *
FROM Sales.Orders
WHERE OrderStatus = 'Delivered';

CREATE NONCLUSTERED INDEX Idx_Orders_OrderStatus ON Sales.Orders(OrderStatus)

/* ==============================================================================
   Tip 5: Avoid applying functions to columns in WHERE clauses
===============================================================================*/

-- Bad Practice
SELECT * FROM Sales.Orders 
WHERE LOWER(OrderStatus) = 'delivered'

-- Good Practice
SELECT * FROM Sales.Orders 
WHERE OrderStatus = 'Delivered'
---------------------------------------------------------
-- Bad Practice
SELECT * 
FROM Sales.Customers
WHERE SUBSTRING(FirstName, 1, 1) = 'A'

-- Good Practice
SELECT * 
FROM Sales.Customers
WHERE FirstName LIKE 'A%'
---------------------------------------------------------
-- Bad Practice
SELECT * 
FROM Sales.Orders 
WHERE YEAR(OrderDate) = 2025

-- Good Practice
SELECT * 
FROM Sales.Orders 
WHERE OrderDate BETWEEN '2025-01-01' AND '2025-12-31'

/* ==============================================================================
   Tip 6: Avoid leading wildcards as they prevent index usage
===============================================================================*/

-- Bad Practice
SELECT * 
FROM Sales.Customers 
WHERE LastName LIKE '%Gold%'

-- Good Practice
SELECT * 
FROM Sales.Customers 
WHERE LastName LIKE 'Gold%'

/* ==============================================================================
   Tip 7: Use IN instead of Multiple OR
===============================================================================*/

-- Bad Practice
SELECT * 
FROM Sales.Orders
WHERE CustomerID = 1 OR CustomerID = 2 OR CustomerID = 3

-- Good Practice
SELECT * 
FROM Sales.Orders
WHERE CustomerID IN (1, 2, 3)
