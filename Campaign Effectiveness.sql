-- Overall Conversion Rate
SELECT 
    COUNT(*) AS total_customers,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS subscribed_customers,
    ROUND(100.0 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS conversion_rate
FROM customers;
-- Conversion Rate by Month
SELECT month,
       COUNT(*) AS total_contacts,
       SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) AS subscribed,
       ROUND(100.0 * SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS conversion_rate
FROM customers
GROUP BY month
ORDER BY conversion_rate DESC;
-- Contact Method Effectiveness
SELECT contact,
       COUNT(*) AS total_contacts,
       SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) AS subscribed,
       ROUND(100.0 * SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS conversion_rate
FROM customers
GROUP BY contact
ORDER BY conversion_rate DESC;
-- Number of Contacts in Campaign vs Success
SELECT campaign AS num_contacts,
       COUNT(*) AS total_customers,
       SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) AS subscribed,
       ROUND(100.0 * SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS conversion_rate
FROM customers
GROUP BY campaign
ORDER BY num_contacts;
-- Previous Campaign Influence
SELECT poutcome,
       COUNT(*) AS total_customers,
       SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) AS subscribed,
       ROUND(100.0 * SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS conversion_rate
FROM customers
GROUP BY poutcome
ORDER BY conversion_rate DESC;
-- Duration of Last Call vs Subscription
SELECT 
    CASE 
        WHEN duration < 100 THEN 'Under 100s'
        WHEN duration BETWEEN 100 AND 300 THEN '100-300s'
        WHEN duration BETWEEN 301 AND 600 THEN '301-600s'
        ELSE '600+ seconds'
    END AS call_duration_group,
    COUNT(*) AS total_calls,
    SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) AS subscribed,
    ROUND(100.0 * SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS conversion_rate
FROM customers
GROUP BY call_duration_group
ORDER BY conversion_rate DESC;


