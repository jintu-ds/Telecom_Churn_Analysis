
CREATE DATABASE telecom;

USE telecom;

CREATE TABLE telecom_churn (
    state VARCHAR(10),
    account_length INT,
    area_code INT,
    international_plan VARCHAR(10),
    voice_mail_plan VARCHAR(10),
    number_vmail_messages INT,
    total_day_minutes DOUBLE,
    total_day_calls INT,
    total_day_charge DOUBLE,
    total_eve_minutes DOUBLE,
    total_eve_calls INT,
    total_eve_charge DOUBLE,
    total_night_minutes DOUBLE,
    total_night_calls INT,
    total_night_charge DOUBLE,
    total_intl_minutes DOUBLE,
    total_intl_calls INT,
    total_intl_charge DOUBLE,
    customer_service_calls INT,
    churn VARCHAR(10)
);


select * from telecom_churn;
USE telecom;

SELECT COUNT(*) AS total_rows
FROM telecom_churn;

SELECT 
    churn,
    COUNT(*) AS customer_count
FROM telecom_churn
GROUP BY churn;

SELECT 
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'TRUE' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN churn = 'TRUE' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
        2
    ) AS churn_rate_percentage
FROM telecom_churn;

SELECT 
    international_plan,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'TRUE' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN churn = 'TRUE' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
        2
    ) AS churn_rate_percentage
FROM telecom_churn
GROUP BY international_plan
ORDER BY churn_rate_percentage DESC;

SELECT 
    voice_mail_plan,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'TRUE' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN churn = 'TRUE' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
        2
    ) AS churn_rate_percentage
FROM telecom_churn
GROUP BY voice_mail_plan
ORDER BY churn_rate_percentage DESC;

SELECT 
    customer_service_calls,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'TRUE' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN churn = 'TRUE' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
        2
    ) AS churn_rate_percentage
FROM telecom_churn
GROUP BY customer_service_calls
ORDER BY customer_service_calls;

SELECT 
    CASE 
        WHEN customer_service_calls = 0 THEN '0 Calls'
        WHEN customer_service_calls BETWEEN 1 AND 2 THEN '1-2 Calls'
        WHEN customer_service_calls BETWEEN 3 AND 4 THEN '3-4 Calls'
        ELSE '5+ Calls'
    END AS service_call_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'TRUE' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN churn = 'TRUE' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
        2
    ) AS churn_rate_percentage
FROM telecom_churn
GROUP BY service_call_group
ORDER BY churn_rate_percentage DESC;

SELECT 
    CASE 
        WHEN account_length <= 50 THEN '0-50 Days'
        WHEN account_length BETWEEN 51 AND 100 THEN '51-100 Days'
        WHEN account_length BETWEEN 101 AND 150 THEN '101-150 Days'
        ELSE '150+ Days'
    END AS account_length_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'TRUE' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN churn = 'TRUE' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
        2
    ) AS churn_rate_percentage
FROM telecom_churn
GROUP BY account_length_group
ORDER BY churn_rate_percentage DESC;

SELECT 
    state,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'TRUE' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN churn = 'TRUE' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
        2
    ) AS churn_rate_percentage
FROM telecom_churn
GROUP BY state
HAVING COUNT(*) >= 20       
ORDER BY churn_rate_percentage DESC
LIMIT 10;

#HAVING COUNT(*) >= 20 is used:It avoids misleading results from states that have very few customers.

SELECT 
    churn,
    ROUND(AVG(total_day_charge), 2) AS avg_day_charge,
    ROUND(AVG(total_eve_charge), 2) AS avg_evening_charge,
    ROUND(AVG(total_night_charge), 2) AS avg_night_charge,
    ROUND(AVG(total_intl_charge), 2) AS avg_international_charge
FROM telecom_churn
GROUP BY churn;

SELECT 
    churn,
    ROUND(AVG(total_day_minutes), 2) AS avg_day_minutes,
    ROUND(AVG(total_eve_minutes), 2) AS avg_evening_minutes,
    ROUND(AVG(total_night_minutes), 2) AS avg_night_minutes,
    ROUND(AVG(total_intl_minutes), 2) AS avg_international_minutes
FROM telecom_churn
GROUP BY churn;

SELECT 
    CASE
        WHEN total_day_charge < 25 THEN 'Low Charge'
        WHEN total_day_charge BETWEEN 25 AND 40 THEN 'Medium Charge'
        ELSE 'High Charge'
    END AS day_charge_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'TRUE' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN churn = 'TRUE' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
        2
    ) AS churn_rate_percentage
FROM telecom_churn
GROUP BY day_charge_group
ORDER BY churn_rate_percentage DESC;

SELECT 
    CASE
        WHEN total_intl_minutes = 0 THEN 'No International Usage'
        WHEN total_intl_minutes > 0 AND total_intl_minutes <= 10 THEN 'Low Usage'
        WHEN total_intl_minutes > 10 AND total_intl_minutes <= 15 THEN 'Medium Usage'
        ELSE 'High Usage'
    END AS international_usage_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'TRUE' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN churn = 'TRUE' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
        2
    ) AS churn_rate_percentage
FROM telecom_churn
GROUP BY international_usage_group
ORDER BY churn_rate_percentage DESC;

SELECT 
    COUNT(*) AS high_risk_customers
FROM telecom_churn
WHERE customer_service_calls >= 4
  AND international_plan = 'Yes'
  AND churn = 'TRUE';
  
  SELECT 
    state,
    account_length,
    international_plan,
    voice_mail_plan,
    total_day_charge,
    total_intl_charge,
    customer_service_calls,
    churn
FROM telecom_churn
WHERE customer_service_calls >= 4
   OR total_day_charge > 40
   OR total_intl_charge > 3
ORDER BY customer_service_calls DESC, total_day_charge DESC
limit 10;

SELECT 
    state,
    COUNT(*) AS churned_customers,
    ROUND(
        SUM(total_day_charge + total_eve_charge + total_night_charge + total_intl_charge), 
        2
    ) AS estimated_revenue_lost
FROM telecom_churn
WHERE churn = 'TRUE'
GROUP BY state
ORDER BY estimated_revenue_lost DESC
LIMIT 10;

