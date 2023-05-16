SELECT 
    contest_id
  , ROUND(COUNT(user_id) / (SELECT 
                                COUNT(user_id) 
                            FROM 
                                Users) * 100, 2) AS percentage
FROM 
    Register
GROUP BY 1
ORDER BY 2 DESC, 1
;

-- WITH절을 사용해 모든 집계를 마친 후 계산하는 방식
-- WITH all_user AS (
--   SELECT COUNT(user_id) AS cnt_all_user
--   FROM Users
-- )
-- , register_user AS (
--   SELECT
--       contest_id
--     , COUNT(user_id) AS cnt_register_user
--   FROM Register
--   GROUP BY 1
-- )

-- SELECT
--     contest_id
--   , ROUND(cnt_register_user / cnt_all_user * 100, 2) AS percentage
-- FROM all_user, register_user
-- ORDER BY 2 DESC, 1
-- ;

-- CROSS JOIN을 사용해 계산하는 방식
-- WITH contest_users_data AS (
--     SELECT
--         contest_id
--       , COUNT(DISTINCT Users.user_id) AS cnt_all_user
--       , SUM(IF(Users.user_id = Register.user_id, 1, 0)) AS cnt_register_user
--     FROM Register
--         CROSS JOIN Users
--     GROUP BY 1
-- )

-- SELECT 
--     contest_id
--   , ROUND(cnt_register_user / cnt_all_user * 100, 2) AS percentage
-- FROM contest_users_data
-- ORDER BY 2 DESC, 1
-- ;