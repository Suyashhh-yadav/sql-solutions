/*
=============================================================
Problem: Average Product Price by Category
Difficulty: Medium
Concepts: JOIN, Aggregation, Rounding
=============================================================
*/

SELECT
    c.category_name,
    ROUND(AVG(p.unit_price), 2) AS avg_unit_price
FROM categories c
JOIN products p
    ON c.category_id = p.category_id
GROUP BY c.category_name;