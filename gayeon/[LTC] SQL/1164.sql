WITH max_date_info AS (
    SELECT
        product_id
      , MAX(change_date) AS max_date
    FROM
        Products
    WHERE
        change_date <= '2019-08-16'
    GROUP BY 1
)

SELECT DISTINCT
    Products.product_id
  , IFNULL(max_date_price_info.new_price, 10) AS price
FROM
    Products
    LEFT JOIN (
        SELECT *
        FROM 
            Products
        WHERE (product_id, change_date) IN (
            SELECT *
            FROM max_date_info
        )
    ) AS max_date_price_info
        ON Products.product_id = max_date_price_info.product_id
;
