SELECT machine_id, 
        ROUND((SUM(IF (activity_type = 'end', timestamp, NULL)) - SUM(IF (activity_type = 'start', timestamp, NULL))) / COUNT(DISTINCT process_id), 3) as processing_time
FROM Activity
GROUP BY machine_id
