/*
Find all books that have been rented more than 20 times but less than 50 times.
*/

SELECT *
FROM Books
WHERE times_rented > 20 AND times_rented < 50;

/*
We need a report on books that are high priority.
Find all books that are currently 'Available' AND have a times_rented greater than 40.
*/

SELECT * 
FROM Books
WHERE status = 'Available' AND times_rented > 40;

/*
Find all books where the book_id is between 3 and 7.
*/

SELECT *
FROM Books
WHERE book_id BETWEEN 3 AND 7;