SELECT customer_id 
FROM Customer
GROUP BY customer_id
HAVING count(distinct product_key ) =  ( SELECT DISTINCT COUNT(product_key) FROM Product)
