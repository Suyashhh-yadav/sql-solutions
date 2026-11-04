/*
=============================================================
Problem: Top Scorers - Full Score
Difficulty: Hard
Concepts: Multiple JOINs, GROUP BY, HAVING, COUNT DISTINCT

Approach:
    1. Join hackers, submissions, challenges and difficulty.
    2. Filter submissions achieving full marks.
    3. Count distinct challenges per hacker.
    4. Keep hackers with more than one full-score challenge.
    5. Sort by challenge count DESC, then hacker_id ASC.
=============================================================
*/

SELECT
    h.hacker_id,
    h.name
FROM Hackers h
JOIN Submissions s
    ON h.hacker_id = s.hacker_id
JOIN Challenges c
    ON c.challenge_id = s.challenge_id
JOIN Difficulty d
    ON d.difficulty_level = c.difficulty_level
WHERE d.score = s.score
GROUP BY
    h.hacker_id,
    h.name
HAVING COUNT(DISTINCT s.challenge_id) > 1
ORDER BY
    COUNT(DISTINCT s.challenge_id) DESC,
    h.hacker_id ASC;