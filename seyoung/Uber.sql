WITH N_transactions AS (
SELECT *
      , ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date ASC) AS N_Row
FROM transactions
)

SELECT 
      user_id
      , spend
      , transaction_date
FROM N_transactions
WHERE N_row = 3
;
