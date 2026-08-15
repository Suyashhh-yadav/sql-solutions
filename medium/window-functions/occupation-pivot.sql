/*
=============================================================
Problem: Pivot Occupations
Difficulty: Medium
Concepts: Window Functions, Conditional Aggregation, Pivot

Approach:
    1. Rank names alphabetically within each occupation.
    2. Use conditional aggregation to pivot occupations into columns.
    3. Group by the generated row number.
=============================================================
*/

SELECT
    MAX(CASE WHEN occupation = 'Doctor' THEN name END) AS Doctor,
    MAX(CASE WHEN occupation = 'Professor' THEN name END) AS Professor,
    MAX(CASE WHEN occupation = 'Singer' THEN name END) AS Singer,
    MAX(CASE WHEN occupation = 'Actor' THEN name END) AS Actor
FROM (
    SELECT
        name,
        occupation,
        ROW_NUMBER() OVER (
            PARTITION BY occupation
            ORDER BY name
        ) AS rn
    FROM occupations
) t
GROUP BY rn
ORDER BY rn;