-- prime 최대  이후 not_prime
with info as (
  SELECT item_type
        , SUM(square_footage)  as amt
        , COUNT(item_category) as cnt
  FROM inventory
  GROUP BY item_type
) , max_prime as (
SELECT item_type
      , amt
      , cnt 
      , (500000 / amt)   max_amt
      , (500000 / amt)  *  cnt max_cnt
FROM info
WHERE item_type = 'prime_eligible'
)


SELECT item_type
        , (500000 - (select max_amt * amt FROM max_prime )) * cnt
FROM info
WHERE item_type = 'not_prime'
UNION 
SELECT item_type   
        , max_cnt 
FROM max_prime
 