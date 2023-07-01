SELECT name
FROM Customer
WHERE referee_id != 2 or ISNULL(referee_id) =True
