-- 내 답은 80
-- 정답은 40,,,

WITH call_info AS (
    SELECT
        EXTRACT(YEAR FROM main_callers.call_received) AS yr
      , EXTRACT(MONTH FROM main_callers.call_received) AS mth
      , COUNT(main_callers.case_id) AS cnt_main_case_id
      , COUNT(calc_callers.case_id) AS cnt_calc_case_id
    FROM
        callers AS main_callers
        INNER JOIN callers AS calc_callers
          ON main_callers.call_duration_secs > 300 AND calc_callers.call_duration_secs > 300
          AND EXTRACT(MONTH FROM main_callers.call_received) + 1 = EXTRACT(MONTH FROM calc_callers.call_received)
    GROUP BY
        1
      , 2
)

SELECT 
    yr
  , mth
  , ROUND((cnt_main_case_id / cnt_calc_case_id - 1) * 100, 1) AS long_calls_growth_pct
FROM
    call_info
GROUP BY 
    1 
  , 2
;

WITH call_info AS (
    SELECT
        calc_callers.policy_holder_id
      , calc_callers.call_received
    FROM
        callers AS main_callers
        INNER JOIN callers AS calc_callers
          ON main_callers.policy_holder_id = calc_callers.policy_holder_id
          AND DATE(main_callers.call_received) <= DATE(calc_callers.call_received) + 7
)

SELECT 
    COUNT(DISTINCT policy_holder_id) AS patient_count
FROM
    call_info
;