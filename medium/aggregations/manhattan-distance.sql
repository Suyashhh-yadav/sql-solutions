/*
=============================================================
Problem: Manhattan Distance
Difficulty: Medium
Concepts: Aggregation, ABS, MIN, MAX, ROUND

Problem Summary:
    Calculate the Manhattan distance between the points formed
    by the minimum/maximum latitude and longitude values.

Approach:
    1. Find MIN and MAX of LAT_N and LONG_W.
    2. Calculate the absolute difference for each coordinate.
    3. Add both differences.
    4. Round the result to 4 decimal places.
=============================================================
*/

SELECT
    ROUND(
        ABS(MIN(LAT_N) - MAX(LAT_N)) +
        ABS(MIN(LONG_W) - MAX(LONG_W)),
        4
    ) AS manhattan_distance
FROM STATION;