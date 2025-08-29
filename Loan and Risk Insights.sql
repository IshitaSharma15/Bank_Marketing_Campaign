-- Personal Loan vs Subscription
SELECT loan,
       COUNT(*) AS total_customers,
       SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS subscribed_customers,
       ROUND(100.0 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS subscription_rate
FROM customers
GROUP BY loan;
-- Housing Loan vs Subscription
SELECT housing,
       COUNT(*) AS total_customers,
       SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS subscribed_customers,
       ROUND(100.0 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS subscription_rate
FROM customers
GROUP BY housing;
-- Customers with Both Loans (Personal + Housing)
SELECT loan, housing,
       COUNT(*) AS total_customers,
       SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) AS subscribed_customers,
       ROUND(100.0 * SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS subscription_rate
FROM customers
GROUP BY loan, housing
ORDER BY subscription_rate DESC;
-- Customers in Default vs Subscription 
SELECT "default",
       COUNT(*) AS total_customers,
       SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) AS subscribed_customers,
       ROUND(100.0 * SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS subscription_rate
FROM customers
GROUP BY "default";
-- Combined Risk Segmentation
SELECT 
    CASE 
        WHEN "default" = 'yes' OR loan = 'yes' OR housing = 'yes' 
        THEN 'High Risk'
        ELSE 'Low Risk'
    END AS risk_segment,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS subscribed_customers,
    ROUND(100.0 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS subscription_rate
FROM customers
GROUP BY risk_segment;
-- Age Group × Loan Status
SELECT 
    CASE 
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 39 THEN '30s'
        WHEN age BETWEEN 40 AND 49 THEN '40s'
        WHEN age BETWEEN 50 AND 59 THEN '50s'
        ELSE '60+'
    END AS age_group,
    loan,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) AS subscribed_customers,
    ROUND(100.0 * SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS subscription_rate
FROM customers
GROUP BY age_group, loan
ORDER BY age_group, subscription_rate DESC;



