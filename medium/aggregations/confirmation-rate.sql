/*
=============================================================
Problem: Confirmation Rate
Difficulty: Medium
Concepts: LEFT JOIN, CASE, AVG, COALESCE

Problem Summary:
    Calculate each user's confirmation rate, returning zero
    for users without confirmation records.

Approach:
    1. LEFT JOIN Signups and Confirmations.
    2. Convert confirmed actions to 1 and others to 0.
    3. Calculate the average and round to 2 decimals.
    4. Use COALESCE to handle NULL results.
=============================================================
*/

SELECT
    s.user_id,
    COALESCE(
        ROUND(
            AVG(
                CASE
                    WHEN c.action = 'confirmed' THEN 1.00
                    ELSE 0.00
                END
            ), 2
        ), 0
    ) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
    ON s.user_id = c.user_id
GROUP BY s.user_id;