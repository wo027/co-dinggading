SELECT 
    Products.product_name
    , SUM(Orders.unit) AS unit
FROM 
    Orders
    INNER JOIN Products
    ON Orders.product_id = Products.product_id
WHERE LEFT(Orders.order_date,7) = '2020-02'
GROUP BY Orders.product_id
HAVING unit >= 100 
;
