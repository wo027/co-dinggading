WITH age_activities_info AS (
  SELECT 
      activities.user_id
    , activity_type
    , time_spent
    , age_bucket
  FROM activities
      INNER JOIN age_breakdown
        ON activities.user_id = age_breakdown.user_id
  WHERE
       activity_type = 'open'
    OR activity_type = 'send'
)
, calc_age_activities_info AS (
    SELECT
        age_bucket
      , SUM(time_spent) AS total_time_spent
      , SUM(CASE WHEN activity_type = 'open' THEN time_spent END) AS sum_open_time_spent
      , SUM(CASE WHEN activity_type = 'send' THEN time_spent END) AS sum_send_time_spent
    FROM 
        age_activities_info
    GROUP BY 
        1
)

SELECT
    age_bucket
  , ROUND(sum_send_time_spent / total_time_spent * 100, 2) AS send_perc
  , ROUND(sum_open_time_spent / total_time_spent * 100, 2) AS open_perc
FROM
    calc_age_activities_info
;