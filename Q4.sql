use projectexcelr;
ALTER TABLE projects
ADD COLUMN goal_usd DECIMAL(20, 2);
desc projects;

SET SQL_SAFE_UPDATES = 0;

UPDATE projects
SET goal_usd = CASE
WHEN static_usd_rate = 0 THEN goal 
ELSE goal * static_usd_rate         
END;

select goal,static_usd_rate,goal_usd
from projects
ORDER BY rand()
LIMIT 100;