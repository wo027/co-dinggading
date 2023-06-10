SELECT
    MAX(num) AS num
FROM
    MyNumbers
WHERE num IN (
    SELECT
        num
    FROM
        MyNumbers
    GROUP BY 1
    HAVING COUNT(*) = 1
)
;