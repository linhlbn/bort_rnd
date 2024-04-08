--- Overall Process of Employees
SELECT
  ROUND(
    (
      (SELECT COUNT(*) FROM TaskRecord WHERE status='done')::numeric /
      (SELECT COUNT(*) FROM TaskRecord)
    ) * 100.0, 2
  ) AS task_completion_percentage


--- Task completed
SELECT COUNT(*) FROM TaskRecord WHERE status='done')::numeric


--- Pending task

SELECT
  ROUND(
    
      (SELECT COUNT(*) FROM TaskRecord) -
      (SELECT COUNT(*) FROM TaskRecord WHERE status='done')::numeric /

  ) AS number_of_pending_task


--- Finish compared yesterday

WITH CompletionToday AS (
    SELECT
        ROUND(
            (COUNT(*) FILTER (WHERE finish_at::DATE = CURRENT_DATE AND status = 'done')::NUMERIC /
            COUNT(*) FILTER (WHERE finish_at::DATE = CURRENT_DATE)) * 100.0, 2
        ) AS task_completion_percentage_today
),
CompletionYesterday AS (
    SELECT
        ROUND(
            (COUNT(*) FILTER (WHERE finish_at::DATE = CURRENT_DATE - INTERVAL '1 day' AND status = 'done')::NUMERIC /
            COUNT(*) FILTER (WHERE finish_at::DATE = CURRENT_DATE - INTERVAL '1 day')) * 100.0, 2
        ) AS task_completion_percentage_yesterday
)
SELECT
    COALESCE((SELECT task_completion_percentage_today FROM CompletionToday), 0) -
    COALESCE((SELECT task_completion_percentage_yesterday FROM CompletionYesterday), 0) AS difference_in_completion_percentage


--- Complete percentage by task type

SELECT tt.task_type_id, tty.title, COUNT(tr.task_id) as finished_task_count
FROM TaskRecord tr
JOIN TaskTemplate tt ON tr.task_template_id = tt.task_template_id
JOIN TaskTypes tty ON tt.task_type_id = tty.task_type_id
WHERE tr.status = 'done'
GROUP BY tt.task_type_id, tty.title
ORDER BY tt.task_type_id;

Query to calculate complete percentage by task type:
SELECT
    tt.task_type_id,
    tty.title,
    ROUND(
        (COUNT(*) FILTER (WHERE tr.status = 'done')::NUMERIC / COUNT(*)) * 100, 2
    ) AS completion_percentage
FROM
    TaskRecord tr
INNER JOIN TaskTemplate tt
    ON tr.task_template_id = tt.task_template_id
INNER JOIN TaskTypes tty
    ON tt.task_type_id = tty.task_type_id
GROUP BY
    tt.task_type_id, tty.title
ORDER BY
    tt.task_type_id;

--- Finish tasks by department and their completion percentage

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
