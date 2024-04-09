-- Average Time Prompting

SELECT avg(time_taken) from ai_response_metrics;



-- average number of active days across all users:

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




-- and list all average minutes active session per user:

SELECT
    User_id,
    ROUND(AVG(EXTRACT(EPOCH FROM (Session_end - Session_start)) / 60), 2) AS average_minutes_active
FROM
    UserSessions
WHERE
    Session_end IS NOT NULL -- ensure that the session has ended
GROUP BY
    User_id;


--- acceptance rate rater: goodg/ bad based on responses from the chatbot:


SELECT 
    ROUND((COUNT(*) FILTER (WHERE type = 'good')::NUMERIC / COUNT(*)) * 100.0, 2) AS good_rating_percentage 
FROM rating;