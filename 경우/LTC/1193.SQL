SELECT LEFT(trans_date,7) month
        , country
        , COUNT(id) trans_count
        , SUM( CASE WHEN state = 'approved' THEN 1  ELSE 0 END) as approved_count
        , SUM(amount) trans_total_amount
        , SUM( CASE WHEN state = 'approved' THEN  amount ELSE 0 END ) as approved_total_amount
FROM Transactions 
GROUP BY LEFT(trans_date,7) , country