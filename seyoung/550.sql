WITH Re_Activity AS (
        SELECT 
            player_id
            , MIN(event_date) AS first_play
            , DATE_ADD(MIN(event_date), INTERVAL 1 DAY) AS re_play
        FROM Activity 
        GROUP BY player_id
)

SELECT 
    ROUND(COUNT(IF(Activity.event_date = Re_Activity.re_play , Activity.player_id , NULL)) / COUNT(DISTINCT Activity.player_id),2) AS fraction
FROM Activity
    JOIN Re_Activity
    ON Re_Activity.player_id = Activity.player_id
;
