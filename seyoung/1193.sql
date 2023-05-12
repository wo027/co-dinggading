SELECT 
    country
    , SUBSTRING(trans_date, 1, 7) AS month
    , COUNT(*) AS trans_count
    , COUNT(IF(state = 'approved', id, NULL)) AS approved_count
    , SUM(amount) AS trans_total_amount
    , SUM(IF(state = 'approved', amount, 0)) AS approved_total_amount
FROM Transactions
GROUP BY country, SUBSTRING(trans_date, 1, 7)
;
