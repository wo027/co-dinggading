WITH calc_transactions AS (
SELECT 
  product_id
  , EXTRACT(year from transaction_date) AS year
  , spend AS curr_year_spend
  , LAG(spend, 1) OVER(PARTITION BY product_id) as prev_year_spend
FROM
  user_transactions 
ORDER BY 
  1,2
)

SELECT 
  year
  , product_id
  , curr_year_spend
  , prev_year_spend
  , ROUND((curr_year_spend - prev_year_spend) / prev_year_spend * 100 ,2) AS yoy_rate
FROM 
  calc_transactions
;
