WITH calc_weight AS (
    SELECT
        person_name
      , SUM(weight) OVER(ORDER BY turn) AS total_weight
      , turn
    FROM
        Queue
)

SELECT
    person_name
FROM
    calc_weight
WHERE total_weight <= 1000
ORDER BY turn DESC
LIMIT 1
;
