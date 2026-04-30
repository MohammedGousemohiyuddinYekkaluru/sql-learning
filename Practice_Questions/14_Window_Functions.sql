select * from Products
select * from Sales

/*
Task:1 :- The "Grand Total" Comparison
Management wants to see how much each sale contributes to the company's overall success.
Show: sale_id, store_location, quantity_sold, and a new column Grand_Total_Sold.
Grand_Total_Sold should show the sum of all quantity_sold in the entire table, repeated on every row.
*/

SELECT 
	sale_id,
	store_location,
	quantity_sold,
	SUM(quantity_sold) OVER () Grand_Total_Sold
FROM Sales;


/*
Task 2: The "Store Performance"
Now, they want to compare each sale to the total sales of that specific store.
Show: sale_id, store_location, quantity_sold, and a new column Store_Total_Sold.
*/

SELECT
	sale_id,
	store_location,
	quantity_sold,
	SUM(quantity_sold) OVER (PARTITION BY store_location) Store_Total_Sold
FROM Sales;


/*
Task 3: The "Running Total"
Management wants to see how sales grew over time.
Show: sale_date, quantity_sold, and Running_Total.
order by sale_date & show the sum growing row by row.
*/

SELECT 
	sale_date,
	quantity_sold,
	SUM(quantity_sold) OVER (ORDER BY sale_date ROWS UNBOUNDED PRECEDING) Running_Total
FROM Sales;