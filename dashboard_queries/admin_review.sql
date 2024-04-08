--- Average Performance Review by department

SELECT
    d.department_id,
    d.title AS department_name,
    AVG(afs.Admin_Feedback_score) AS average_feedback_score
FROM
    AdminFeedbackScores afs
JOIN "User" u
    ON afs.User_Id = u.User_id
JOIN Department d
    ON u.department_id = d.department_id
GROUP BY
    d.department_id, d.title
ORDER BY
    d.department_id;


--- Completed Tasks By department

SELECT
    d.department_id,
    d.title AS department_name,
    ROUND(
        (COUNT(*) FILTER (WHERE tr.status = 'done')::NUMERIC /
        COUNT(*)) * 100, 2
    ) AS completion_percentage
FROM
    TaskRecord tr
JOIN OnboardingPlanRecord op
    ON tr.onboarding_plan_id = op.onboarding_plan_id
JOIN "User" u
    ON op.user_id = u.user_id
JOIN Department d
    ON u.department_id = d.department_id
GROUP BY
    d.department_id, d.title
ORDER BY
    d.department_id;

--- Top 5 potential employees
WITH UserComponentSum AS (
    SELECT
        User_id,
        SUM(User_Component_Score) AS Total_User_Component_Score
    FROM
        ComponentScores
    GROUP BY
        User_id
),
AdminFeedbackSum AS (
    SELECT
        User_Id,
        SUM(Admin_Feedback_Score) AS Total_Admin_Feedback_Score
    FROM
        AdminFeedbackScores
    GROUP BY
        User_Id
),
FinalScores AS (
    SELECT
        ucs.User_id,
        (0.7 * ucs.Total_User_Component_Score) + (0.3 * afs.Total_Admin_Feedback_Score) AS Final_Score
    FROM
        UserComponentSum ucs
    JOIN
        AdminFeedbackSum afs
    ON
        ucs.User_id = afs.User_Id
)
SELECT
    fs.User_id,
    fs.Final_Score
FROM
    FinalScores fs
ORDER BY
    Final_Score DESC
LIMIT 5;
