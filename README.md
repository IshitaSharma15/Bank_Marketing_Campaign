# Bank Marketing Campaign Analysis & Risk Insights

## Project Overview
This project analyzes the **Bank Marketing Additional Dataset** (Kaggle) to evaluate the effectiveness of marketing campaigns, profile customers, and assess credit/loan-related risk patterns. The goal is to demonstrate **SQL querying skills**, **business insight extraction**, and **risk analytics**.

**Dataset:** [Bank Marketing Additional Dataset - Kaggle](https://www.kaggle.com/datasets/andrewmvd/bank-marketing)  
**Tools:** SQL   

**Sections in this analysis:**  
1. Customer Profiling  
2. Campaign Effectiveness  
3. Loan & Risk Insights  
4. Advanced Risk Analytics  

---

## 1. Customer Profiling

**Objective:** Understand the customer base and identify which demographic groups are more likely to subscribe to a term deposit.

| Query | Description | Sample Insight |
|-------|------------|----------------|
| Average Age of Subscribers vs Non-Subscribers | Compare age trends between subscribers and non-subscribers | Subscribers are slightly older on average. |
| Distribution of Education Level Among Subscribers | See which education levels respond best | Higher subscription rates among tertiary-educated customers. |
| Job Categories with Highest Subscription Rate | Analyze subscription by occupation | Retired and student groups have higher conversion rates. |
| Marital Status vs Subscription | Compare subscription by marital status | Singles and married customers show comparable conversion rates. |
| Personal & Housing Loan vs Subscription | Identify how existing loans affect subscription | Customers with loans are less likely to subscribe. |
| Age Groups vs Subscription | Examine age buckets for patterns | Older customers (>60) tend to have lower subscription rates. |

---

## 2. Campaign Effectiveness

**Objective:** Evaluate the success of marketing campaigns and identify patterns that improve conversion rates.

| Query | Description | Sample Insight |
|-------|------------|----------------|
| Overall Conversion Rate | Compute the overall campaign success | ~11% of contacted customers subscribed. |
| Conversion Rate by Month | Check which months yield better subscriptions | May and August had the highest subscription rates. |
| Contact Method Effectiveness | Compare cellular vs telephone contacts | Cellular contacts have higher conversion. |
| Number of Contacts vs Success | Analyze impact of repeated calls | Over-contacting (>10 calls) lowers conversion. |
| Previous Campaign Influence | Check if past interactions affect success | Customers with successful prior contacts are more likely to subscribe. |
| Call Duration vs Subscription | Analyze effect of call duration | Longer calls generally correlate with higher subscription. |

---

## 3. Loan & Risk Insights

**Objective:** Examine how credit/loan status influences subscription and identify high-risk customer segments.

| Query | Description | Sample Insight |
|-------|------------|----------------|
| Both Loans vs Subscription | Customers with both personal + housing loans | High-debt customers have lower subscription rates. |
| Combined Risk Segmentation | Segment customers into High vs Low risk | Low-risk customers have higher conversion (~15%), high-risk <5%. |
| Age Group × Loan Status | Cross-analyze age and loan burden | Young customers with loans may still subscribe; older customers less likely. |

---

## 4. Advanced Risk Analytics

**Objective:** Identify high-risk or resistant customers, analyze unusual patterns, and explore customer behavior for business decisions.

| Query | Description | Sample Insight |
|-------|------------|----------------|
| Previous No → Now Subscribed | Find customers who changed their decision | Some churned customers respond positively in follow-up campaigns. |
| High-Risk Customers Who Still Subscribed | Analyze risky profiles that subscribed | Certain high-risk customers still convert, indicating potential risk monitoring needs. |
| Top Risk Segments by Age × Loan × Default | Multi-dimensional segmentation | Shows which segments are high-risk yet responsive. |
| Over-Contacted Customers | Find customers contacted >10 times | Too many calls often result in low conversion → wasted effort. |
| Subscription Probability by Credit Risk Status | Build risk ladder | Low-risk customers have highest subscription rate; defaulted customers lowest. |
| Resistant Customers (Never Subscribed) | Identify highly resistant customers | Useful for targeting exclusions in future campaigns. |

---

📄 [View Full Analysis Output (PDF)](docs/Bank Marketing Campaign
 Analysis & Risk Insights.pdf)

