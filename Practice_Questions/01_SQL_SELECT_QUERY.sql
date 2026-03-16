/* ============================================================================== 
   DATABASE SETUP: Global-Tech Solutions
=============================================================================== */

-- 1. Create the Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2), -- Using Decimal for money to be precise
    stock_quantity INT
);

-- 2. Create the Sales Table
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    store_location VARCHAR(50),
    quantity_sold INT,
    sale_date DATE,
    -- This links Sales to Products
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

/* ============================================================================== 
   INSERTING DATA
=============================================================================== */

-- Insert data into Products
INSERT INTO Products (product_id, product_name, category, price, stock_quantity)
VALUES 
(101, 'iPhone 15', 'Electronics', 999.00, 50),
(102, 'Logitech Mouse', 'Accessories', 25.00, 150),
(103, 'MacBook Air', 'Electronics', 1200.00, 20),
(104, 'Mechanical Keyboard', 'Accessories', 85.00, 0), 
(105, 'Dell Monitor', 'Electronics', 300.00, 15),
(106, 'USB-C Cable', 'Accessories', 15.00, 100);

-- Insert data into Sales
INSERT INTO Sales (sale_id, product_id, store_location, quantity_sold, sale_date)
VALUES 
(1, 101, 'New York', 2, '2024-01-10'),
(2, 102, 'London', 5, '2024-01-11'),
(3, 101, 'London', 1, '2024-01-12'),
(4, 103, 'New York', 1, '2024-01-13'),
(5, 105, 'Paris', 3, '2024-01-14'),
(6, 102, 'New York', 10, '2024-01-15'),
(7, 106, 'London', 20, '2024-01-16');


SELECT * FROM Products;
SELECT * FROM Sales;

/*
============================================================================================
                                 Filtering & Sorting 
    Question: Retrieve all products in the 'Electronics' category that cost more than $500. 
        Sort the results so the most expensive item is at the top.
============================================================================================
*/

SELECT *
FROM Products
WHERE category = 'Electronics' AND price > 500
ORDER BY price DESC;

/*
==================================================================================================
                                Distinct Data & Aliasing
    Question: Get a unique list of all store_location values from the Sales table. 
    Rename the column in your output to Active_Markets.
==================================================================================================
*/

SELECT DISTINCT 
    store_location AS Active_Markets
FROM Sales;

/*
==================================================================================================
                            Basic Aggregation (GROUP BY)
       Question: For each product_id in the Sales table, calculate the total quantity sold.
==================================================================================================
*/

SELECT 
    product_id,
    SUM(quantity_sold) AS total_quantity_sold
FROM Sales
GROUP BY product_id;

/*
=========================================================================================================
                               Filtering Aggregates (HAVING)
            Question: Which store locations have sold a total of more than 10 items? 
            Show the location and the total sum, and sort it by the highest volume.
==========================================================================================================
*/

SELECT
    store_location,
    SUM(quantity_sold) AS total_items_sold
FROM Sales
GROUP BY store_location
HAVING SUM(quantity_sold) > 10
ORDER BY total_items_sold DESC;