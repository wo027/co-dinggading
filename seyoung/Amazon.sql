WITH C_product_spend AS(
SELECT
      category
      , product
      , SUM(spend) AS total_spend
      , ROW_NUMBER() OVER(PARTITION BY category ORDER BY SUM(spend) DESC) AS ranking
FROM product_spend
WHERE EXTRACT(YEAR FROM transaction_date) = '2022'
GROUP BY category, product
)

SELECT 
      category
      , product
      , total_spend
FROM C_product_spend
WHERE ranking <= 2
;
