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