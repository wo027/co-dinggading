WITH daily_info AS (
    SELECT
        visited_on
      , SUM(amount) AS amount
    FROM
        Customer
    GROUP BY 1
)

SELECT
    origin_customer.visited_on
  , SUM(calc_customer.amount) AS amount
  , ROUND(SUM(calc_customer.amount) / 7, 2) AS average_amount
FROM
    daily_info AS origin_customer
    LEFT JOIN daily_info AS calc_customer
        ON origin_customer.visited_on BETWEEN calc_customer.visited_on AND DATE_ADD(calc_customer.visited_on, INTERVAL 6 DAY)
GROUP BY 1
HAVING COUNT(calc_customer.visited_on) >= 7
;