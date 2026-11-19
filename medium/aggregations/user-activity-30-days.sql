
/*
=============================================================
Problem: User Activity for the Past 30 Days I
Difficulty: Easy
Concepts: WHERE, COUNT DISTINCT, GROUP BY

Problem Summary:
    Find the number of unique active users for each day
    within the 30-day period ending July 27, 2019.

Approach:
    1. Filter activity dates from June 28 to July 27, 2019.
    2. Count distinct users for each date.
    3. Group results by activity_date.
=============================================================
*/

SELECT
    activity_date AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date;
