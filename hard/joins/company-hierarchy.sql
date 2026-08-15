/*
=============================================================
Problem: Company Hierarchy
Difficulty: Hard
Concepts: Multiple JOINs, Aggregation, DISTINCT

Problem Summary:
    Calculate the number of lead managers, senior managers,
    managers, and employees for each company.

Approach:
    1. Count distinct members at each hierarchy level.
    2. Aggregate each table separately by company.
    3. LEFT JOIN the results to the company table.
    4. Sort by company_code alphabetically.

Key Considerations:
    - Duplicate records exist, so COUNT(DISTINCT ...) is required.
    - company_code is sorted lexicographically.
=============================================================
*/

SELECT
    c.company_code,
    c.founder,
    lm.lead_manager_count,
    sm.senior_manager_count,
    m.manager_count,
    e.employee_count
FROM company c

LEFT JOIN (
    SELECT
        company_code,
        COUNT(DISTINCT lead_manager_code) AS lead_manager_count
    FROM lead_manager
    GROUP BY company_code
) lm
    ON c.company_code = lm.company_code

LEFT JOIN (
    SELECT
        company_code,
        COUNT(DISTINCT senior_manager_code) AS senior_manager_count
    FROM senior_manager
    GROUP BY company_code
) sm
    ON c.company_code = sm.company_code

LEFT JOIN (
    SELECT
        company_code,
        COUNT(DISTINCT manager_code) AS manager_count
    FROM manager
    GROUP BY company_code
) m
    ON c.company_code = m.company_code

LEFT JOIN (
    SELECT
        company_code,
        COUNT(DISTINCT employee_code) AS employee_count
    FROM employee
    GROUP BY company_code
) e
    ON c.company_code = e.company_code

ORDER BY c.company_code;