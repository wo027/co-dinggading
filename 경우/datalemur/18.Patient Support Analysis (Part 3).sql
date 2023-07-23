

SELECT COUNT(DISTINCT policy_holder_id ) as patient_count
FROM (
SELECT policy_holder_id
      , call_received
      , LAG(call_received)  OVER(PARTITION BY policy_holder_id ORDER BY  call_received ) pre_call_received
      , call_received  - LAG(call_received)  OVER(PARTITION BY policy_holder_id ORDER BY  call_received ) AS datediff
FROM callers
) a 
WHERE DATE_PART('day' ,datediff) < 7 