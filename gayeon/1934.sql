SELECT
    Signups.user_id
  , ROUND(COALESCE((COUNT(CASE WHEN action = 'confirmed' THEN Confirmations.time_stamp END) / COUNT(Confirmations.user_id)), 0), 2) AS confirmation_rate
FROM Signups
    LEFT JOIN Confirmations ON Signups.user_id = Confirmations.user_id
GROUP BY 1
;