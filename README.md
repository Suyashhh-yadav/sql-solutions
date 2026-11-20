# 🎯 Advanced SQL Solutions & Interview Problem Bank

[![SQL](https://img.shields.io/badge/dialect-MySQL%20%7C%20PostgreSQL-orange.svg)](#)
[![Difficulty: Medium & Hard](https://img.shields.io/badge/difficulty-Medium%20%7C%20Hard-blue.svg)](#)


A curated collection of production-grade and competitive SQL solutions focused on **analytical problem-solving, advanced window functions, hierarchical joins, and business logic execution**.

Designed as a reference library for complex interview patterns (LeetCode, HackerRank, Stratascratch) and real-world warehouse query optimization.

---

## 📚 Problem Directory by Core Pattern

### 1. Window Functions & Ranking Analytics
Mastering `ROW_NUMBER()`, `DENSE_RANK()`, `LEAD()`/`LAG()`, and analytical partitioning.

| Problem | Difficulty | Category | Key SQL Technique Demonstrated | File Link |
|---|:---:|:---:|---|---|
| **Highest Grade per Student** | `Medium` | Window Functions | `ROW_NUMBER() OVER (PARTITION BY student_id ORDER BY grade DESC, course_id ASC)` | [`highest-grade-per-student.sql`](medium/window-functions/highest-grade-per-student.sql) |
| **Median Latitude** | `Medium` | Window Functions | Continuous median calculation with `ROW_NUMBER()` / `COUNT()` indexing | [`median-latitude.sql`](medium/window-functions/median-latitude.sql) |
| **Occupation Pivot** | `Medium` | Window Functions | Combining `ROW_NUMBER() OVER (PARTITION BY Occupation)` with conditional aggregation | [`occupation-pivot.sql`](medium/window-functions/occupation-pivot.sql) |
| **Rising Temperature** | `Medium` | Joins / Lag | Self-join on `DATEDIFF(w1.recordDate, w2.recordDate) = 1` comparing sequential metrics | [`rising-temperature.sql`](medium/joins/rising-temperature.sql) |

---

### 2. Complex & Multi-Tier Joins
Multi-table associations, self-joins, hierarchical management trees, and non-equi joins.

| Problem | Difficulty | Category | Key SQL Technique Demonstrated | File Link |
|---|:---:|:---:|---|---|
| **Company Hierarchy** | `Hard` | Joins | Multi-level hierarchy resolution across Founder, Lead, Senior, and Junior Managers | [`company-hierarchy.sql`](hard/joins/company-hierarchy.sql) |
| **Ollivander's Inventory** | `Hard` | Joins / Subqueries | Correlated subquery to find minimum coins per power and age across wands | [`ollivanders-inventory.sql`](hard/joins/ollivanders-inventory.sql) |
| **Full Score Hackers** | `Hard` | Joins / Having | Multi-table joins (`Hackers`, `Submissions`, `Challenges`, `Difficulty`) with strict threshold filtering | [`full-score-hackers.sql`](hard/joins/full-score-hackers.sql) |
| **Placements & Salary Comparison** | `Medium` | Joins | Dual-branch join comparing student package against friend's package | [`placements.sql`](medium/joins/placements.sql) |
| **Average Selling Price** | `Medium` | Joins / Date Ranges | Range-bound join (`purchase_date BETWEEN start_date AND end_date`) with weighted averages | [`average-selling-price.sql`](medium/joins/average-selling-price.sql) |
| **Annual Discount Loss** | `Medium` | Joins / Business | Revenue leak calculation on customer product discount schedules | [`annual-discount-loss.sql`](medium/joins/annual-discount-loss.sql) |
| **Student Grade Report** | `Medium` | Non-Equi Joins | Non-equi join on grade boundary ranges (`Marks BETWEEN Min_Mark AND Max_Mark`) | [`student-report.sql`](medium/joins/student-report.sql) |

---

### 3. Business Aggregations & Cohort Ratios
Percentage conversion, retention rates, delivery SLAs, and transactional metrics.

| Problem | Difficulty | Category | Key SQL Technique Demonstrated | File Link |
|---|:---:|:---:|---|---|
| **Challenges Distribution** | `Hard` | Aggregations | Filtering max challenges count or unique challenge counts using CTE / subqueries | [`challenges.sql`](hard/aggregations/challenges.sql) |
| **Patient Weight Groups** | `Hard` | Grouping | `FLOOR(weight / 10) * 10` dynamic binning and distribution counts | [`patient-weight-groups.sql`](hard/aggregations/patient-weight-groups.sql) |
| **Employee Order Performance** | `Hard` | Business Analysis | Quota tracking and employee performance benchmarking | [`employee-orders.sql`](hard/business-analysis/employee-orders.sql) |
| **Confirmation Rate** | `Medium` | Aggregations | `ROUND(AVG(action = 'confirmed'), 2)` with `LEFT JOIN` handling zero-activity users | [`confirmation-rate.sql`](medium/aggregations/confirmation-rate.sql) |
| **Immediate Delivery Percentage** | `Medium` | Aggregations | First-order identification and immediate delivery SLA ratio calculation | [`immediate-delivery-percentage.sql`](medium/aggregations/immediate-delivery-percentage.sql) |
| **Gameplay Analysis & Retention** | `Medium` | Cohorts / Windows | Day-1 player retention tracking using self-joins and minimum event dates | [`gameplay-analysis.sql`](medium/aggregations/gameplay-analysis.sql) |
| **Contest Registration Percentage** | `Medium` | Aggregations | Cross-table denominator normalization (`COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Users)`) | [`contest-registration-percentage.sql`](medium/aggregations/contest-registration-percentage.sql) |
| **Monthly Transactions & Volume** | `Medium` | Date Aggregations | `DATE_FORMAT()` grouping with conditional approved transaction sums | [`monthly-transactions.sqlv`](medium/aggregations/monthly-transactions.sqlv) |
| **User Activity within 30-Day Window** | `Medium` | Date Windows | Filtering activity ranges using `DATEDIFF()` and strict date boundary arithmetic | [`user-activity-30-days.sql`](medium/aggregations/user-activity-30-days.sql) |
| **Queries Quality & Poor Query Ratio** | `Medium` | Aggregations | Composite quality metrics with `SUM(rating < 3) * 100.0 / COUNT(*)` | [`queries-quality-percentage.sql`](medium/aggregations/queries-quality-percentage.sql) |

---

### 4. Advanced Subqueries & Conditional Categorization
Recursive structures, trees, and dynamic conditional statements.

| Problem | Difficulty | Category | Key SQL Technique Demonstrated | File Link |
|---|:---:|:---:|---|---|
| **Binary Tree Node Types** | `Medium` | Subqueries / Logic | `CASE WHEN p_id IS NULL THEN 'Root' WHEN id IN (SELECT p_id ...) THEN 'Inner' ELSE 'Leaf' END` | [`binary-tree-node-type.sql`](medium/subqueries/binary-tree-node-type.sql) |
| **Occupation Summary** | `Medium` | String / Aggregation | String concatenation with `CONCAT(Name, '(', LEFT(Occupation, 1), ')')` and sorted counts | [`occupation-summary.sql`](medium/aggregations/occupation-summary.sql) |
| **Customers Who Are Also Suppliers** | `Medium` | Set Operations | Intersecting customer and supplier dimensions using `EXISTS` / `JOIN` | [`customers-suppliers.sql`](medium/aggregations/customers-suppliers.sql) |

---

## 💡 Key SQL Patterns for Enterprise Analytics

### 1. Ratio & Conversion Calculations (Zero-Division Safe)
```sql
ROUND(
    COALESCE(SUM(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END) * 1.0 / NULLIF(COUNT(*), 0), 0),
    2
) AS confirmation_rate
```

### 2. De-duplicating / Deduplication via Partitioning
```sql
WITH RankedRecords AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY transaction_date DESC) AS rn
    FROM transactions
)
SELECT * FROM RankedRecords WHERE rn = 1;
```

### 3. Continuous Running Totals & Moving Averages
```sql
SUM(sales_amount) OVER (
    PARTITION BY country
    ORDER BY order_date
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
) AS running_total
```
