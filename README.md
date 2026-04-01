# eCommerce User Behavior Analysis

Session-based analysis of user behavior to identify conversion bottlenecks and engagement patterns in an eCommerce platform.

## Problem

Users interact with products frequently, but only a small fraction convert to purchase. This raises the question of where and why users drop off.

## Dataset

* Source: Kaggle (Multi-category eCommerce behavior dataset)
* Sample: 1,000,000 events (Oct 2019)
* Type: Clickstream data (view, cart, purchase)

## Approach

* Aggregated event-level data into session-level
* Defined funnel: View → Cart → Purchase
* Refined funnel logic to ensure sequential behavior (cart → purchase)
* Validated funnel metrics to ensure logical consistency (Purchase ≤ Cart)
* Created features:

  * has_cart, has_purchase
  * num_events (engagement level)

## Key Findings

* View → Cart: ~4%
  → Most users drop off before taking action

* Cart → Purchase: ~56%
  → Users who add to cart are likely to complete purchase

* Engagement:

  * Purchase sessions: ~7 events
  * Non-purchase sessions: ~4 events
    → Higher engagement is strongly associated with conversion

## Insight

The primary bottleneck is at the early stage (view → cart), not at checkout. Improving product interaction and encouraging add-to-cart behavior is likely to have the greatest impact on overall conversion.

## Dashboard

Tableau Public dashboard:
[https://public.tableau.com/views/Book1_17748750433270/Dashboard1]([https://public.tableau.com/views/Book1_17748750433270/Dashboard1](https://public.tableau.com/views/ecommerce-conversion-analysis/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link))

## SQL Analysis

```sql
-- Funnel Analysis
SELECT
  COUNT(*) AS total_sessions,
  SUM(CASE WHEN has_cart THEN 1 ELSE 0 END) AS cart_sessions,
  SUM(CASE WHEN has_cart AND has_purchase THEN 1 ELSE 0 END) AS purchase_after_cart,
  SAFE_DIVIDE(
    SUM(CASE WHEN has_cart THEN 1 ELSE 0 END),
    COUNT(*)
  ) AS view_to_cart_rate,
  SAFE_DIVIDE(
    SUM(CASE WHEN has_cart AND has_purchase THEN 1 ELSE 0 END),
    SUM(CASE WHEN has_cart THEN 1 ELSE 0 END)
  ) AS cart_to_purchase_rate
FROM `your_project.ecommerce.sessions`;

-- Engagement Analysis
SELECT
  has_purchase,
  AVG(num_events) AS avg_events
FROM `your_project.ecommerce.sessions`
GROUP BY has_purchase
ORDER BY avg_events DESC;
```

## Tech Stack

* Python (pandas)
* Jupyter Notebook
* Tableau (dashboard visualization)

## Project Structure

```
ecommerce-analysis/
├── data/
│   ├── raw/
│   └── processed/
├── notebooks/
│   └── analysis.ipynb
└── README.md
```
