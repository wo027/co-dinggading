WITH Single_n AS (
SELECT 
    num 
FROM MyNumbers
GROUP BY num
HAVING COUNT(num) = 1  
ORDER BY num desc
)

SELECT 
    max(num) AS num
FROM Single_n
;
