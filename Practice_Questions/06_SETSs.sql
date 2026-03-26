/* ============================================================================== 
   DATABASE SETUP: Set Operations (Staff & Members)
=============================================================================== */

-- 1. Create Staff Table
CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    staff_name VARCHAR(100),
    role VARCHAR(50)
);

-- 2. Insert Staff Data
-- Note: 'Alice Johnson' and 'Bob Smith' are in BOTH tables!
INSERT INTO Staff (staff_id, staff_name, role)
VALUES 
    (101, 'Alice Johnson', 'Librarian'),
    (102, 'Bob Smith', 'Assistant'),
    (103, 'Peter Parker', 'Archivist'),
    (104, 'Bruce Wayne', 'Security');

-- 3. Verify the existing Members for comparison
-- Members: Alice, Bob, Charlie, Diana, Edward
SELECT member_name FROM Members;
SELECT staff_name FROM Staff;

/*
Create a single master list of every person involved with the library (both Staff and Members).
*/

SELECT
    member_name
FROM Members
UNION
SELECT
   staff_name
FROM Staff;

/*
Combine the names of all Staff and Members into one list, but keep duplicates so we can see if someone holds both roles.
*/

SELECT
    member_name
FROM Members
UNION ALL
SELECT
   staff_name
FROM Staff;

/*
Find the names of people who are both a Library Member and a Staff member.
*/

SELECT 
    m.member_name
FROM Members AS m
INNER JOIN Staff AS s
ON member_name = staff_name;

-- Using INTERSECT

SELECT member_name FROM Members
INTERSECT
SELECT staff_name FROM Staff;

/*
Find the names of Members who are not part of the Staff.
*/

SELECT * FROM Members;
SELECT * FROM Staff;

SELECT 
    m.member_name
FROM Members AS m
LEFT JOIN Staff AS s
ON m.member_name = s.staff_name
WHERE s.staff_name IS NULL;

-- Using EXCEPT

SELECT member_name FROM Members
EXCEPT
SELECT staff_name FROM Staff;

/*
Combine both tables into one report.
Requirement: Add a static column called UserType. For the first part of the union, the value should be 'Library Member'. 
For the second part, it should be 'Library Staff'.
Columns: Name, UserType.
*/

SELECT
    member_name AS Name,
    'Library Member' AS UserType
FROM Members
UNION
SELECT 
    staff_name,
    'Library Staff'
FROM Staff;