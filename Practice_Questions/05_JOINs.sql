-- Create Members Table
CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    member_name VARCHAR(100),
    membership_type VARCHAR(50)
);

-- Add a 'borrower_id' to our existing Books table to link them
-- (If you already have a Books table, we just add the column)
ALTER TABLE Books ADD borrower_id INT;

-- Insert Members (The Library Patrons)
INSERT INTO Members (member_id, member_name, membership_type)
VALUES 
    (1, 'Alice Johnson', 'Gold'),
    (2, 'Bob Smith', 'Silver'),
    (3, 'Charlie Brown', 'Bronze'),
    (4, 'Diana Prince', 'Gold'),     -- Has borrowed nothing
    (5, 'Edward Nigma', 'Silver');


INSERT INTO Books (book_id, title, author, status, times_rented, borrower_id)
VALUES 
    (10, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Borrowed', 12, 1), -- Borrowed by Alice
    (11, '1984', 'George Orwell', 'Borrowed', 25, 2),                  -- Borrowed by Bob
    (12, 'The Hobbit', 'J.R.R. Tolkien', 'Available', 18, NULL),       -- On Shelf
    (13, 'Atomic Habits', 'James Clear', 'Available', 5, NULL),        -- On Shelf
    (14, 'The Alchemist', 'Paulo Coelho', 'Borrowed', 45, 1),          -- Borrowed by Alice
    (15, 'Brave New World', 'Aldous Huxley', 'Borrowed', 8, 3);


SELECT * FROM Members;
SELECT * FROM Books;

/*
List every book title and the member_name of the person who currently has it.
(This should only show books that actually have a borrower).
*/

SELECT 
    b.title,
    m.member_name
FROM Books AS b
INNER JOIN Members AS m
ON b.borrower_id = m.member_id;

/*
List all members and the title of any books they have. 
(Members like Diana and Edward should show up with NULL for the book title).
*/

SELECT 
    m.member_name,
    b.title
FROM Members AS m
LEFT JOIN Books AS b
ON b.borrower_id = m.member_id;

/*
List all books and the member_name of their borrower.
(Books like "The Hobbit" should show up with NULL for the member name).
*/

SELECT 
    b.title, 
    m.member_name
FROM Members AS m
RIGHT JOIN Books AS b 
ON m.member_id = b.borrower_id;

/*
Find only the members who have not borrowed any books.
*/

SELECT 
    member_name
FROM Members AS m
LEFT JOIN Books AS B
ON b.borrower_id = m.member_id
WHERE b.borrower_id IS NULL;

/*
Retrieve a complete list of all members and all books, showing matches where they exist and NULL where they don't.
*/

SELECT *
FROM Members AS m
LEFT JOIN Books AS B
ON m.member_id = b.borrower_id

UNION

SELECT *
FROM Members AS m
RIGHT JOIN Books AS B
ON m.member_id = b.borrower_id;

/*
Find the total number of books currently being borrowed by "Gold" members, 
but only for those members who have borrowed more than 1 book.
*/

SELECT 
    m.member_name,
    COUNT(b.title) AS total_books
FROM Members AS m
LEFT JOIN Books AS b
ON m.member_id = b.borrower_id
WHERE m.membership_type = 'Gold'
GROUP BY m.member_name
HAVING COUNT(b.title) > 1
ORDER BY total_books DESC;