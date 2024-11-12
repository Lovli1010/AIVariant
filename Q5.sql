#q(5)
#(1)
SELECT 
    state,
    COUNT(*) AS TotalProjects
FROM 
    Projects_NaturalTime
GROUP BY 
    state;
#(2)
SELECT cl.displayable_name,
COUNT(p.location_id) AS total_projects
FROM projects p
JOIN locationsql cl ON p.location_id = cl.id
GROUP BY cl.displayable_name
ORDER BY total_projects DESC
LIMIT 10;

#3
SELECT cc.name,
COUNT(p.category_id) AS total_projects
FROM projects p
JOIN categorysql1 cc ON p.category_id = cc.id
GROUP BY cc.name
ORDER BY total_projects DESC
LIMIT 10;

#4
SELECT 
    YEAR(created_time) AS Year,
    QUARTER(created_time) AS Quarter,
    MONTH(created_time) AS Month,
    COUNT(*) AS TotalProjects
FROM 
    Projects_NaturalTime
GROUP BY 
    Year, Quarter, Month;


use projectexcelr;



