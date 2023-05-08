
SELECT user_id , ROUND(sum(num) / count(user_id), 2) confirmation_rate
FROM (
  SELECT s.user_id ,
  case
  WHEN action = 'confirmed ' then 1
  else 0 end as num
  FROM Signups s
  LEFT JOIN Confirmations c
  ON s.user_Id = c.user_id ) a
GROUP BY user_id
