-- tutorial.yammer_events
-- tutorial.yammer_users
-- tutorial.yammer_emails
-- benn.dimension_rollup_periods, 일 단위로 7일간의 기간


-- event_type별로 id를 계산하기 때문에 signup_flow 후 engagement 된 유저는 중복 집계됨
SELECT
    DATE_TRUNC('day', occurred_at) AS event_date
  , event_type
  , COUNT(DISTINCT user_id)      AS cnt_user
FROM tutorial.yammer_events
GROUP BY
    1
  , 2
ORDER BY
    1
  , 2
;

SELECT
    DATE_TRUNC('day', occurred_at)                         AS event_date
  , COUNT(DISTINCT user_id)                                         AS cnt_all_user
  , COUNT(DISTINCT CASE WHEN event_type = 'engagement' THEN user_id END)      AS cnt_activate_user
  , COUNT(DISTINCT CASE WHEN event_type = 'signup_flow' THEN user_id END)      AS cnt_signup_flow_user
FROM tutorial.yammer_events
GROUP BY
    1
ORDER BY
    1
;

WITH event_by_user AS (
SELECT
    DATE_TRUNC('day', occurred_at)                         AS event_date
  , user_id
  , CASE WHEN event_type = 'engagement' THEN 1 ELSE 0 END      AS engagement
  , CASE WHEN event_type = 'signup_flow' THEN 1 ELSE 0 END      AS signup_flow
FROM tutorial.yammer_events
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
    1
  , 2
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

-- 디바이스별
SELECT
    DATE_TRUNC('day', occurred_at) AS event_date
  , device
  , COUNT(DISTINCT user_id)      AS cnt_user
FROM tutorial.yammer_events
GROUP BY
    1
  , 2
ORDER BY
    1
  , 2
;

-- 가입현황
WITH signup_info AS (
SELECT
    DATE_TRUNC('day', occurred_at) AS event_date
  , user_id
  , COUNT(user_type) AS cnt_user_type
FROM tutorial.yammer_events
WHERE event_type = 'signup_flow'
GROUP BY 1, 2
)

SELECT 
    event_date 
  -- , COUNT(DISTINCT user_id) AS cnt_signup_user
  , COUNT(DISTINCT CASE WHEN cnt_user_type = 0 THEN user_id END) AS cnt_not_done_user
  -- , COUNT(DISTINCT CASE WHEN cnt_user_type >= 1 THEN user_id END) AS cnt_done_user
FROM 
    signup_info
GROUP BY 
    1
ORDER BY 
    1
;

WITH signup_info AS (
SELECT
    user_id
  , COUNT(user_type) AS cnt_user_type
FROM tutorial.yammer_events
WHERE event_type = 'signup_flow'
GROUP BY 1
)

-- QUERY3과 동일 결과, enga : 79, signup : 22
SELECT event_type, COUNT(DISTINCT user_id)
FROM tutorial.yammer_events
WHERE DATE_TRUNC('day', occurred_at) = '2014-05-04'
GROUP BY 1
;

-- QUERY6 : 가입 22, 이 날 활성화된 유저 9
SELECT
    DATE_TRUNC('WEEK', occurred_at)                         AS event_date
  , COUNT(DISTINCT user_id)                                         AS cnt_all_user
  , COUNT(DISTINCT CASE WHEN event_type = 'engagement' THEN user_id END)      AS cnt_activate_user
    , COUNT(DISTINCT CASE WHEN event_type = 'signup_flow' THEN user_id END)      AS cnt_signup_flow_user
FROM tutorial.yammer_events
GROUP BY
    1
ORDER BY
    1
;
