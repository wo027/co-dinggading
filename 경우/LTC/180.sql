SELECT DISTINCT num ConsecutiveNums
FROM (
    SELECT *
        , LAG(num) OVER (ORDER BY id) AS num_2
        , LAG(num,2) OVER (ORDER BY id) AS num_3
    FROM Logs
) a
WHERE num = num_2 
AND num = num_3


-- RUN ok / Submit X
SELECT DISTINCT num ConsecutiveNums
FROM (
     SELECT  num
          , ROW_NUMBER() over(partition by num order by id) as row_num
     FROM Logs   
) a
WHERE row_num > 3
