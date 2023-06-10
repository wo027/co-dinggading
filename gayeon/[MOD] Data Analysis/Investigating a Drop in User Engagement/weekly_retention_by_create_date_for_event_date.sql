-- 이벤트, 가입 후 이벤트까지 시점 기준

WITH calc_created_date_to_event_date AS (
    SELECT 
        users.user_id
      , DATE_TRUNC('day', events.occurred_at) AS event_date
      , DATE_TRUNC('day', users.created_at) AS created_date
      , DATE_PART('day', events.occurred_at - users.created_at) AS calc_for_event_date
    FROM 
        tutorial.yammer_users AS users
          INNER JOIN tutorial.yammer_events AS events
              ON users.user_id = events.user_id
    WHERE events.occurred_at >= '2014-04-28'
      AND users.activated_at IS NOT NULL
      AND events.event_type = 'engagement'
)

SELECT 
    DATE_TRUNC('week', event_date) AS event_week
  , COUNT(DISTINCT CASE WHEN calc_for_event_date < 7 THEN user_id END) AS "under_1_week"
  , COUNT(DISTINCT CASE WHEN 7 <= calc_for_event_date AND calc_for_event_date < 14 THEN user_id END) AS "1_week"
  , COUNT(DISTINCT CASE WHEN 14 <= calc_for_event_date AND calc_for_event_date < 21 THEN user_id END) AS "2_week"
  , COUNT(DISTINCT CASE WHEN 21 <= calc_for_event_date AND calc_for_event_date < 28 THEN user_id END) AS "3_week"
  , COUNT(DISTINCT CASE WHEN 28 <= calc_for_event_date AND calc_for_event_date < 35 THEN user_id END) AS "4_week"
  , COUNT(DISTINCT CASE WHEN 35 <= calc_for_event_date AND calc_for_event_date < 42 THEN user_id END) AS "5_week"
  , COUNT(DISTINCT CASE WHEN 42 <= calc_for_event_date AND calc_for_event_date < 49 THEN user_id END) AS "6_week"
  , COUNT(DISTINCT CASE WHEN 49 <= calc_for_event_date AND calc_for_event_date < 56 THEN user_id END) AS "7_week"
  , COUNT(DISTINCT CASE WHEN 56 <= calc_for_event_date AND calc_for_event_date < 63 THEN user_id END) AS "8_week"
  , COUNT(DISTINCT CASE WHEN 63 <= calc_for_event_date AND calc_for_event_date < 70 THEN user_id END) AS "9_week"
  , COUNT(DISTINCT CASE WHEN 70 <= calc_for_event_date THEN user_id END) AS "more_10_week"
FROM 
    calc_created_date_to_event_date
GROUP BY 1
ORDER BY 1
;

-- 가입 시점 기준
WITH calc_created_date_to_event_date AS (
    SELECT 
        users.user_id
      , DATE_TRUNC('day', events.occurred_at) AS event_date
      , DATE_TRUNC('day', users.created_at) AS created_date
      , DATE_PART('day', events.occurred_at - users.activated_at) AS calc_for_event_date
    FROM 
        tutorial.yammer_users AS users
          INNER JOIN tutorial.yammer_events AS events
              ON users.user_id = events.user_id
    WHERE events.occurred_at >= '2014-04-28'
      AND users.activated_at IS NOT NULL
      AND events.event_type = 'engagement'
)

SELECT 
    DATE_TRUNC('week', created_date) AS event_week
  , COUNT(DISTINCT user_id) AS cnt_user
  , COUNT(DISTINCT CASE WHEN calc_for_event_date < 7 THEN user_id END) AS "under_1_week"
  , COUNT(DISTINCT CASE WHEN 7 <= calc_for_event_date AND calc_for_event_date < 14 THEN user_id END) AS "1_week"
  , COUNT(DISTINCT CASE WHEN 14 <= calc_for_event_date AND calc_for_event_date < 21 THEN user_id END) AS "2_week"
  , COUNT(DISTINCT CASE WHEN 21 <= calc_for_event_date AND calc_for_event_date < 28 THEN user_id END) AS "3_week"
  , COUNT(DISTINCT CASE WHEN 28 <= calc_for_event_date AND calc_for_event_date < 35 THEN user_id END) AS "4_week"
  , COUNT(DISTINCT CASE WHEN 35 <= calc_for_event_date AND calc_for_event_date < 42 THEN user_id END) AS "5_week"
  , COUNT(DISTINCT CASE WHEN 42 <= calc_for_event_date AND calc_for_event_date < 49 THEN user_id END) AS "6_week"
  , COUNT(DISTINCT CASE WHEN 49 <= calc_for_event_date AND calc_for_event_date < 56 THEN user_id END) AS "7_week"
  , COUNT(DISTINCT CASE WHEN 56 <= calc_for_event_date AND calc_for_event_date < 63 THEN user_id END) AS "8_week"
  , COUNT(DISTINCT CASE WHEN 63 <= calc_for_event_date AND calc_for_event_date < 70 THEN user_id END) AS "9_week"
  , COUNT(DISTINCT CASE WHEN 70 <= calc_for_event_date THEN user_id END) AS "more_10_week"
FROM 
    calc_created_date_to_event_date
GROUP BY 1
ORDER BY 1
;