WITH C_activities AS (
SELECT age_breakdown.age_bucket
      , activities.activity_type
      , SUM(activities.time_spent) AS time_spent
FROM activities
    INNER JOIN age_breakdown 
    ON activities.user_id = age_breakdown.user_id 
WHERE activities.activity_type IN ('send', 'open') 
GROUP BY age_breakdown.age_bucket , activities.activity_type
)

SELECT 
      age_bucket
      , ROUND((SUM(
            CASE WHEN activity_type = 'send' 
            THEN time_spent
            ELSE 0
            END
            ) / SUM(time_spent))*100, 2) AS spend_perc
      , ROUND((SUM(
            CASE WHEN activity_type = 'open' 
            THEN time_spent
            ELSE 0
            END
            ) / SUM(time_spent))*100, 2 )AS open_perc
FROM C_activities
GROUP BY age_bucket
;
