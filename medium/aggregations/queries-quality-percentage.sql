
/*
=============================================================
Problem: Queries Quality and Percentage
Difficulty: Easy
Concepts: AVG, CASE, SUM, GROUP BY

Problem Summary:
    Calculate query quality and poor query percentage
    for each query_name.

Approach:
    1. Calculate average rating divided by position.
    2. Count queries with rating below 3.
    3. Calculate their percentage of total queries.
    4. Round both metrics to 2 decimal places.
=============================================================
*/

SELECT
    query_name,
    ROUND(AVG(rating / position), 2) AS quality,
    ROUND(
        SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100
        / COUNT(*),
        2
    ) AS poor_query_percentage
FROM Queries
GROUP BY query_name;
