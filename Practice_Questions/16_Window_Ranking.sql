
SELECT * FROM Products
/*
Task 1: The "Tie-Breaker" Challenge
We have several sales in our data. Let's see how different functions handle them.
Show: sale_id, quantity_sold.
Column 1 (Unique_Rank)
Column 2 (Olympic_Rank)
Column 3 (Dense_Rank)
*/

SELECT
	sale_id,
	quantity_sold,
	ROW_NUMBER() OVER(ORDER BY quantity_sold DESC) Unique_Rank,
	Rank() OVER(ORDER BY quantity_sold DESC) Olympic_Rank,
	DENSE_RANK() OVER(ORDER BY quantity_sold DESC) Dense_Rank
FROM Sales;


/*
Task 2: De-Duplication
Imagine a bug caused the same product to be entered into the Products table twice.
*/

SELECT *
FROM
(SELECT
	*,
	ROW_NUMBER() OVER (PARTITION BY product_name ORDER BY stock_quantity DESC) Row_number
FROM Products)t
WHERE Row_number = 1;


/*
Task 3: The "Elite 50%"
Goal: Identify products that are in the top 50% of our price list.
Show: product_name, price, and a column called Price_Percentile.
Filter: Only show products where the Price_Percentile is less than or equal to 50%.
*/

SELECT
	*
FROM
(SELECT
	product_name,
	price,
	ROUND(CUME_DIST() OVER(ORDER BY price DESC), 2) Price_Percentile
FROM Products)t
WHERE Price_Percentile <= 0.5;