
/*
=============================================================
Problem: Average Selling Price
Difficulty: Easy
Concepts: LEFT JOIN, BETWEEN, Weighted Average, IFNULL

Problem Summary:
    Calculate the average selling price of each product
    based on purchase quantities and applicable price periods.

Approach:
    1. LEFT JOIN Prices and UnitsSold by product.
    2. Match purchase dates with price validity periods.
    3. Calculate the weighted average selling price.
    4. Round to 2 decimals and handle NULL results.
=============================================================
*/

SELECT
    p.product_id,
    IFNULL(
        ROUND(
            SUM(p.price * us.units) / SUM(us.units),
            2
        ),
        0
    ) AS average_price
FROM Prices p
LEFT JOIN UnitsSold us
    ON p.product_id = us.product_id
    AND us.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;
