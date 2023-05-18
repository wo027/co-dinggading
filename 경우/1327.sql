SELECT product_name
        , sum(unit) AS unit
FROM Products p
    INNER JOIN Orders o
    ON p.product_id = o.product_id
WHERE DATE_FORMAT(o.order_date,'%Y-%m') = '2020-02'
GROUP BY product_name
HAVING sum(unit) >= 100
