SELECT 
    DATE_TRUNC('day', occurred_at) AS event_date
  , event_name 
  , COUNT(user_id)
FROM 
    tutorial.yammer_events
WHERE
    event_type = 'engagement'
GROUP BY 
    1 
  , 2
ORDER BY 
    1 DESC
;
