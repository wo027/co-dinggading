WITH spend_info AS (
  SELECT
      user_id
    , spend
    , transaction_date
    , ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date) AS rank_transaction_date
  FROM 
      transactions
)

SELECT
    user_id
  , spend
  , transaction_date
FROM 
    spend_info
WHERE
    rank_transaction_date = 3
;