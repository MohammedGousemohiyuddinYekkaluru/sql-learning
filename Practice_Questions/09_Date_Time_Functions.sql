-- 1. Add a BorrowDate column
ALTER TABLE Books ADD BorrowDate DATETIME;

-- 2. Update some dates (using various formats SQL Server recognizes)
UPDATE Books SET BorrowDate = '2026-01-15 10:30:00' WHERE book_id = 10;
UPDATE Books SET BorrowDate = '2026-02-20 14:45:00' WHERE book_id = 11;
UPDATE Books SET BorrowDate = '2025-12-05 09:00:00' WHERE book_id = 14;
UPDATE Books SET BorrowDate = '2026-03-01 16:20:00' WHERE book_id = 15;

SELECT * FROM Books;


/*
1) Extract Monthly Report, Extract year as a number and Month Name.
*/

SELECT
	title,
	BorrowDate,
	YEAR(BorrowDate) AS Year,
	DATENAME(MONTH, BorrowDate) AS Month
FROM Books;

/*
2) Create a "Reader Friendly" date.
Show the title and format the BorrowDate to look like this: "Wednesday, Jan 15, 2026".
*/

SELECT
	title,
	FORMAT(BorrowDate, 'dddd, MMM dd, yyyy') AS Date
FROM Books;

/*
3) Calculate the "Due Date".
Books are due exactly 14 days after they are borrowed.
Select the title, the BorrowDate, and calculate the DueDate.
*/

SELECT 
	title,
	BorrowDate,
	DATEADD(day, 14, BorrowDate) AS Due_Date
FROM Books;