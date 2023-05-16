
with a  as( 
SELECT product_id, MAX(change_date) recent
FROM Products
WHERE change_date <= '2019-08-16'
GROUP BY product_id
)

SELECT product_id, new_price price
FROM Products
WHERE (product_id,change_date) in (SELECT * FROM a)
UNION
SELECT product_id , 10 price
FROM Products 
WHERE product_id NOT in (SELECT product_id FROM a)


