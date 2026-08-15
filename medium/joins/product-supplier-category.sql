/*
=============================================================
Problem: Product, Supplier and Category Details
Difficulty: Medium
Concepts: Multiple JOINs
=============================================================
*/

SELECT
    p.product_name,
    s.company_name,
    c.category_name
FROM products p
JOIN suppliers s
    ON s.supplier_id = p.supplier_id
JOIN categories c
    ON c.category_id = p.category_id;