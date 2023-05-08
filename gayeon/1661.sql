WITH calc_processing_time AS (
    SELECT DISTINCT
        machine_id
      , process_id
      , timestamp AS start_timestamp
      , LEAD(timestamp) OVER(PARTITION BY machine_id, process_id ORDER BY timestamp) AS end_timestamp
    FROM Activity
)

SELECT 
        machine_id
      , ROUND(AVG(end_timestamp - start_timestamp), 3) AS processing_time
FROM calc_processing_time
GROUP BY 1
;