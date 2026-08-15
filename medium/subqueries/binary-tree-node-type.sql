/*
=============================================================
Problem: Binary Tree Node Type
Difficulty: Medium
Concepts: CASE, EXISTS, Correlated Subquery

Approach:
    1. NULL parent identifies the Root.
    2. EXISTS identifies nodes with children as Inner.
    3. Remaining nodes are Leaf nodes.
=============================================================
*/

SELECT
    b1.n,
    CASE
        WHEN b1.p IS NULL THEN 'Root'
        WHEN EXISTS (
            SELECT 1
            FROM bst b2
            WHERE b2.p = b1.n
        ) THEN 'Inner'
        ELSE 'Leaf'
    END AS node_type
FROM bst b1
ORDER BY b1.n;