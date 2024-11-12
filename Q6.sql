
#q(6)
#1
SELECT 
    SUM(goal) AS TotalAmountRaised
FROM 
    Projects_NaturalTime
WHERE 
    state = 'Successful';
 #2
 SELECT 
    SUM(backers_count) AS TotalBackers
FROM 
    Projects_NaturalTime
WHERE 
    state = 'Successful';
 #3
 SELECT 
   concat(round( AVG(DATEDIFF(FROM_UNIXTIME(deadline), FROM_UNIXTIME(created_at))),0),"days") AS AvgDays
FROM 
    Projects
WHERE 
    state = 'Successful';

