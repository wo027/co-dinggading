WITH Change_product AS(
SELECT 
    DISTINCT product_id
    , MAX(change_date) OVER(PARTITION BY product_id) AS change_date
FROM Products
WHERE change_date <= '2019-08-16'
)

SELECT 
    Products.product_id 
    ,Products.new_price AS price
FROM Products
    JOIN Change_product
    ON Products.product_id = Change_product.product_id AND Products.change_date = Change_product.change_date

UNION

SELECT 
    DISTINCT product_id
    , 10 AS price
FROM Products
GROUP BY product_id
HAVING (MIN(change_date) > "2019-08-16")
;
