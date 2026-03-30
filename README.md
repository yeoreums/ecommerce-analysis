# eCommerce User Behavior Analysis

Session-based analysis of user behavior to identify conversion bottlenecks and engagement patterns in an eCommerce platform.

## Problem

Users interact with products, but only a small fraction convert to purchase.
This project analyzes where users drop off in the funnel and what behaviors are associated with conversion.

## Dataset

* Source: Kaggle (Multi-category eCommerce behavior dataset)
* Sample: 1,000,000 events (Oct 2019)
* Type: Clickstream (view, cart, purchase)

## Approach

* Aggregated event-level data into session-level
* Defined funnel: View → Cart → Purchase
* Created features:

  * has_cart, has_purchase
  * num_events (engagement)

## Key Findings

* View → Cart: ~4%
  → Most users drop off before taking action

* Cart → Purchase: ~56%
  → Users who add to cart are likely to buy

* Engagement:

  * Purchase sessions: ~7 events
  * Non-purchase sessions: ~4 events
    → Higher engagement is associated with conversion

## Insight

The main bottleneck is at the product interaction stage (view → cart), not checkout.
Improving early-stage engagement (e.g., product interaction and add-to-cart behavior) is likely to have the biggest impact on conversion.

## Tech Stack

* Python (pandas)
* Jupyter Notebook
* Tableau (planned)

## Structure

```
ecommerce-analysis/
├── data/
├── notebooks/
│   └── analysis.ipynb
└── README.md
```
