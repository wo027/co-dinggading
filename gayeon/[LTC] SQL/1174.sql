WITH first_order_info AS (
    SELECT
        customer_id
      , MIN(order_date) AS first_order_date
    FROM Delivery
    GROUP BY 1
)

SELECT
    ROUND(SUM(order_date = customer_pref_delivery_date) / COUNT(*) * 100, 2) AS immediate_percentage
FROM 
    Delivery
    INNER JOIN first_order_info 
        ON Delivery.customer_id = first_order_info.customer_id 
            AND Delivery.order_date = first_order_info.first_order_date
;