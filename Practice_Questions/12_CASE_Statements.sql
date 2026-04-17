select * from Products
select * from Sales

/*
Task - 1. The Stock Alert (Categorization)
We need a report that labels our inventory risk.
Task: Show the product_name and stock_quantity.
If stock_quantity is 0, label it 'Out of Stock'.
If stock_quantity is between 1 and 20, label it 'Low Stock'.
Otherwise, label it 'Healthy'.
Alias: Name this new column Inventory_Status.
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