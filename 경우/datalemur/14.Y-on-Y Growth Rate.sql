SELECT EXTRACT('year' FROM year_date) AS year
      , product_id
      , yearly_spend   AS curr_year_spend
      , LAG(yearly_spend) OVER(PARTITION BY product_id ORDER BY year_date ) AS prev_year_spend
      , ROUND((yearly_spend - LAG(yearly_spend) OVER(PARTITION BY product_id ORDER BY year_date ))
         / LAG(yearly_spend) OVER(PARTITION BY product_id ORDER BY year_date ) *100,2)
FROM (
  SELECT product_id
        , DATE_TRUNC('year' , transaction_date)  AS year_date
        , SUM(spend)   AS yearly_spend
  FROM user_transactions
  GROUP BY 1 ,2
) a 
ORDER BY 2 , 1  