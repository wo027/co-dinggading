WITH income_info AS (
    SELECT
        account_id
      , CASE WHEN income < 20000 THEN 'Low Salary'
        WHEN 50000 < income THEN 'High Salary'
        ELSE 'Average Salary' END AS category
    FROM
        Accounts
)
, income_category AS (
    SELECT 'Low Salary' AS category
    UNION
    SELECT 'Average Salary' AS category
    UNION
    SELECT 'High Salary' AS category
)

SELECT 
    income_category.category
  , COUNT(account_id) AS accounts_count
FROM
    income_category
    LEFT JOIN income_info
        ON income_category.category = income_info.category
GROUP BY 1
;