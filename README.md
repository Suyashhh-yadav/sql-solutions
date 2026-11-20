# 🚀 Daily SQL Problem-Solving & Technical Mastery Hub

[![Active Practice: Daily Consistency](https://img.shields.io/badge/practice-Daily%20SQL%20Challenge-blue.svg)](#)
[![Dialects: MySQL · PostgreSQL](https://img.shields.io/badge/dialects-MySQL%20%7C%20PostgreSQL-orange.svg)](#)
[![Difficulty: Medium · Hard](https://img.shields.io/badge/difficulty-Medium%20%7C%20Hard-purple.svg)](#)
[![Focus: Analytics & Query Optimization](https://img.shields.io/badge/focus-Advanced%20Analytics%20%26%20Optimization-green.svg)](#)

Welcome to my personal **Daily SQL Practice & Interview Preparation Repository**.

This repository serves as a living, continuously updated log of daily SQL challenges solved across competitive coding platforms (**LeetCode, HackerRank, StrataScratch, InterviewQuery**) and real-world enterprise warehouse scenarios.

---

## 🎯 Repository Purpose & Philosophy

As an aspiring high-impact Data Analyst / Analytics Engineer, I believe that **SQL mastery is built through disciplined, daily consistency**. 

Writing queries that simply "return the right rows" is not enough. This repository reflects my commitment to:
1. **Thinking in Sets & Granularity:** Accurately identifying table grains before writing joins.
2. **Writing Defensive SQL:** Handling `NULL`s gracefully, preventing zero-division errors, and managing duplicate relationships.
3. **Optimizing for Performance:** Preferring window functions and CTEs over redundant subqueries and expensive correlated scans.
4. **Clean, Readable Style:** Utilizing standardized indentation, uppercase SQL keywords, and self-documenting alias names.

---

## 📂 Repository Architecture

Problems are organized systematically by **Difficulty Level** and **Core Analytical Pattern**, allowing continuous scaling as new daily solutions are committed:

```text
sql-solutions/
├── hard/
│   ├── aggregations/          # Multi-level groupings, dynamic binning & distributions
│   ├── business-analysis/     # Quota tracking, commission tiers & business logic
│   └── joins/                 # Hierarchical management trees, non-equi & self-joins
│
├── medium/
│   ├── aggregations/          # Conversion rates, cohort retention & date windows
│   ├── joins/                 # Range-bound joins, salary benchmarks & lookups
│   ├── subqueries/            # Correlated subqueries, tree node classifications
│   └── window-functions/     # Dense ranking, rolling metrics & dynamic pivots
│
└── README.md
```

---

## 🧠 Core Competency & Topic Roadmap

Every problem solved in this repository targets one or more of these foundational enterprise competencies:

| Analytical Pattern | Core Techniques Practiced | Real-World Business Application |
|---|---|---|
| **Window Functions** | `ROW_NUMBER()`, `DENSE_RANK()`, `RANK()`, `LEAD()`, `LAG()` | Top-N per category, sequential order comparisons, customer retention tracking. |
| **Running & Moving Aggregations** | `SUM(...) OVER (PARTITION BY ... ORDER BY ... ROWS BETWEEN ...)` | Cumulative GMV tracking, 7-day rolling active users, pacing against quarterly targets. |
| **Cohort & Retention Analysis** | Self-joins on `DATEDIFF()`, minimum activity dates, Day-1/Day-7/Day-30 retention | Evaluating customer onboarding funnels and user churn. |
| **Conditional Ratios & Rates** | `ROUND(SUM(CASE WHEN ...) * 100.0 / NULLIF(COUNT(*), 0), 2)` | Order confirmation rates, on-time delivery SLAs, cancellation percentages. |
| **Hierarchical & Non-Equi Joins** | Multi-branch joins, `BETWEEN` range joins, parent-child management trees | Organizational reporting trees, dynamic commission discount schedules. |
| **Dynamic Pivoting & Categorization** | `CASE WHEN` aggregation pivots, string tokenization, regex matching | Transforming transactional rows into cross-tab reporting matrices. |

---

## 🛠️ Daily Solution Protocol

For every problem added to this repository, the solution follows a consistent 4-step engineering discipline:

1. **Problem Statement:** Clear articulation of the business question and expected output grain.
2. **Edge Case Identification:** Anticipating tricky data quirks (e.g., ties in ranking, missing records, negative balances, duplicate keys).
3. **Modular Query Construction:** Utilizing readable CTEs (`WITH` clauses) to separate extraction from final metric aggregation.
4. **Complexity & Efficiency Consideration:** Ensuring queries remain performant on large warehouse scale.

---

## 📈 Platforms Covered

* **LeetCode Database:** Medium & Hard SQL 50 study plans.
* **HackerRank:** Advanced SQL certification and contest challenges.
* **StrataScratch:** Real FAANG/tech-company interview case studies.
* **Enterprise Warehouse Scenarios:** Custom analytical problems modeled after real e-commerce and SaaS datasets.

---

## 🤝 Ongoing Growth & Tracking

*This repository is actively updated daily. New solutions, optimized query variations, and alternative dialect implementations (PostgreSQL / MySQL / BigQuery) are committed as part of my ongoing daily coding habit.*
