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