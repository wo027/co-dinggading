SELECT DISTINCT
    Logs.num AS ConsecutiveNums
FROM
    Logs
    INNER JOIN Logs AS log_1
        ON Logs.id = log_1.id - 1
    INNER JOIN Logs AS log_2
        ON Logs.id = log_2.id - 2
WHERE 
      Logs.num = log_1.num 
  AND log_1.num = log_2.num
;