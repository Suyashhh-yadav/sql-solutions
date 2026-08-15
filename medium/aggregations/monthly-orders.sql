/*
=============================================================
Problem: Monthly Order Count
Difficulty: Medium
Concepts: Aggregation, Date Functions
=============================================================
*/

SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    COUNT(DISTINCT order_id) AS no_of_orders
FROM orders
GROUP BY
    YEAR(order_date),
    MONTH(order_date);