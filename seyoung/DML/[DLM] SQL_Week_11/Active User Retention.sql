SELECT 
  EXTRACT(month FROM event_date) AS month
  , COUNT(DISTINCT user_id) AS monthly_active_users
FROM 
  user_actions
WHERE 
  EXTRACT(month FROM event_date) = 7 
  AND user_id IN (
  SELECT 
    user_id
  FROM 
    user_actions
  WHERE EXTRACT(month FROM event_date) = 6) 
GROUP BY 1
;
