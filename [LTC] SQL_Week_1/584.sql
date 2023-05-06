SELECT name
FROM Customer
WHERE isnull(referee_id) or referee_id <> 2
