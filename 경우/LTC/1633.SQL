
SELECT contest_id
      , round(count(user_id)  / (select count(distinct user_id) from users) * 100,2) percentage
FROM register 
GROUP BY contest_id
ORDER BY 2 desc, 1  asc