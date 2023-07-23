/*
신규: 신규로 등록되어 첫 번째 결제를 완료한 광고주입니다.
기존: 과거에 결제한 적이 있고 최근에 현재 결제한 광고주입니다.
이탈: 과거에 결제한 적이 있지만 최근에 결제한 적이 없는 광고주입니다.
부활: 최근에 결제를 하지 않았지만 이전에 결제하고 최근에 다시 결제했을 수 있는 광고주.
*/

WITH ad_info as (
  SELECT coalesce(pay.user_id, ad.user_id)   as user_id
       , ad.status                           as status 
       , coalesce( SUM(pay.paid) ::int , 0)  as cu_paid
  FROM advertiser ad
    FULL OUTER JOIN  daily_pay pay ON ad.user_id = pay.user_id
  GROUP BY 1 ,2 
  ORDER BY 1 ,2 
) 


SELECT user_id
     , CASE 
        WHEN status ISNULL  AND cu_paid > 0 THEN 'NEW'
        WHEN cu_paid = 0 THEN 'CHURN'
        WHEN status IN('EXISTING' , 'RESURRECT','NEW') AND cu_paid > 0 THEN 'EXISTING'
        WHEN status = 'CHURN' AND cu_paid > 0 THEN 'RESURRECT'
      END  AS new_status
FROM ad_info


  