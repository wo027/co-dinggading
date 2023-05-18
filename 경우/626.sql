SELECT  IFNULL(s2.id2 ,s1.id )              AS id 
       ,  IFNULL(s2.student ,s1.student )   AS student 
FROM  Seat s1 
    LEFT JOIN (
        SELECT 
            student 
            , CASE 
                    WHEN id % 2 = 1 THEN id+1   
                    WHEN id % 2 = 0 THEN id-1 
                END as id2
        FROM Seat
    ) s2
ON s1.id = s2.id2