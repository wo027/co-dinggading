WITH footage_info AS (
    SELECT
        SUM(CASE item_type WHEN 'prime_eligible' THEN square_footage) AS sum_prime_footage
      , SUM(CASE item_type WHEN 'not_prime' THEN square_footage) AS sum_not_prime_footage
    FROM
        inventory
)
, max_prime_info AS (
    SELECT
        500000 / sum_prime_footage AS max_prime_value
    FROM
        footage_info
)
