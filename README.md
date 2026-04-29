# Telecom Customer Churn Analysis Report

## Project Overview

This project presents a SQL-driven analysis of telecom customer churn using a dataset of 2,666 customer records. The goal of this analysis is to identify the major factors responsible for customer churn, measure revenue impact, and highlight high-risk customer segments for better retention planning.

The analysis was performed using MySQL Workbench and focuses on customer behavior, subscription plans, service usage, billing patterns, and geographic churn trends.

---

## Business Objective

Customer churn is a major challenge for telecom companies because losing existing customers directly affects revenue and customer lifetime value.

The objective of this project is to answer key business questions such as:

- What is the overall churn rate?
- Which customer groups are more likely to churn?
- How do international plans, voicemail plans, and service calls affect churn?
- Which states show higher churn and revenue loss?
- What actions can help reduce churn?

---

## Dataset Information

The dataset contains 2,666 telecom customer records with 20 attributes related to customer plans, usage, charges, and churn status.

### Key Columns Used

| Column | Description |
|---|---|
| state | US state of the customer |
| account_length | Duration of the customer account |
| international_plan | Whether the customer has an international plan |
| voice_mail_plan | Whether the customer has a voicemail plan |
| customer_service_calls | Number of calls made to customer support |
| total_day_charge | Total daytime call charges |
| total_intl_charge | Total international call charges |
| churn | Whether the customer left the company |

---

## Tools Used

- MySQL Workbench
- SQL
- PDF Report Preparation

---

## Key Analysis Performed

### 1. Overall Churn Analysis
Calculated total customers, churned customers, retained customers, and overall churn rate.

### 2. Churn by Subscription Plan
Analyzed churn behavior based on:
- International plan
- Voice mail plan

### 3. Churn by Customer Service Calls
Studied how increasing customer service calls affect churn probability.

### 4. Churn by Account Length and Usage
Analyzed churn based on:
- Account length groups
- Day charge groups
- International usage groups

### 5. Geographic Churn Analysis
Identified the top states with the highest churn rates.

### 6. Revenue Impact Analysis
Estimated revenue loss caused by churn across different states.

### 7. High-Risk Customer Segmentation
Identified customers with multiple churn risk factors such as high charges, international plan usage, and high service call frequency.

---

## Key Findings

- The overall churn rate is 14.55%.
- Customers with an international plan have a churn rate of 43.70%, almost 4 times higher than customers without it.
- Customers making 5 or more customer service calls churn at 61.04%.
- High day-charge customers have a churn rate of 38.15%.
- Texas has the highest churn rate and also the highest estimated revenue loss.
- Customers with a voicemail plan show lower churn compared to customers without it.

---

## Business Insights

The analysis shows that churn is mainly driven by pricing dissatisfaction, unresolved customer service issues, and weak retention strategies for high-value users.

Customers with high usage and high charges are more likely to leave, which means the company may be losing some of its most valuable customers. Service call frequency is also a strong warning signal, especially when a customer reaches 4 or more support calls.

---

## Recommendations

- Redesign international plan pricing.
- Create a CRM alert when customers reach their 3rd service call.
- Offer personalized discounts or loyalty benefits to high-charge customers.
- Run state-specific retention campaigns in high-churn states like Texas, New Jersey, Maryland, and Nevada.
- Promote voicemail plan adoption as a retention tool.
- Build a predictive churn model to detect at-risk customers before they leave.

---

## Conclusion

This project demonstrates how SQL can be used to convert raw customer data into meaningful business insights. By identifying churn patterns and high-risk customer segments, telecom companies can take proactive steps to improve customer retention, reduce revenue loss, and increase customer lifetime value.

---

## Author

**Jintu Bharadwaj**

Aspiring Data Analyst  
Skilled in SQL, Excel, Power BI, Python and Data Analysis
