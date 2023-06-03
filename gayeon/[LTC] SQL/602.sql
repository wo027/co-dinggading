SELECT
    id
  , COUNT(id) AS num
FROM
    (
        (
            SELECT requester_id AS id
            FROM RequestAccepted
        )

        UNION ALL

        (
            SELECT accepter_id AS id
            FROM RequestAccepted
        )
    ) AS union_request_accepted

GROUP BY
    1
ORDER BY
    2 DESC
LIMIT 1
;