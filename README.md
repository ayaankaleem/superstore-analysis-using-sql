# superstore-analysis-using-sql

Superstore Sub-Category Sales Analysis

## What is this?

This SQL query looks at a Superstore dataset and answers one simple question:

> **Which product categories are selling the most?**

---

## The Query

```sql
SELECT
    sub_category,
    COUNT(*) AS total_orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM public.superstore
GROUP BY sub_category
ORDER BY total_sales DESC;
```

---

## What does it return?

For each product category (like Phones, Chairs, Binders), it shows:

| Column | Meaning |
|---|---|
| `sub_category` | Name of the product category |
| `total_orders` | How many times it was ordered |
| `total_sales` | How much money it made |
| `total_profit` | How much profit it earned |

Results are sorted from **highest sales to lowest**.

---

## Sample Output

| sub_category | total_orders | total_sales | total_profit |
|---|---|---|---|
| Phones | 889 | 330,007 | 44,516 |
| Chairs | 617 | 328,449 | 26,590 |
| ... | ... | ... | ... |

17 categories total.

---

## Why is this useful?

- See which products bring in the **most revenue**
- Check if high sales also mean **high profit** (not always!)
- Helps make better decisions on **what to stock or promote**

---

## Tools Used

- **Database:** PostgreSQL 18
- **Tool:** pgAdmin 4
- **Dataset:** Superstore (from Kaggle)

---

*Project by Ayaan Kaleem â€” Aspiring Data Analyst
