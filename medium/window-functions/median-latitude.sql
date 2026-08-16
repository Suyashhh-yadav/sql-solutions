/*
=============================================================
Problem: Median Northern Latitude
Difficulty: Medium
Concepts: Window Functions, ROW_NUMBER, COUNT, Aggregation

Problem Summary:
    Find the median value of LAT_N and round it to 4 decimal
    places.

Approach:
    1. Order LAT_N and assign row numbers.
    2. Count the total number of rows.
    3. Select the middle row(s).
    4. Take their average to obtain the median.
=============================================================
*/

SELECT
    ROUND(AVG(LAT_N), 4) AS median_latitude
FROM (
    SELECT
        LAT_N,
        ROW_NUMBER() OVER (ORDER BY LAT_N) AS rn,
        COUNT(*) OVER () AS total_rows
    FROM STATION
) x
WHERE rn IN (
    FLOOR((total_rows + 1) / 2),
    CEIL((total_rows + 1) / 2)
);