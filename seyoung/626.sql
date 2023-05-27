WITH change_seat AS (
SELECT 
    id - 2 AS id 
    , student
FROM Seat
WHERE id MOD 2 = 0

UNION

SELECT 
    id 
    , student
FROM Seat
WHERE id MOD 2 = 1
)

SELECT 
    ROW_NUMBER() OVER(ORDER BY id) as id
    ,student
FROM change_seat
;
