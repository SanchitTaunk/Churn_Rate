
-- Obj 1: What is the overall churn rate?

SELECT
	COUNT(*) AS total_customers,
	SUM (CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS exited_customers,
	ROUND(100.0 * SUM (CASE WHEN Exited = 1 THEN 1 ELSE 0 END)/COUNT(*), 2) AS churn_rate_percent
FROM customers;

-- Obj 2: Is churn rate higher in specific countries (Geography)?

SELECT Geography,
	COUNT(*)  AS total,
	SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned,
	ROUND(100.0 * SUM (CASE WHEN Exited = 1 THEN 1 ELSE 0 END)/COUNT(*), 2) AS churn_rate_percent
FROM customers
GROUP BY Geography
ORDER BY churn_rate_percent DESC;

-- Obj 3: Does credit score affect customer churn?

SELECT Exited,
	ROUND(AVG(CreditScore),2) AS avg_credit_score,
	COUNT(*)AS num_customers
FROM customers
GROUP BY Exited;

--- Obj 4: Which age group is most likely to churn?

SELECT 
	CASE 
	WHEN Age < 30 THEN 'Under 30'
	WHEN Age BETWEEN 30 AND 40 THEN '30-39'
	WHEN Age BETWEEN 40 AND 49 THEN '40-49'
	ELSE '50+'
	END AS age_group,
	COUNT(*) AS total,
	SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned,
	ROUND(100.0 * SUM (CASE WHEN Exited = 1 THEN 1 ELSE 0 END)/COUNT(*), 2) AS churn_rate_percent
FROM customers
GROUP BY age_group
ORDER BY churn_rate_percent DESC;

-- Obj 5: Is there a relationship between number of products and churn?
											
SELECT NumofProducts,
	COUNT (*) AS total_customers,
	SUM (CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
	ROUND (100.0 * SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) / COUNT (*), 2) AS churn_rate_percent
FROM customers
GROUP BY NumOfProducts
ORDER BY NumOfProducts;	

-- Obj 6: Churn rate by tenure? Are newer or older customers churning more?

SELECT Tenure,
  COUNT(*) AS total_customers,
  SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
  ROUND(100.0 * SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY Tenure
ORDER BY Tenure;

-- Obj 7: Are high-value customers (high balance/salary) churning more or less?

SELECT 
	CASE 
    	WHEN Balance >= 100000 THEN 'High Balance'
    	ELSE 'Low/Medium Balance'
  	END AS balance_segment,
 	CASE 
    	WHEN EstimatedSalary >= 100000 THEN 'High Salary'
    	ELSE 'Low/Medium Salary'
  	END AS salary_segment,
  	COUNT(*) AS total_customers,
  	SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
	ROUND(100.0 * SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY balance_segment, salary_segment;

-- Obj 8: Do customers with credit cards churn more or less?

SELECT hascrcard,
  COUNT(*) AS total_customers,
  SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
  ROUND(100.0 * SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY hascrcard;

-- Obj 9: How many products does the average customer hold, and how does this vary by churn?

SELECT 
  Exited,
  ROUND(AVG(NumOfProducts), 2) AS avg_products_held,
  COUNT(*) AS total_customers
FROM customers
GROUP BY Exited;

-- Obj 10: Average tenure of churned vs retained customers.

SELECT 
  Exited,
  ROUND(AVG(Tenure), 2) AS avg_tenure,
  COUNT(*) AS total_customers
FROM customers
GROUP BY Exited;

-- Obj 11: % of customers with both high balance and long tenure.

SELECT 
	COUNT(*) AS total_customers,
  	SUM(CASE WHEN Balance > 100000 AND Tenure >= 7 THEN 1 ELSE 0 END) AS high_value_customers,
  	ROUND(100.0 * SUM(CASE WHEN Balance > 100000 AND Tenure >= 7 THEN 1 ELSE 0 END) / COUNT(*), 2) AS per_of_high_value_cust
FROM customers;





												
												
												
												
												
												
												
												
												
												
												
												
												
												
											
