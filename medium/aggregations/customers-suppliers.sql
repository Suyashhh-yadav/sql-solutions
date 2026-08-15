/*
=============================================================
Problem: Customers and Suppliers
Difficulty: Medium
Concepts: UNION
=============================================================
*/

SELECT
    city,
    company_name,
    contact_name,
    'Customers' AS relationship
FROM customers

UNION

SELECT
    city,
    company_name,
    contact_name,
    'Suppliers' AS relationship
FROM suppliers;