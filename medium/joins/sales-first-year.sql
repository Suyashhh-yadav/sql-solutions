/*
=============================================================
Problem: Product Sales Analysis III
Difficulty: Medium
Concepts: JOIN, GROUP BY, MIN, Subquery

Problem Summary:
    Find all sales records from the first year each product
    was sold.

Approach:
    1. Find the minimum year for each product.
    2. Join the result with Sales.
    3. Return every sale in that first year.
=============================================================
*/

SELECT
    s.product_id,
    s.year AS first_year,
    s.quantity,
    s.price
FROM Sales s
JOIN (
    SELECT
        product_id,
        MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
) first_sales
    ON s.product_id = first_sales.product_id
   AND s.year = first_sales.first_year;