with monthly_user AS (
  SELECT user_id
        , DATE_TRUNC('month', event_date)   as month_day
        , COUNT( DISTINCT event_type)       as cnt
  FROM user_actions
  WHERE EXTRACT('month' FROM event_date) IN (6,7)
  GROUP BY user_id , DATE_TRUNC('month', event_date)
) 
, lag_monthly as (
SELECT *
      , LAG(month_day) OVER(PARTITION BY user_id ORDER BY month_day) pre_month
      , LAG(cnt) OVER(PARTITION BY user_id ORDER BY month_day)  pre_cnt
FROM monthly_user 
)

SELECT EXTRACT('month' FROM month_day)    as month
      , COUNT(*)                          as monthly_active_users
FROM lag_monthly
WHERE cnt >= 1 AND pre_cnt >=1 
GROUP BY 1