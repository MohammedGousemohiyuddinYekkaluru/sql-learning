-- Adding some numerical data to our existing table
ALTER TABLE Books ADD Price DECIMAL(10, 2);
ALTER TABLE Books ADD Discount_Amount DECIMAL(10, 2);

-- Updating a few rows with "messy" numbers
UPDATE Books SET Price = 19.995, Discount_Amount = -5.50 WHERE book_id = 10;
UPDATE Books SET Price = 14.444, Discount_Amount = -2.15 WHERE book_id = 11;
UPDATE Books SET Price = 25.000, Discount_Amount = 0.00  WHERE book_id = 12;