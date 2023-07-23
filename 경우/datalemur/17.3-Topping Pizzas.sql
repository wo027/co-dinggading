WITH p1 as (
SELECT topping_name
      , ingredient_cost
      , ROW_NUMBER() OVER(order by topping_name ASC ) idx
FROM pizza_toppings 
) 


SELECT CONCAT(p1.topping_name ,',' , p2.topping_name ,',' , p3.topping_name) pizza
      ,(p1.ingredient_cost + p2.ingredient_cost + p3.ingredient_cost)  total_cost
FROM p1 as p1
CROSS JOIN
  p1 as p2,
  p1 as p3
WHERE p1.idx < p2.idx 
AND p2.idx < p3.idx
ORDER BY total_cost DESC , 1 asc
  