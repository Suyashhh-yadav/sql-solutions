/*
=============================================================
Problem: Patient Weight Groups
Difficulty: Hard
Concepts: Aggregation, FLOOR, GROUP BY
=============================================================
*/

SELECT
    FLOOR(weight / 10) * 10 AS weight_group,
    COUNT(*) AS patients_in_group
FROM patients
GROUP BY weight_group
ORDER BY weight_group DESC;