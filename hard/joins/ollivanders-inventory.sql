/*
=============================================================
Problem: Ollivander's Inventory
Difficulty: Hard
Concepts: Joins, Correlated Subqueries, Aggregation

Problem Summary:
    Find the cheapest non-evil wand for each age and power
    combination.

Approach:
    1. Join Wands with Wands_Property.
    2. Filter out evil wands.
    3. Use a correlated subquery to find minimum cost
       for the same age and power.
    4. Sort by power and age in descending order.
=============================================================
*/

SELECT
    w.id,
    wp.age,
    w.coins_needed,
    w.power
FROM Wands w
JOIN Wands_Property wp
    ON w.code = wp.code
WHERE wp.is_evil = 0
AND w.coins_needed = (
    SELECT MIN(w2.coins_needed)
    FROM Wands w2
    JOIN Wands_Property wp2
        ON w2.code = wp2.code
    WHERE wp2.is_evil = 0
      AND wp2.age = wp.age
      AND w2.power = w.power
)
ORDER BY
    w.power DESC,
    wp.age DESC;