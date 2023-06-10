SELECT
    query_name
  , ROUND(AVG(rating / position), 2)                     AS quality
  , ROUND(SUM(IF(rating < 3, 1, 0)) / COUNT(*) * 100, 2) AS poor_query_percentage
  -- ROUND(AVG(rating < 3) * 100, 2)                     AS poor_query_percentage 
  -- (rating < 3)은 1 또는 0을 반환. 따라서 AVG() 사용 가능.
FROM
    Queries
GROUP BY 1
;