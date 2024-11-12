use projectexcelr;
#q(1)
CREATE VIEW Projects_NaturalTime AS
SELECT 
    ProjectID,
    state,
    name,
    country,
    creator_id,
    location_id,
    category_id,
    FROM_UNIXTIME(created_at) AS created_time,
    FROM_UNIXTIME(deadline) AS deadline_time,
    FROM_UNIXTIME(updated_at) AS updated_time,
    FROM_UNIXTIME(state_changed_at) AS state_changed_time,
    FROM_UNIXTIME(successful_at) AS successful_time,
    FROM_UNIXTIME(launched_at) AS launch_time,
    goal,
    pledged,
    currency,
    currency_symbol,
    usd_pledged,
    static_usd_rate,
    backers_count,
    spotlight,
    staff_pick,
    blurb,
    currency_trailing_code,
    disable_communication
FROM Projects;
select * from projects_naturaltime;