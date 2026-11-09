/*
=============================================================
Problem: Immediate Delivery Percentage
Difficulty: Medium
Concepts: Subqueries, MIN, Composite IN, CASE, AVG

Problem Summary:
    Calculate the percentage of customers whose first order
    was scheduled for immediate delivery.

Approach:
    1. Find the earliest order date for each customer.
    2. Filter to each customer's first order.
    3. Mark immediate orders as 1 and scheduled orders as 0.
    4. Calculate the average percentage and round to 2 decimals.
=============================================================
*/

SELECT
    ROUND(
        AVG(
            CASE
                WHEN order_date = customer_pref_delivery_date THEN 1
                ELSE 0
            END
        ) * 100,
        2
    ) AS immediate_percentage
FROM Delivery
WHERE (customer_id, order_date) IN (
    SELECT
        customer_id,
        MIN(order_date)
    FROM Delivery
    GROUP BY customer_id
);