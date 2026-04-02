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

/*
4) How long has the book been out?
Calculate the number of days between the BorrowDate and today's date.
*/

SELECT
	title,
	DATEDIFF(day, BorrowDate, GETDATE()) AS Days_borrowed
FROM Books;

/*
5) The library clears records at the end of the month.
Show the title and the last day of the month in which the book was borrowed.
ALSO, CAST that result as a simple DATE so it doesn't show the 00:00:00 time.
*/

SELECT
	title,
	CAST(EOMONTH(BorrowDate) AS DATE) AS End_Of_Month
FROM Books;

/*
6) List the title and a column called Days_Held. 
Only show books that have been out for more than 40 days relative to today's date.
*/

SELECT
	title,
	DATEDIFF(day, BorrowDate, GETDATE()) AS Days_Held
FROM Books
WHERE DATEDIFF(day, BorrowDate, GETDATE()) > 40;

/*
7) Management noticed that books borrowed on weekends are rarely returned on time.
List the title and the Name of the Weekday (e.g.,'Friday', 'Saturday', 'Sunday') that the book was borrowed.
*/

SELECT
	title,
	FORMAT(BorrowDate, 'dddd') AS Weekday
FROM Books
WHERE FORMAT(BorrowDate, 'dddd') = 'Friday'
OR FORMAT(BorrowDate, 'dddd') = 'Saturday'
OR FORMAT(BorrowDate, 'dddd') = 'Sunday';

/*
8) We need to standardize our display for an old legacy system that only accepts a specific format.
Display the title and the BorrowDate formatted exactly as (e.g., 01/15/26).
Add a second column that shows the Hour of the day the book was checked out (0-23).
*/

SELECT
	title,
	FORMAT(BorrowDate, 'MM/dd/yy') AS Borrow_Date,
	FORMAT(BorrowDate, 'HH') AS CheckoutHour
FROM Books;

/*
9) For every book, calculate a date exactly 6 months after the BorrowDate. Call this column Review_Date.
The Review_Date must be displayed as a Year and Month string only (e.g., "2026 - July").
*/

SELECT
	title,
	FORMAT(DATEADD(MONTH, 6, BorrowDate), 'yyyy - MMMM') AS Review_Date
FROM Books;

/*
10) The library pays a small "inventory tax" on the last day of the quarter in which a book was borrowed.
For every borrowed book, find the EOMONTH of that date, but then add 2 months to it to find the end of that quarter.
*/

SELECT
	title,
	CAST(EOMONTH(DATEADD(MONTH, 2, BorrowDate)) AS Date) AS Quaterly_Date
FROM Books;