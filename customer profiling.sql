-- Average Age of Subscribers vs Non-Subscribers
SELECT y AS subscribed,
       ROUND(AVG(age),2) AS avg_age,
       COUNT(*) AS total_customers
FROM customers
GROUP BY y;
-- Distribution of Education Level Among Subscribers
SELECT education,
       COUNT(*) AS total_customers,
       SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) AS subscribed_customers,
       ROUND(100.0 * SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS subscription_rate
FROM customers
GROUP BY education
ORDER BY subscription_rate DESC;
-- Job Categories with Highest Subscription Rate
SELECT job,
       COUNT(*) AS total_customers,
       SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) AS subscribed_customers,
       ROUND(100.0 * SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS subscription_rate
FROM customers
GROUP BY job
ORDER BY subscription_rate DESC;
-- Marital Status vs Subscription
SELECT marital_status,
       COUNT(*) AS total_customers,
       SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) AS subscribed_customers,
       ROUND(100.0 * SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS subscription_rate
FROM customers
GROUP BY marital_status
ORDER BY subscription_rate DESC;
-- Customers with Loans vs Subscription 
SELECT loan,
       COUNT(*) AS total_customers,
       SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) AS subscribed_customers,
       ROUND(100.0 * SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS subscription_rate
FROM customers
GROUP BY loan;
SELECT housing,
       COUNT(*) AS total_customers,
       SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) AS subscribed_customers,
       ROUND(100.0 * SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS subscription_rate
FROM customers
GROUP BY housing;
-- Age Groups vs Subscription
SELECT CASE 
         WHEN age < 30 THEN 'Under 30'
         WHEN age BETWEEN 30 AND 39 THEN '30s'
         WHEN age BETWEEN 40 AND 49 THEN '40s'
         WHEN age BETWEEN 50 AND 59 THEN '50s'
         ELSE '60+'
       END AS age_group,
       COUNT(*) AS total_customers,
       SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) AS subscribed_customers,
       ROUND(100.0 * SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS subscription_rate
FROM customers
GROUP BY age_group
ORDER BY subscription_rate DESC;


