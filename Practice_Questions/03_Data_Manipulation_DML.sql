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