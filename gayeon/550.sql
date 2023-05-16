WITH play_times_info AS (
SELECT
    player_id
  , MIN(event_date) AS first_play_date
FROM
    Activity
GROUP BY 1
)

SELECT 
    ROUND(COUNT(Activity.player_id) / COUNT(play_times_info.player_id), 2) AS fraction
FROM play_times_info
    LEFT JOIN Activity 
        ON play_times_info.player_id = Activity.player_id 
            AND DATE_ADD(play_times_info.first_play_date, INTERVAL 1 DAY) = Activity.event_date
;