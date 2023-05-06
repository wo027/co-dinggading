SELECT s.user_id, 
ROUND(IFNULL((COUNT(CASE WHEN action = 'confirmed' THEN c.time_stamp END) / COUNT(c.user_id)), 0),2confirmation_rate 
FROM Signups s
LEFT JOIN Confirmations c
ON s.user_id = c.user_id
GROUP BY s.user_id
