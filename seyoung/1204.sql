SELECT 
    person_name
FROM 
    (SELECT
        turn
        , person_id
        , person_name
        , weight
        , SUM(weight) OVER(ORDER BY turn) AS Total_Weight
    FROM Queue) AS add_total_Queue
WHERE Total_Weight <= 1000
ORDER BY turn desc
LIMIT 1
;
