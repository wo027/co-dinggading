WITH year_spend_info AS (
    SELECT
        EXTRACT(YEAR FROM transaction_date) AS year 
      , product_id
      , SUM(spend) AS year_spend
    FROM
        user_transactions
    GROUP BY 
        1
      , 2
)
, yoy_year_spend_info AS (
    SELECT
        main_info.year 
      , main_info.product_id 
      , main_info.year_spend AS curr_year_spend
      , calc_info.year_spend AS prev_info_spend
    FROM
        year_spend_info AS main_info
        LEFT JOIN year_spend_info AS calc_info
          ON main_info.product_id = calc_info.product_id
          AND main_info.year - 1 = calc_info.year
)

SELECT 
    *
  , ROUND((curr_year_spend / prev_info_spend - 1) * 100, 2) AS yoy_rate
FROM
    yoy_year_spend_info
ORDER BY
    2
  , 1
;