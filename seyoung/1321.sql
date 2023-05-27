SELECT 
    b_Customer.visited_on AS visited_on
    , SUM(Customer.amount) AS amount
    , ROUND(SUM(Customer.amount) / 7 ,2) AS average_amount
FROM 
    Customer
    , ( SELECT 
            DISTINCT visited_on
        FROM 
            Customer
      ) AS b_Customer
WHERE DATEDIFF(b_Customer.visited_on, Customer.visited_on) between 0 and 6
GROUP BY b_Customer.visited_on
HAVING COUNT(DISTINCT Customer.visited_on) = 7
;
