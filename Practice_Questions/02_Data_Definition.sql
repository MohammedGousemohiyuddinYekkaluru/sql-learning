/* ============================================================================== 
   DATABASE SETUP: Social Media Module
=============================================================================== */

-- Create a starting table for User Profiles
CREATE TABLE user_profiles (
    user_id INT PRIMARY KEY,
    username VARCHAR(30) NOT NULL,
    bio VARCHAR(255),
    join_date DATE DEFAULT GETDATE() -- GETDATE() is SQL Server's "today"
);

-- Insert a test user to see the structure in action
INSERT INTO user_profiles (user_id, username, bio)
VALUES (1, 'DataWizard_99', 'Learning SQL Server and loving it!');

SELECT * FROM user_profiles;

/*
Create a new table called "posts".
Columns: post_id (INT, Primary Key), user_id (INT), content (VARCHAR 500), and post_date (DATETIME).
Requirement: Ensure the content column cannot be empty (NOT NULL).
*/

CREATE TABLE posts (
    post_id INT,
    user_id INT,
    content VARCHAR(500) NOT NULL,
    post_date DATETIME,
    PRIMARY KEY (post_id)
);

/*
Goal: Your marketing team wants to track user locations.
Add a column named country to the user_profiles table. Use VARCHAR(50)
*/

ALTER TABLE user_profiles
ADD country VARCHAR(50);

/*
The username in user_profiles is currently VARCHAR(30). Change it to VARCHAR(100) to allow for longer names.
*/

ALTER TABLE user_profiles
ALTER COLUMN username VARCHAR(100);
