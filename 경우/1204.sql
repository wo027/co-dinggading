SELECT person_name 
FROM(
  SELECT * ,
        SUM(weight) OVER (ORDER BY turn ) as total_weight
  FROM Queue
) a
WHERE  total_weight <= 1000
ORDER BY turn desc limit 1