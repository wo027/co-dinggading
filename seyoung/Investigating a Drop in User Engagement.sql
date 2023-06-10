-- 이메일 오픈 왜 했을까? / USER_TYPE 별로 이메일을 잘 읽음? / 활성사용자로 연결이 되는가?
SELECT DATE_TRUNC('day', occurred_at)  AS day
      , user_id
      , SUM(CASE WHEN action = 'email_open' THEN  1 ELSE 0 END) AS cnt_open
      , SUM(CASE WHEN action = 'sent_weekly_digest' THEN  1 ELSE 0 END) AS cnt_sent
FROM tutorial.yammer_emails 
GROUP BY 2 , 1
ORDER BY 2 , 1
;

-- 간과한 점 언제 보낸 이메일을 읽은 건지를 알수가 없음 
--- 그럼 오픈을 많이 하는 사람한테는 이메일 전달이 효과적이지 않을까? 이메일을 잘 확인하는 유저 타입은 ?
---- 유의미하지 않군.. 모두 비슷한 비율로 읽는다
SELECT user_type
      , SUM(CASE WHEN action = 'email_open' THEN  1 ELSE 0 END) AS cnt_open
      , SUM(CASE WHEN action = 'sent_weekly_digest' THEN  1 ELSE 0 END) AS cnt_sent
       , SUM(CASE WHEN action = 'email_open' THEN  1 ELSE 0 END) /  CAST(SUM(CASE WHEN action = 'sent_weekly_digest' THEN  1 ELSE 0 END) AS FLOAT) * 100 AS open_ratio
FROM tutorial.yammer_emails 
GROUP BY 1
;

-- 일별 활성가입자 / 비활성가입자 / 가입자 / 활성률
  SELECT DATE_TRUNC('day', created_at)  AS day
        , SUM(CASE WHEN state = 'active' THEN  1 ELSE 0 END) AS cnt_active
        , SUM(CASE WHEN state = 'pending' THEN  1 ELSE 0 END) AS cnt_pending
        , COUNT(user_id) AS cnt_createduser
        , SUM(CASE WHEN state = 'active' THEN  1 ELSE 0 END) /  CAST(count(user_id) AS FLOAT) * 100 AS active_ratio
        --일반적으로, SQL에서 정수형 값끼리의 나눗셈 연산은 정수형 결과를 반환합니다. 모두 정수형이므로, 그들을 나누면 소수점 이하는 버려지고 정수형 결과가 반환됩니다.
  FROM tutorial.yammer_users 
  GROUP BY 1 
  ORDER BY 1 
  ;
  
  -- 주간 가입현황
--- 유저 가입량은 꾸준히 늘고있는 추세
SELECT
    DATE_TRUNC('week', occurred_at) AS week_day
  , COUNT(user_id) AS cnt_user_id
FROM tutorial.yammer_events
WHERE event_type = 'signup_flow'
GROUP BY 1
;

-- 디바이스 별 활동량 확인
SELECT
    DATE_TRUNC('week', occurred_at) AS week_day
  , device
  , COUNT(DISTINCT user_id) AS cnt_user_id
FROM tutorial.yammer_events
GROUP BY
    1
  , 2
ORDER BY
    1
  , 3 desc
;

-- 많이 사용하는 디바이스
--- UI/UX 검토 가능
SELECT
  device
  , COUNT(DISTINCT user_id) AS cnt_user_id
FROM tutorial.yammer_events
GROUP BY
    1
ORDER BY 
    2 DESC
LIMIT 10
;

--이메일 오픈과 로그인 간의 상관관계

SELECT tutorial.yammer_events.user_id
      , tutorial.yammer_emails.occurred_at AS mail_opened_at
      , tutorial.yammer_events.occurred_at AS event_occurred_at
      , EXTRACT(day FROM tutorial.yammer_events.occurred_at - tutorial.yammer_emails.occurred_at) AS hour_diff
      , tutorial.yammer_events.event_name 
FROM 
      tutorial.yammer_events
INNER JOIN 
      tutorial.yammer_emails
    ON 
      tutorial.yammer_events.user_id = tutorial.yammer_emails.user_id
WHERE 
      tutorial.yammer_events.event_name = 'login' 
      AND 
      tutorial.yammer_emails.action = 'email_open'
      AND 
      tutorial.yammer_emails.occurred_at < tutorial.yammer_events.occurred_at
;
