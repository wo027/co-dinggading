SELECT
    ROUND(COUNT(IF(order_date = customer_pref_delivery_date, delivery_id, NULL)) / COUNT(*) *100, 2) AS immediate_percentage
FROM Delivery 
WHERE (customer_id, order_date)
    IN (
        SELECT customer_id
            , MIN(order_date) 
        FROM Delivery 
        GROUP BY customer_id
        )
;
