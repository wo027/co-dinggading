SELECT customer_id
FROM Customer
GROUP BY customer_id 
HAVING (SELECT COUNT(DISTINCT product_key) AS cn_p FROM Product) = COUNT(DISTINCT product_key)
;
