/* ==============================================================================
   SQL AI Prompts for SQL
-------------------------------------------------------------------------------
   This script contains a series of prompts designed to help both SQL developers 
   and anyone interested in learning SQL improve their skills in writing, 
   optimizing, and understanding SQL queries. The prompts cover a variety of 
   topics, including solving SQL tasks, enhancing query readability, performance 
   optimization, debugging, and interview/exam preparation. Each section provides 
   clear instructions and sample code to facilitate self-learning and practical 
   application in real-world scenarios.

   Table of Contents:
     1. Solve an SQL Task
     2. Improve the Readability
     3. Optimize the Performance Query
     4. Optimize Execution Plan
     5. Debugging
     6. Explain the Result
     7. Styling & Formatting
     8. Documentations & Comments
     9. Improve Database DDL
    10. Generate Test Dataset
    11. Create SQL Course
    12. Understand SQL Concept
    13. Comparing SQL Concepts
    14. SQL Questions with Options
    15. Prepare for a SQL Interview
    16. Prepare for a SQL Exam
=================================================================================
*/

/* ==============================================================================
   1. Solve an SQL Task
=================================================================================

In my SQL Server database, we have two tables:
The first table is `orders` with the following columns: order_id, sales, customer_id, product_id.
The second table is `customers` with the following columns: customer_id, first_name, last_name, country.
Do the following:
	- Write a query to rank customers based on their sales.
	- The result should include the customer's customer_id, full name, country, total sales, and their rank.
	- Include comments but avoid commenting on obvious parts.
	- Write three different versions of the query to achieve this task.
	- Evaluate and explain which version is best in terms of readability and performance
*/