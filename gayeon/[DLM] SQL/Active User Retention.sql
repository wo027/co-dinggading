WITH active_user_info AS (
  SELECT
      EXTRACT(MONTH FROM current_month_info.event_date) AS month
    , current_month_info.user_id
  FROM
    user_actions AS last_month_info
    INNER JOIN user_actions AS current_month_info
      ON last_month_info.user_id = current_month_info.user_id
      AND EXTRACT(YEAR FROM last_month_info.event_date) = 2022
      AND EXTRACT(MONTH FROM last_month_info.event_date) = 6
      AND EXTRACT(YEAR FROM current_month_info.event_date) = 2022
      AND EXTRACT(MONTH FROM current_month_info.event_date) = 7
)

SELECT
    month
  , COUNT(DISTINCT user_id) AS 	monthly_active_users
FROM active_user_info
GROUP BY 1
;