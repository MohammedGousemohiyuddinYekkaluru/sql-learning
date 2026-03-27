-- Adding some books with extra spaces and mixed casing for practice
INSERT INTO Books (book_id, title, author, status, times_rented)
VALUES 
    (20, '   THE GREAT GATSBY   ', 'f. scott fitzgerald', 'Available', 0),
    (21, 'Harry Potter: Part 1', 'J.K. Rowling', 'Available', 10),
    (22, 'clean_code_book', 'Robert Martin', 'Available', 5);