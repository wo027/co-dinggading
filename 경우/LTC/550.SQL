WITH GR as (
        SELECT *
                ,event_date - LAG(event_date) OVER(PARTITION BY player_id ORDER BY event_date) as day
                , row_number() over(PARTITION BY player_id ORDER BY event_date) as num
        FROM Activity 
)

SELECT ROUND(SUM( CASE WHEN day = 1 AND num =2 THEN 1 ELSE 0 END)  /  COUNT(DISTINCT player_id) , 2) fraction
FROM GR
