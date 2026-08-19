/*
=============================================================
Problem: Student Report
Difficulty: Medium
Concepts: JOIN, CASE, Conditional Sorting

Problem Summary:
    Generate a report containing Name, Grade, and Mark.
    Hide names for grades below 8 and apply different
    sorting rules for grades 8-10 and grades 1-7.

Approach:
    1. Join students with grades using the mark range.
    2. Display names only for grades >= 8.
    3. Sort grades descending.
    4. Sort names alphabetically for grades >= 8.
    5. Sort marks ascending for grades below 8.
=============================================================
*/

SELECT
    CASE
        WHEN g.grade >= 8 THEN s.name
        ELSE NULL
    END AS name,
    g.grade AS grade,
    s.marks AS mark
FROM students s
JOIN grades g
    ON s.marks BETWEEN g.min_mark AND g.max_mark
ORDER BY
    g.grade DESC,
    CASE
        WHEN g.grade >= 8 THEN s.name
    END ASC,
    CASE
        WHEN g.grade < 8 THEN s.marks
    END ASC;