# SQL

My SQL learning work from my AI/ML coursework, practiced using Google BigQuery.

## Structure

- `coursework/` — SQL queries written while following the course lessons and practice sessions.
- `data/` — practice CSV datasets used with the coursework.
- `projects/` — future original SQL projects.

## Current Progress

The repository currently contains SQL coursework notes through **Join practice (15 uploaded note files)**.

The uploaded-note numbering is my repository/upload numbering and does **not necessarily match the official course lecture numbering**.

## Class Notes

| Note | Main topics / skills practiced |
|---|---|
| 1 | Basic querying with `SELECT`; selecting columns; `DISTINCT`; inspecting tables; basic schema cleanup with `ALTER TABLE ... RENAME COLUMN` |
| 2 | Basic `SELECT *` and `LIMIT` practice |
| 3 | Filtering with `WHERE`; equality/inequality; filtering by city, gender, age, status, supplier, stock and dates; `COUNT(*)`; `COUNT(DISTINCT ...)` |
| 4 | Aggregate functions without grouping: `COUNT`, `SUM`; total sales; total quantity; filtered aggregates |
| 5 | `AVG`, `MIN`, `MAX`, transaction summaries; first grouped queries with `GROUP BY`; product and customer/order summaries |
| 6 | Deeper `GROUP BY` practice with `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`; product sales, order status, warehouse stock, inventory and successful-payment summaries |
| 7 | Sorting with `ORDER BY`; ascending/descending order; `LIMIT`; sorting products, customers, inventory, payments, sales and multi-column sorting |
| 8 | `HAVING` clause; filtering grouped results; supplier/customer/product counts and sales thresholds |
| 9 | `GROUP BY` + `HAVING` practice; multi-condition aggregation; filtered aggregates; warehouse and order-status summaries |
| 10 | Advanced aggregation practice: supplier/category statistics, sales thresholds, discounts, successful payments, customer order ranges, warehouse stock and inventory conditions |
| 11 | Subquery introduction: comparing values with aggregate results; average/max MRP; top-MRP exploration; percentage-of-total calculation; aggregation practice before nested queries |
| 12 | Nested subqueries: `IN` with subqueries; top-5 MRP products; suppliers with at least 5 products; customers with at least 3 orders; customer filtering; derived-table subqueries and comparing supplier counts with their average |
| 13 | `INNER JOIN`; joining products with categories and suppliers; filtering joined data; cancelled orders with customer details; order-level sales; customer-level sales across multiple tables |
| 14 | `LEFT JOIN` and `RIGHT JOIN`; finding products/customers with no related records; retaining zero-order customers; multi-table customer/payment reports |
| 15 | Join practice combining multiple `INNER JOIN`s and `LEFT JOIN`s with aggregates, `GROUP BY`, `HAVING`, `ORDER BY`, `COALESCE`, and business-style reporting questions |

## Skills Built So Far

### Querying
- `SELECT`, `SELECT *`
- Column selection and aliases
- `DISTINCT`
- `LIMIT`

### Filtering & Sorting
- `WHERE`
- Comparison operators
- `ORDER BY ASC/DESC`
- Multi-column sorting

### Aggregation
- `COUNT`
- `SUM`
- `AVG`
- `MIN`
- `MAX`
- `ROUND`
- `GROUP BY`
- `HAVING`

### Relational Data
- `INNER JOIN`
- `LEFT JOIN`
- `RIGHT JOIN`
- Joining multiple tables through foreign-key relationships
- Identifying missing relationships with `LEFT JOIN ... IS NULL`
- Handling missing aggregate values with `COALESCE`

### Subqueries
- Scalar subqueries
- `IN (subquery)`
- Nested subqueries
- Derived tables
- Aggregation inside subqueries
- Comparing grouped results against an average/aggregate result

## Data Model Practiced

The coursework uses interconnected fictional/AI-generated tables such as:

- `customers`
- `orders`
- `order_items`
- `products`
- `categories`
- `suppliers`
- `payments`
- `inventory`
- `warehouses`
- `employees`
- `reviews`

A major part of the learning progression has been moving from querying individual tables to reasoning across related tables.

## Learning Progression

```text
SELECT
  ↓
WHERE
  ↓
ORDER BY / LIMIT
  ↓
Aggregate Functions
  ↓
GROUP BY
  ↓
HAVING
  ↓
Subqueries
  ↓
INNER JOIN
  ↓
LEFT / RIGHT JOIN
  ↓
Multi-table Analytical Queries
```

The latest practice session shows the transition from learning JOIN syntax to using JOINs as building blocks for actual analytical questions.

## Course Context

The official course sequence places SQL after the Python foundation and before NumPy, Pandas/EDA, statistics and machine learning. The scheduled SQL block covers database fundamentals, querying, filtering, sorting, aggregation, grouping, `HAVING`, string/date functions, `CASE WHEN`, joins, subqueries, window functions, a case study and a SQL project.

## Dataset

The practice datasets are fictional/AI-generated datasets shared by my instructor for coursework practice.
