SELECT  *  
    ,CASE WHEN x+z > y AND x+y >z AND y+z > x THEN 'Yes'
     ELSE 'No' 
     END triangle
FROM Triangle
