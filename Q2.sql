

CREATE TABLE calendar (
    created_date DATE,
    year INT,
    month_no INT,
    month_full_name VARCHAR(20),
    quarter VARCHAR(2),
    yearmonth VARCHAR(8),
    weekday_no INT,
    weekday_name VARCHAR(10),
    financial_month VARCHAR(5),
    financial_quarter VARCHAR(5)
);


INSERT INTO calendar (created_date, year, month_no, month_full_name, quarter, yearmonth, weekday_no, weekday_name, financial_month, financial_quarter)
SELECT 
    DATE(FROM_UNIXTIME(created_at)) as created_date, 
    YEAR(FROM_UNIXTIME(created_at)) AS year,
    MONTH(FROM_UNIXTIME(created_at)) AS month_no,
    MONTHNAME(FROM_UNIXTIME(created_at)) AS month_full_name,
    CONCAT('Q', QUARTER(FROM_UNIXTIME(created_at))) AS quaterr,
    DATE_FORMAT(FROM_UNIXTIME(created_at), '%Y-%b') AS yearmonth,
    DAYOFWEEK(FROM_UNIXTIME(created_at)) AS weekday_no,
    DAYNAME(FROM_UNIXTIME(created_at)) AS weekday_name,
    CASE MONTH(FROM_UNIXTIME(created_at))
        WHEN 4 THEN 'FM1' 
        WHEN 5 THEN 'FM2'  
        WHEN 6 THEN 'FM3'  
        WHEN 7 THEN 'FM4'  
        WHEN 8 THEN 'FM5' 
        WHEN 9 THEN 'FM6'  
        WHEN 10 THEN 'FM7' 
        WHEN 11 THEN 'FM8' 
        WHEN 12 THEN 'FM9' 
        WHEN 1 THEN 'FM10' 
        WHEN 2 THEN 'FM11' 
        WHEN 3 THEN 'FM12' 
    END AS financial_month,
    CASE 
        WHEN MONTH(FROM_UNIXTIME(created_at)) IN (1, 2, 3) THEN 'FQ1'
        WHEN MONTH(FROM_UNIXTIME(created_at)) IN (4, 5, 6) THEN 'FQ2'
        WHEN MONTH(FROM_UNIXTIME(created_at)) IN (7, 8, 9) THEN 'FQ3'
        WHEN MONTH(FROM_UNIXTIME(created_at)) IN (10, 11, 12) THEN 'FQ4'
    END AS financial_quarter
FROM (
    SELECT DISTINCT created_at
    FROM projects
) AS unique_dates;

select*from calendar;









    

