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

/*
The library is doing a "Classic Authors" spotlight.
Retrieve all books where the author is in this list: 'George Orwell', 'Aldous Huxley', 'F. Scott Fitzgerald'.
*/

SELECT *
FROM Books
WHERE author IN ('George Orwell', 'Aldous Huxley', 'F. Scott Fitzgerald');

/*
Find all books where the title starts with the word 'The'.
*/

SELECT *
FROM Books
WHERE title LIKE 'The%';

/*
Find all books where the author has 'son' anywhere in their name (e.g., Daniel Kahneman would not match, but a name like "Anderson" would).
*/

SELECT *
FROM Books
WHERE author LIKE '%son%';

/*
Find all books where the title has 'i' as the fifth letter (e.g., '1984' would not, but 'Atomic' would).
*/

SELECT *
FROM Books
WHERE title LIKE '____i%';