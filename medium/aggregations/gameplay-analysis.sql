
/*
=============================================================
Problem: Game Play Analysis IV
Difficulty: Medium
Concepts: JOIN, Subquery, MIN, DATE_ADD, COUNT DISTINCT

Problem Summary:
    Calculate the fraction of players who logged in again
    one day after their first login.

Approach:
    1. Find the first login date for each player.
    2. Match activity records from the following day.
    3. Count qualifying distinct players.
    4. Divide by the total distinct player count.
    5. Round the fraction to 2 decimal places.
=============================================================
*/

SELECT
    ROUND(
        COUNT(DISTINCT a.player_id) /
        (SELECT COUNT(DISTINCT player_id) FROM Activity),
        2
    ) AS fraction
FROM Activity a
JOIN (
    SELECT
        player_id,
        MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
) first_login
    ON a.player_id = first_login.player_id
    AND a.event_date = DATE_ADD(
        first_login.first_login,
        INTERVAL 1 DAY
    );

/*
=============================================================
Problem: Game Play Analysis IV
Difficulty: Medium
Concepts: JOIN, Subquery, MIN, DATE_ADD, COUNT DISTINCT

Problem Summary:
    Calculate the fraction of players who logged in again
    one day after their first login.

Approach:
    1. Find the first login date for each player.
    2. Match activity records from the following day.
    3. Count qualifying distinct players.
    4. Divide by the total distinct player count.
    5. Round the fraction to 2 decimal places.
=============================================================
*/

SELECT
    ROUND(
        COUNT(DISTINCT a.player_id) /
        (SELECT COUNT(DISTINCT player_id) FROM Activity),
        2
    ) AS fraction
FROM Activity a
JOIN (
    SELECT
        player_id,
        MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
) first_login
    ON a.player_id = first_login.player_id
    AND a.event_date = DATE_ADD(
        first_login.first_login,
        INTERVAL 1 DAY
    );

/*
=============================================================
Problem: Game Play Analysis IV
Difficulty: Medium
Concepts: JOIN, Subquery, MIN, DATE_ADD, COUNT DISTINCT

Problem Summary:
    Calculate the fraction of players who logged in again
    one day after their first login.

Approach:
    1. Find the first login date for each player.
    2. Match activity records from the following day.
    3. Count qualifying distinct players.
    4. Divide by the total distinct player count.
    5. Round the fraction to 2 decimal places.
=============================================================
*/

SELECT
    ROUND(
        COUNT(DISTINCT a.player_id) /
        (SELECT COUNT(DISTINCT player_id) FROM Activity),
        2
    ) AS fraction
FROM Activity a
JOIN (
    SELECT
        player_id,
        MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
) first_login
    ON a.player_id = first_login.player_id
    AND a.event_date = DATE_ADD(
        first_login.first_login,
        INTERVAL 1 DAY
    );
