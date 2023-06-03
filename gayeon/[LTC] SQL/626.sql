WITH swap_seat AS (
    SELECT
        IF(id % 2 = 0, id - 1, id + 1) AS calc_id
      , id
      , student
    FROM
        Seat
)

SELECT 
    IF(Seat.id IS NULL, swap_seat.id, calc_id) AS id
  , swap_seat.student
FROM swap_seat
    LEFT JOIN Seat ON swap_seat.calc_id = Seat.id
ORDER BY 1
;