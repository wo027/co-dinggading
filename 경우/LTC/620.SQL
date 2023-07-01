
SELECT *
FROM Cinema
WHERE mod(id,2) = 1
AND description != 'boring'
ORDER BY 4 desc
