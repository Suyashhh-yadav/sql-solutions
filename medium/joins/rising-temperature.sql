/*
=============================================================
Problem: Rising Temperature
Difficulty: Medium
Concepts: Self Join, DATEDIFF, Date Comparison

Problem Summary:
    Find IDs of days when the temperature was higher than
    the previous calendar day.

Approach:
    1. Self-join Weather using consecutive dates.
    2. Compare current and previous day's temperatures.
    3. Return IDs where the current temperature is higher.
=============================================================
*/

SELECT
    w1.id
FROM Weather w1
JOIN Weather w2
    ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE w1.temperature > w2.temperature;