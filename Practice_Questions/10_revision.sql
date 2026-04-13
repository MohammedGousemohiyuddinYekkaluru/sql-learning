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

/*
It’s time for the monthly audit.
Show the sale_id and the sale_date.
Column 1: Calculate a Return_Deadline which is exactly 30 days after the sale_date.
Column 2: Extract the Name of the Day (e.g., 'Monday') the sale happened.
Only show sales that happened in the month of January.
*/

SELECT 
	sale_id,
	sale_date,
	DATEADD(day, 30, sale_date) AS Return_Deadline,
	DATENAME(weekday, sale_date) AS Order_Day
FROM Sales
WHERE MONTH(sale_date) = 01 ;

/*
You need a single list of all 'Locations' related to the company.
Combine the category from the Products table and the store_location from the Sales table into one single column called All_Locations.
Ensure there are no duplicates.
*/

SELECT DISTINCT
	CONCAT(p.category, ' ', '-', ' ', s.store_location) AS All_Locations
FROM Products AS p
LEFT JOIN Sales AS s
ON p.product_id = s.product_id

UNION

SELECT DISTINCT
	CONCAT(p.category, ' ', '-', ' ', s.store_location)
FROM Sales AS s
RIGHT JOIN Products AS p
ON p.product_id = s.product_id;