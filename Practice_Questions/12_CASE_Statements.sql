select * from Products
select * from Sales

/*
Task - 1: The Stock Alert (Categorization)
We need a report that labels our inventory risk.
Show the product_name and stock_quantity.
If stock_quantity is 0, label it 'Out of Stock'.
If stock_quantity is between 1 and 20, label it 'Low Stock'.
Otherwise, label it 'Healthy'.
Name this new column Inventory_Status.
*/

SELECT
	product_name,
	stock_quantity,
	CASE
		WHEN stock_quantity = 0 THEN 'Out Of Stock'
		WHEN stock_quantity BETWEEN 1 AND 20 THEN 'Low Stock'
		ELSE 'Healthy'
	END Inventory_Status
FROM Products;

/*
Task - 2: The Region Shortcode (Mapping)
Management wants to simplify the store location names for a mobile app.
Show the sale_id and the store_location.
Use the Quick Form (Simple Case) to map:
'New York' to 'NY'
'London' to 'UK'
'Paris' to 'FR'
Everything else to 'Other'.
*/

SELECT
	sale_id,
	store_location,
	CASE store_location
		WHEN 'New York' THEN 'NY'
		WHEN 'London' THEN 'UK'
		WHEN 'Paris' THEN 'FR'
		ELSE 'Other'
	END Region_ShortCode
FROM Sales;

/*
Task - 3: High-Value Bonus
calculate:
The total number of sales
The number of "Big Sales"(10+ quantity)
*/

SELECT 
	store_location,
	COUNT(quantity_sold) Total_sales,
	SUM(CASE WHEN quantity_sold >= 10 THEN 1 ELSE 0 END) Big_sales
FROM Sales
GROUP BY store_location;

