WITH a as (
SELECT requester_id                    AS id
        , count(distinct accepter_id)  AS num
FROM RequestAccepted
GROUP BY requester_id
UNION ALL
SELECT accepter_id                      AS id
        , count(distinct requester_id)  AS num
FROM RequestAccepted
GROUP BY accepter_id
)


SELECT id 
    , sum(num) as num 
FROM  a
GROUP BY id
ORDER BY 2 DESC LIMIT 1
