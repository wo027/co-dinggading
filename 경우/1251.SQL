
SELECT product_id , ROUND(SUM(price) / SUM(units),2) average_price
FROM (
  SELECT p.product_id ,p.price * u.units as price ,u.units
  FROM Prices p
  LEFT JOIN UnitsSold u
  ON p.product_id = u.product_id
  AND u.purchase_date BETWEEN p.start_date AND end_date ) a
GROUP BY 1
