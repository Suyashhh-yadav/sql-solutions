
/*
=============================================================
Problem: Percentage of Users Attended a Contest
Difficulty: Easy
Concepts: GROUP BY, COUNT, Subquery, ROUND

Problem Summary:
    Calculate the percentage of users registered in each
    contest relative to the total number of users.

Approach:
    1. Group registrations by contest_id.
    2. Count registered users.
    3. Divide by the total user count and multiply by 100.
    4. Round to 2 decimals and sort by percentage DESC,
       then contest_id ASC.
=============================================================
*/

SELECT
    contest_id,
    ROUND(
        COUNT(user_id) * 100 /
        (SELECT COUNT(*) FROM Users),
        2
    ) AS percentage
FROM Register
GROUP BY contest_id
ORDER BY
    percentage DESC,
    contest_id ASC;
