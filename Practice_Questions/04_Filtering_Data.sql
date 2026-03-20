/*
Find all books that have been rented more than 20 times but less than 50 times.
*/

SELECT *
FROM Books
WHERE times_rented > 20 AND times_rented < 50;