#8
#1
SELECT 
    CONCAT(ROUND((COUNT(CASE WHEN state = 'Successful' THEN 1 END) * 100.0 / COUNT(*)),1),"%") AS OverallSuccessPercentage
FROM 
    Projects_NaturalTime;
#2
SELECT 
    category_id,
    CONCAT(ROUND((COUNT(CASE WHEN state = 'Successful' THEN 1 END) * 100.0 / COUNT(*)),1),"%") AS SuccessPercentage
FROM 
    Projects_NaturalTime
GROUP BY 
    category_id;
#3
SELECT 
    YEAR(created_time) AS Year,MONTH(created_time) AS Month,
      CONCAT(ROUND((COUNT(CASE WHEN state = 'Successful' THEN 1 END) * 100.0 / COUNT(*)),1),"%") AS SuccessPercentage 
FROM 
    Projects_NaturalTime
GROUP BY 
    Year,MONTH;
#4   
 SELECT 
    CASE 
        WHEN goal BETWEEN 0 AND 10000 THEN '0 - 10,000'
        WHEN goal BETWEEN 10001 AND 50000 THEN '10,001 - 50,000'
        WHEN goal BETWEEN 50001 AND 100000 THEN '50,001 - 100,000'
        ELSE 'Above 100,000'
    END AS GoalRange,
    CONCAT(ROUND((COUNT(CASE WHEN state = 'Successful' THEN 1 END) * 100.0 / COUNT(*)),1),"%") AS SuccessPercentage
FROM 
    Projects_NaturalTime
GROUP BY 
    GoalRange;

    