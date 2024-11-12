#7
#1
SELECT 
    ProjectID,
    name,
    backers_count
FROM 
    Projects_NaturalTime
WHERE 
    state = 'Successful'
ORDER BY 
    backers_count DESC
LIMIT 10;  
#2
SELECT 
    ProjectID,
    name,
    pledged
FROM 
    Projects_NaturalTime
WHERE 
    state = 'Successful'
ORDER BY 
    pledged DESC
LIMIT 10;  