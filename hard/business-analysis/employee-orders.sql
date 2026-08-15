/*
=============================================================
Problem: Employee Order Performance
Difficulty: Medium
Concepts: JOIN, CASE, Aggregation

Approach:
    1. Join employees with orders.
    2. Classify each order as On Time, Late, or Not Shipped.
    3. Count orders by employee and shipping status.
    4. Sort by employee name and order count.
=============================================================
*/

SELECT
    e.first_name,
    e.last_name,
    COUNT(o.order_id) AS num_orders,
    CASE
        WHEN o.shipped_date IS NULL THEN 'Not Shipped'
        WHEN o.shipped_date <= o.required_date THEN 'On Time'
        ELSE 'Late'
    END AS Shipped
FROM orders o
JOIN employees e
    ON e.employee_id = o.employee_id
GROUP BY
    e.first_name,
    e.last_name,
    Shipped
ORDER BY
    e.last_name,
    e.first_name,
    num_orders DESC;