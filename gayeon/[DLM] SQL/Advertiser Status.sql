-- 오답. 사실 문제 영어를 제대로 해석 못함,,
WITH user_pay_info AS 
(SELECT
    advertiser.user_id
  , status
  , paid
FROM
    advertiser
    LEFT JOIN daily_pay
      ON advertiser.user_id = daily_pay.user_id
)

SELECT
    user_id
  , CASE WHEN paid IS NULL AND status IN ('RESURRECT', 'NEW')
        THEN status
        WHEN paid IS NULL
        THEN 'CHURN'
        ELSE 'EXISTING' 
    END AS new_status
FROM
    user_pay_info
ORDER BY
    1
;