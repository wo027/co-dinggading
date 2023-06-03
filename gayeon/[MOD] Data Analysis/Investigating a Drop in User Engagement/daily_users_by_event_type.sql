WITH event_by_user AS (
    SELECT
        DATE_TRUNC('day', occurred_at)                         AS event_date
      , user_id
      , CASE WHEN event_type = 'engagement' THEN 1 ELSE 0 END      AS engagement
      , CASE WHEN event_type = 'signup_flow' THEN 1 ELSE 0 END      AS signup_flow
    FROM 
        tutorial.yammer_events
)
, calc_event_by_user AS (
    SELECT 
        event_date
      , user_id
      , SUM(engagement) AS cnt_engagement_event
      , SUM(signup_flow) AS cnt_signup_flow_event
FROM 
    event_by_user
GROUP BY 
    1, 2
)

SELECT 
    event_date
  , COUNT(DISTINCT CASE WHEN cnt_engagement_event >= 1 AND cnt_signup_flow_event >= 1 THEN user_id END) AS cnt_signup_engagement_user
  , COUNT(DISTINCT CASE WHEN cnt_engagement_event = 0 AND cnt_signup_flow_event >= 1 THEN user_id END) AS cnt_signup_user
  , COUNT(DISTINCT CASE WHEN cnt_engagement_event >= 1 AND cnt_signup_flow_event = 0 THEN user_id END) AS cnt_engagement_user
FROM 
    calc_event_by_user
GROUP BY 
    1
ORDER BY 
    1
;