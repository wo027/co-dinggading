-- 원본 데이터셋과 집계 결과가 다름

WITH tag_device_type AS (
    SELECT 
        DATE_TRUNC('day', occurred_at) AS event_date
      , user_id
      , device
      , CASE 
          WHEN device LIKE 'ipad%' OR device LIKE 'nexus%' OR device LIKE '%tablet%' OR device = 'kindle fire' 
            THEN 'tablet'
          WHEN device LIKE '%phone%' OR device LIKE '%note' OR device = 'htc one' OR device = 'nokia lumia 635' OR device = 'samsung galaxy s4' 
            THEN 'mobile'
            ELSE 'desktop' 
        END                            AS device_type
    FROM tutorial.yammer_events
    WHERE occurred_at >= '2014-04-28'
      AND event_type = 'engagement'
)

SELECT 
    DATE_TRUNC('week', event_date) AS event_week
  , device_type 
  , COUNT(DISTINCT user_id)        AS cnt_user
FROM 
    tag_device_type
GROUP BY 
    1
  , 2
;