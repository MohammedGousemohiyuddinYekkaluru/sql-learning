/* ============================================================================== 
   DATABASE SETUP: Library System
=============================================================================== */

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100),
    status VARCHAR(20) DEFAULT 'Available', -- Available or Borrowed
    times_rented INT DEFAULT 0
);

-- Initial Data
INSERT INTO Books (book_id, title, author, status, times_rented)
VALUES 
    (1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Available', 12),
    (2, '1984', 'George Orwell', 'Borrowed', 25),
    (3, 'The Hobbit', 'J.R.R. Tolkien', 'Available', 18);

-- Create an empty Audit table for practice
CREATE TABLE Books_Archive (
    id INT,
    book_title VARCHAR(100),
    rental_count INT
);

/*
A new shipment of books arrived.
Insert a new book: ID: 4, Title: 'Atomic Habits', Author: 'James Clear'.
Bonus: Leave the status and times_rented to their default values (don't include them in the INSERT list).
*/

INSERT INTO Books (book_id, title, author)
VALUES
    (4, 'Atomic Habits', 'James Clear');

/*
We need to back up our most popular books.
Copy the book_id, title, and times_rented from the Books table into the Books_Archive table, but only for books that have been rented more than 20 times.
*/

INSERT INTO Books_Archive (id, book_title, rental_count)
SELECT
    book_id,
    title,
    times_rented
FROM Books
WHERE times_rented > 20;

/*
Someone just checked out 'The Great Gatsby'.
Update the Books table: Change the status to 'Borrowed' and increment the times_rented by 1 for the book with book_id = 1.
*/

UPDATE Books
SET status = 'Borrowed',
    times_rented += 1
WHERE book_id = 1;

/*
We are doing a system reset.
Update all books that currently have a status of 'Available' and set their times_rented to 0.
*/

UPDATE Books
SET times_rented = 0
WHERE status = 'Available';

/*
Cleanup time.
Delete the book titled '1984' from the Books table.
*/

DELETE FROM Books
WHERE title = '1984';

SELECT * FROM Books;

/*
Completely empty the Books_Archive table using the fastest method possible.
*/

TRUNCATE TABLE Books_Archive;
