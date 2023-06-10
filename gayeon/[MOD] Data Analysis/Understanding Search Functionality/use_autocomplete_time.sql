-- 기간 설정 필요
-- search와 autocomplete 대조 가능, 이외 이메일과 같은 다른 활동들과 검색 활동 자체를 비교해볼 수 있음
WITH calc_autocomplete AS (
    SELECT 
        user_id
      , COUNT(DISTINCT occurred_at) AS cnt_use_auto
  FROM 
        tutorial.yammer_events
  WHERE
      event_name = 'search_autocomplete'
  GROUP BY 
      1
)

SELECT 
    cnt_use_auto
  , COUNT(user_id) AS cnt_user
FROM 
    calc_autocomplete
GROUP BY
    1
;