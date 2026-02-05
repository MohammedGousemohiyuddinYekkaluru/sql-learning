/* ==============================================================================
   SQL Window Functions
-------------------------------------------------------------------------------
   SQL window functions enable advanced calculations across sets of rows 
   related to the current row without resorting to complex subqueries or joins.
   This script demonstrates the fundamentals and key clauses of window functions,
   including the OVER, PARTITION, ORDER, and FRAME clauses, as well as common rules 
   and a GROUP BY use case.

   Table of Contents:
     1. SQL Window Basics
     2. SQL Window OVER Clause
     3. SQL Window PARTITION Clause
     4. SQL Window ORDER Clause
     5. SQL Window FRAME Clause
     6. SQL Window Rules
     7. SQL Window with GROUP BY
=================================================================================
*/

/* ==============================================================================
   SQL WINDOW FUNCTIONS | BASICS
===============================================================================*/

/* TASK 1: 
   Calculate the Total Sales Across All Orders 
*/
SELECT
    SUM(Sales) AS Total_Sales
FROM Sales.Orders;

/* TASK 2: 
   Calculate the Total Sales for Each Product 
*/
SELECT 
    ProductID,
    SUM(Sales) AS Total_Sales
FROM Sales.Orders
GROUP BY ProductID;