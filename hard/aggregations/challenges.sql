/*
=============================================================
Problem: Challenges
Difficulty: Hard
Concepts: Aggregations, Subqueries, HAVING

Problem Summary:
    Identify hackers with the maximum challenge count and
    hackers whose challenge count is unique.

Approach:
    1. Count challenges created by each hacker.
    2. Find the maximum challenge count.
    3. Identify challenge counts occurring only once.
    4. Filter using both conditions.
    5. Sort by challenge count DESC and hacker ID ASC.
=============================================================
*/

SELECT
    h.hacker_id,
    h.name,
    COUNT(DISTINCT c.challenge_id) AS challenges_created
FROM Hackers h
JOIN Challenges c
    ON h.hacker_id = c.hacker_id
GROUP BY
    h.hacker_id,
    h.name
HAVING
    COUNT(c.challenge_id) = (
        SELECT MAX(cnt)
        FROM (
            SELECT COUNT(*) AS cnt
            FROM Challenges
            GROUP BY hacker_id
        ) x
    )
    OR COUNT(DISTINCT c.challenge_id) IN (
        SELECT cnt
        FROM (
            SELECT COUNT(*) AS cnt
            FROM Challenges
            GROUP BY hacker_id
        ) y
        GROUP BY cnt
        HAVING COUNT(*) = 1
    )
ORDER BY
    challenges_created DESC,
    h.hacker_id ASC;