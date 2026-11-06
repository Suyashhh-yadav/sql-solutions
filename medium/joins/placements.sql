/*
=============================================================
Problem: Placements
Difficulty: Medium
Concepts: Multiple Joins, Self-Referencing Relationships

Problem Summary:
    Find students whose best friends receive a higher salary.

Approach:
    1. Join Students with Friends.
    2. Join Packages for student and friend salaries.
    3. Filter where friend's salary is higher.
    4. Sort by friend's salary ascending.
=============================================================
*/

SELECT
    s.name
FROM Students s
JOIN Friends f
    ON s.id = f.id
JOIN Packages p1
    ON p1.id = s.id
JOIN Packages p2
    ON p2.id = f.friend_id
WHERE p2.salary > p1.salary
ORDER BY p2.salary ASC;