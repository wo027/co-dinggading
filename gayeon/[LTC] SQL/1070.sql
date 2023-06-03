SELECT 
    product_id
  , year          AS first_year
  , quantity
  , price
FROM 
    Sales
WHERE 
    (product_id, year) IN (
        SELECT
            product_id
          , MIN(year)
        FROM Sales
        GROUP BY 1
    )
;

-- WITH first_sold_info AS (
--     SELECT
--         product_id
--       , MIN(year) AS first_year
--     FROM
--         Sales
--     GROUP BY 1
-- )

-- SELECT 
--     Sales.product_id
--   , first_year
--   , quantity
--   , price
-- FROM 
--     Sales
--         INNER JOIN first_sold_info
--             ON first_sold_info.product_id = Sales.product_id
--                 AND first_sold_info.first_year = Sales.year
-- ;