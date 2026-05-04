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


/*
Task 2: The "Above Average" Filter
We need to find individual sales that performed better than the company-wide average.
Goal: Return all columns from the Sales table, but only for rows where the quantity_sold is higher than the average quantity_sold of the entire table.
*/

SELECT
	*
FROM (
	SELECT
		*,
		AVG(quantity_sold) OVER () avg_QuantitySold
	FROM Sales
)t
WHERE quantity_sold > avg_QuantitySold;


