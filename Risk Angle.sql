-- Customers Who Previously Said “No” but Subscribed Now
SELECT previous,
       poutcome,
       COUNT(*) AS total_customers,
       SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) AS subscribed,
       ROUND(100.0 * SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS conversion_rate
FROM customers
WHERE previous > 0
GROUP BY previous, poutcome
ORDER BY conversion_rate DESC;
-- High-Risk Customers Who Still Subscribed
SELECT COUNT(*) AS total_high_risk_customers,
       SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) AS high_risk_subscribed,
       ROUND(100.0 * SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS subscription_rate
FROM customers
WHERE "default"='yes' OR loan='yes' OR housing='yes';
-- Top Risk Segments by Age × Loan × Default
SELECT 
    CASE 
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 39 THEN '30s'
        WHEN age BETWEEN 40 AND 49 THEN '40s'
        WHEN age BETWEEN 50 AND 59 THEN '50s'
        ELSE '60+'
    END AS age_group,
    loan, housing, "default",
    COUNT(*) AS total_customers,
    SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) AS subscribed,
    ROUND(100.0 * SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS subscription_rate
FROM customers
GROUP BY age_group, loan, housing, "default"
ORDER BY subscription_rate DESC;
-- Outlier Campaign Customers (Over-Contacted)
SELECT campaign,
       COUNT(*) AS total_customers,
       SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) AS subscribed,
       ROUND(100.0 * SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS conversion_rate
FROM customers
WHERE campaign > 10
GROUP BY campaign
ORDER BY campaign;
-- Probability of Subscription by Credit Risk Status
SELECT 
    CASE 
        WHEN "default"='yes' THEN 'Default Risk'
        WHEN loan='yes' AND housing='yes' THEN 'High Debt (Loan + Housing)'
        WHEN loan='yes' OR housing='yes' THEN 'Moderate Debt'
        ELSE 'Low Risk'
    END AS risk_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) AS subscribed,
    ROUND(100.0 * SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS subscription_rate
FROM customers
GROUP BY risk_group
ORDER BY subscription_rate DESC;
-- “Resistant” Customers (Contacted Many Times but Still No)
SELECT customer_id, campaign, y
FROM customers
WHERE campaign >= 10 AND y='no'
ORDER BY campaign DESC
LIMIT 20;


