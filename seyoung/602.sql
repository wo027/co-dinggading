WITH union_id AS(
SELECT 
    requester_id AS id
FROM 
    RequestAccepted 

UNION ALL

SELECT 
     accepter_id AS id
FROM 
    RequestAccepted 
)

SELECT 
    id
    , COUNT(id) AS num
FROM union_id
GROUP BY id
ORDER BY num desc
LIMIT 1
;
