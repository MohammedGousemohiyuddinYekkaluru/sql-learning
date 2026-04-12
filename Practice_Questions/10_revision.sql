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
