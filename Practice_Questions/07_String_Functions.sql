-- Adding some books with extra spaces and mixed casing for practice
INSERT INTO Books (book_id, title, author, status, times_rented)
VALUES 
    (20, '   THE GREAT GATSBY   ', 'f. scott fitzgerald', 'Available', 0),
    (21, 'Harry Potter: Part 1', 'J.K. Rowling', 'Available', 10),
    (22, 'clean_code_book', 'Robert Martin', 'Available', 5);


/*
Create a "Display Name" for every book.
Combine the title and the author into one column called Book_Info.
Make the Title all UPPERCASE and the Author all lowercase.
Example Output: THE HOBBIT - j.r.r. tolkien
*/

SELECT 
    CONCAT(UPPER(title), ' - ' , LOWER(author)) AS Book_Info
FROM Books;

/*
We have a book with ID 20 that has accidental spaces.
Select the title from book 20.
Show the length of the title before trimming and the length after trimming.
*/

SELECT
    title,
    LEN(title) AS before_trim,
    LEN(TRIM(title)) AS after_trim
FROM Books
WHERE book_id = 20;

/*
Generate "Library Codes".
For every book, take the first 3 letters of the Title and the last 3 letters of the Author.
Combine them to make a Library_Code.
*/

SELECT
    LEFT(TRIM(title), 3) + ' - ' + RIGHT(TRIM(author), 3) AS Library_Code
FROM Books;

/*
Fix the formatting of our system files.
Look at book ID 22 (clean_code_book).
Use REPLACE to change all underscores (_) into regular spaces ( ).
Also, change the word book to Manual.
*/

SELECT * FROM Books;

SELECT
    title,
    REPLACE(REPLACE(title, '_', ' '), 'book', 'Manual') AS Clean_Title
FROM Books
WHERE book_id = 22;

/*
Find a specific part of a title.
For 'Harry Potter: Part 1' (ID 21), extract only the word 'Potter'.
*/

SELECT
    title,
    SUBSTRING(TRIM(title), 6, 7) AS specific_title
FROM Books
WHERE book_id = 21;