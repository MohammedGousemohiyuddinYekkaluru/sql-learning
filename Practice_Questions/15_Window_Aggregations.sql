select * from Sales
select * from Products

/*
Task 1: The "Percent of Store" Calculation
Management wants to know how "heavy" each sale is compared to the total volume of its store.
Goal: For each sale, show the sale_id, store_location, and quantity_sold.
Create a column called Percent_Of_Store.
*/

SELECT
	sale_id,
	store_location,
	quantity_sold,
	SUM(quantity_sold) OVER(PARTITION BY store_location) Total_Store_Quantity,
	ROUND(CAST(quantity_sold AS FLOAT) / SUM(quantity_sold) OVER(PARTITION BY store_location) * 100, 2) Percent_Of_Store
FROM Sales;

