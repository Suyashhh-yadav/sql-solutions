/*
=============================================================
Problem: Occupation Summary
Difficulty: Medium
Concepts: Aggregation, String Functions, Sorting

Approach:
    1. Concatenate each name with the first letter of occupation.
    2. Count occurrences of each occupation.
    3. Sort counts ascending, then occupations alphabetically.
=============================================================
*/

-- Result Set 1: Names with occupation initials

SELECT
    CONCAT(Name, '(', LEFT(Occupation, 1), ')')
FROM Occupations
ORDER BY
    CONCAT(Name, '(', LEFT(Occupation, 1), ')');


-- Result Set 2: Occupation counts

SELECT
    CONCAT(
        'There are a total of ',
        COUNT(Occupation),
        ' ',
        LOWER(Occupation),
        's.'
    )
FROM Occupations
GROUP BY Occupation
ORDER BY
    COUNT(Occupation) ASC,
    Occupation ASC;