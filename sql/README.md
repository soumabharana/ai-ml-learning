# SQL

My SQL learning work from my AI/ML coursework, practiced using Google BigQuery.

## Structure

- `coursework/` — SQL queries written while following the course lessons and practice sessions.
- `data/` — practice CSV datasets used with the coursework.
- `projects/` — future original SQL projects.

## Current Progress

The repository currently contains **20 uploaded SQL coursework files**, reaching **Window Functions I**.

The uploaded-note numbering is my repository/upload numbering and does **not necessarily match the official course lecture numbering**.

SQL has progressed from basic querying and aggregation to joins, subqueries, analytical queries, `CASE WHEN`, and the first set of window functions. I have temporarily moved on to NumPy and plan to return to SQL after revision.

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
| 12 | Nested subqueries: `IN (subquery)`; top-5 MRP products; suppliers with at least 5 products; customers with at least 3 orders; customer filtering; derived-table subqueries and comparing supplier counts with their average |
| 13 | `INNER JOIN`; joining products with categories and suppliers; filtering joined data; cancelled orders with customer details; order-level sales; customer-level sales across multiple tables |
| 14 | `LEFT JOIN` and `RIGHT JOIN`; finding products/customers with no related records; retaining zero-order customers; multi-table customer/payment reports |
| 15 | Join practice combining multiple `INNER JOIN`s and `LEFT JOIN`s with aggregates, `GROUP BY`, `HAVING`, `ORDER BY`, `COALESCE`, and business-style reporting questions |
| 16 | `CASE WHEN`; warehouse sales analysis with `LEFT JOIN`; customers spending above average; products performing above their category average; age classification; order-value classification |
| 17 | Practice with order-value classification; category-level sales reporting; `COUNT(DISTINCT)`; filtered aggregation; product filtering using MRP, discount percentage and total sales |
| 18 | Multi-stage analytical queries using a derived table; employee order performance; customer and city-level reports; product/category analysis; payment-method summaries; top-15 products; warehouse inventory analysis |
| 19 | Warehouse inventory aggregation; identifying stocked but never-sold products with `LEFT JOIN ... IS NULL`; supplier classification using `CASE WHEN`; customers buying across multiple categories; failed-payment customer analysis; employee sales analysis |
| 20 | Introduction to window functions: `OVER()`; `PARTITION BY`; windowed `SUM`, `AVG`, `COUNT`; overall totals; percentage contribution; `ROW_NUMBER()`; plus correlated-subquery practice such as highest-MRP product per category |

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
- `COUNT(DISTINCT ...)`
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

### Conditional & Analytical SQL
- `CASE WHEN`
- Conditional classification of rows/groups
- Multi-stage analytical queries
- Business-style reporting across several related tables

### Subqueries
- Scalar subqueries
- `IN (subquery)`
- Nested subqueries
- Derived tables
- Correlated subqueries
- Aggregation inside subqueries
- Comparing grouped results against average/aggregate results

### Window Functions
- `OVER()`
- `PARTITION BY`
- `SUM() OVER(...)`
- `AVG() OVER(...)`
- `COUNT() OVER(...)`
- Overall totals with `SUM() OVER()`
- Percentage contribution calculations
- `ROW_NUMBER() OVER(...)`

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
CASE WHEN
  ↓
Multi-table Analytical Queries
  ↓
Window Functions
```

The latest SQL work marks the transition from grouped aggregation to calculations that can be performed across related rows while keeping the original row-level detail.

## Course Context

The official course sequence places SQL after the Python foundation and before NumPy, Pandas/EDA, statistics and machine learning. The scheduled SQL block covers database fundamentals, querying, filtering, sorting, aggregation, grouping, `HAVING`, string/date functions, `CASE WHEN`, joins, subqueries, window functions, a case study and a SQL project.

## Dataset

The practice datasets are fictional/AI-generated datasets shared by my instructor for coursework practice.