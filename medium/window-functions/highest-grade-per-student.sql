/*
=============================================================
Problem: Highest Grade for Each Student
Difficulty: Medium
Concepts: ROW_NUMBER, Window Functions, PARTITION BY

Problem Summary:
    Find each student's highest grade and corresponding course.
    Break ties using the smallest course_id.

Approach:
    1. Partition records by student_id.
    2. Rank grades in descending order.
    3. Sort course_id ascending to break ties.
    4. Select the first-ranked record for each student.
=============================================================
*/

SELECT
    student_id,
    course_id,
    grade
FROM (
    SELECT
        student_id,
        course_id,
        grade,
        ROW_NUMBER() OVER (
            PARTITION BY student_id
            ORDER BY grade DESC, course_id ASC
        ) AS rn
    FROM Enrollments
) t
WHERE rn = 1
ORDER BY student_id ASC;