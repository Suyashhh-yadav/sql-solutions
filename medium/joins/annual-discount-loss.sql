/*
=============================================================
Problem: Annual Discount Loss
Difficulty: Medium
Concepts: JOINs, Aggregation, Date Functions, Rounding

Approach:
    1. Join orders, order_details, and products.
    2. Calculate discount amount using price × quantity × discount.
    3. Group by year and sort newest to oldest.
=============================================================
*/

SELECT
    YEAR(order_date) AS order_year,
    ROUND(
        SUM(p.unit_price * od.quantity * od.discount),
        2
    ) AS discount_amount
FROM orders o
JOIN order_details od
    ON o.order_id = od.order_id
JOIN products p
    ON p.product_id = od.product_id
GROUP BY YEAR(order_date)
ORDER BY order_year DESC;