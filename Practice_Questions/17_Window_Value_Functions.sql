select * from Sales
select * from Products

/*
Task 1: Previous Sale Comparison
Management wants to see each sale and compare its quantity to the sale that happened immediately before it.
*/

SELECT
	sale_id,
	sale_date,
	quantity_sold,
	LAG(quantity_sold) OVER(ORDER BY sale_date) Previous_Sale_Quantity,
	quantity_sold - LAG(quantity_sold) OVER(ORDER BY sale_date) Quantity_sale_difference
FROM Sales;

/*
Task 2: Store's First Product
Management wants to know which product was the very first one sold in each store.
*/

SELECT
	store_location,
	sale_date,
	product_id,
	FIRST_VALUE(product_id) OVER(PARTITION BY store_location ORDER BY sale_date) First_Product_Sold
FROM Sales;