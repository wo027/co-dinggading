SELECT COUNT(merchant_id) payment_count
FROM (
  SELECT merchant_id
        , credit_card_id
        , transaction_timestamp  - lag(transaction_timestamp) OVER(PARTITION BY merchant_id ,credit_card_id ORDER BY transaction_timestamp) as diff
  FROM transactions
  GROUP BY merchant_id ,credit_card_id , transaction_timestamp
) a 
WHERE date_part('MINUTE' , diff) < 10 