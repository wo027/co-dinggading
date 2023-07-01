with re as(
SELECT visited_on  
                , ROUND(SUM(amount) over (order by visited_on ROWS BETWEEN  6 PRECEDING AND CURRENT ROW),2)  amount       
                , ROUND(AVG(amount) over (order by visited_on ROWS BETWEEN  6 PRECEDING AND CURRENT ROW),2)  average_amount 
                , sum(1) over (order by visited_on ROWS BETWEEN  6 PRECEDING AND CURRENT ROW)  num
FROM (
        SELECT visited_on       
                , sum(amount)   amount
        FROM Customer
        GROUP BY visited_on
) a
)


SELECT visited_on 
        , amount 
        , average_amount 
FROM re 
WHERE num >= 7
ORDER BY 1
