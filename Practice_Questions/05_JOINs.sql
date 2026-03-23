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