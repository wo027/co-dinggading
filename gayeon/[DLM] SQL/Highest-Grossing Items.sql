WITH rank_spend_info AS (
  SELECT
      category
    , product
    , SUM(spend) AS sum_spend
    , ROW_NUMBER() OVER(PARTITION BY category ORDER BY SUM(spend) DESC) AS spend_rank
  FROM 
      product_spend
  WHERE
      EXTRACT(YEAR FROM transaction_date) = 2022
  GROUP BY 
      1
    , 2
)

SELECT
    category
  , product
  , sum_spend AS total_spend
FROM
    rank_spend_info
WHERE
    spend_rank <= 2
;