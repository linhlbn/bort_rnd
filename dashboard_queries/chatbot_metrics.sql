-- Average Time Prompting

SELECT avg(time_taken) from ai_response_metrics;


-- Average active days

WITH ActiveDays AS (
    SELECT 
        User_id, 
        COUNT(DISTINCT CAST(Session_start AS DATE)) AS active_day_count
    FROM UserSessions
    GROUP BY User_id
)
SELECT 
    AVG(active_day_count::NUMERIC) AS average_active_days_per_user
FROM ActiveDays;


-- Acceptance Rate

SELECT 
    ROUND((COUNT(*) FILTER (WHERE type = 'good')::NUMERIC / COUNT(*)) * 100.0, 2) AS good_rating_percentage 
FROM rating;