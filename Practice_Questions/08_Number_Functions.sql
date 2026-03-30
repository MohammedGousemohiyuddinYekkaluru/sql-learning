-- Adding some numerical data to our existing table
ALTER TABLE Books ADD Price DECIMAL(10, 2);
ALTER TABLE Books ADD Discount_Amount DECIMAL(10, 2);

-- Updating a few rows with "messy" numbers
UPDATE Books SET Price = 19.995, Discount_Amount = -5.50 WHERE book_id = 10;
UPDATE Books SET Price = 14.444, Discount_Amount = -2.15 WHERE book_id = 11;
UPDATE Books SET Price = 25.000, Discount_Amount = 0.00  WHERE book_id = 12;


/*
1) The accounting department wants a clean price list.
Select the title and the Price from the Books table.
Round the Price to exactly 2 decimal places.
*/

SELECT * FROM Books;

SELECT 
	title,
	ROUND(Price, 2) AS Book_Price
FROM Books;

/*
2) For a quick marketing flyer, we need "whole number" prices.
Select the title and round the Price to 0 decimal places.
*/

SELECT
	title,
	ROUND(Price, 0) AS Book_Price
FROM Books;

/*
3) Our Discount_Amount was accidentally entered as a negative number (e.g., -5.50).
Select the title and use ABS to show the Discount_Amount as a positive number.
*/

SELECT 
	title,
	ABS(Discount_Amount) AS Discount_Amount
FROM Books;