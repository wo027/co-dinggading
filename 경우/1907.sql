
with cate as (
  SELECT 'Low Salary' as  category 
  UNION ALL
  SELECT 'Average Salary' as  category 
  UNION ALL
  SELECT 'High Salary' as  category 
)

SELECT  cate.category 
        , CASE 
            WHEN isnull(a.account_id) THEN 0 
            ELSE count(a.account_id) 
          END as accounts_count 
FROM cate
  LEFT JOIN  (
    SELECT *
        ,CASE 
            WHEN income  < 20000 THEN 'Low Salary'
            WHEN income  >= 20000 AND  income <= 50000 THEN 'Average Salary'
            ELSE  'High Salary' 
        END as category
    FROM Accounts )a
ON cate.category = a.category
GROUP BY cate.category 
ORDER BY 2