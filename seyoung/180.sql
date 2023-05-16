SELECT 
    DISTINCT L1.num AS ConsecutiveNums
FROM Logs AS L1
    JOIN Logs AS L2 
    ON L1.id = L2.id - 1 AND L1.num = L2.num
    JOIN LOgs AS L3
    ON L2.id -1 = L3.id -2 AND L2.num = L3.num
;
