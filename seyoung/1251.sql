SELECT p.product_id,
        ROUND(sum(p.price * u.units) / sum(u.units),2) average_price
FROM Prices p
LEFT JOIN UnitsSold u
ON p.product_id = u.product_id 
WHERE p.start_date <= u.purchase_date AND p.end_Date >= u.purchase_date
GROUP BY p.product_id
