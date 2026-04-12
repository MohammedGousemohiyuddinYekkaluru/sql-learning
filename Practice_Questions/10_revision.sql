/*
The warehouse needs to know exactly what was sold and where.
Only show sales for products in the 'Accessories' category.
*/

SELECT 
	p.product_name,
	s.store_location,
	s.quantity_sold
FROM Products AS p
INNER JOIN Sales AS s
ON p.product_id = s.product_id
WHERE P.category = 'Accessories';

/*
Marketing wants to see which products have never been sold.
*/

SELECT *
FROM Products AS p
LEFT JOIN Sales AS s
ON P.product_id = S.product_id
WHERE s.sale_id IS NULL;

/*
We need a clean inventory report for the website.
1.  A new column called Product_Label that combines the product_name in UPPERCASE and the category in lowercase.
2.  The price rounded to the nearest whole number.
*/

SELECT 
	CONCAT(UPPER(product_name), ' ', '-', ' ', LOWER(category)) AS Product_Label,
	ROUND(price, 0)
FROM Products;