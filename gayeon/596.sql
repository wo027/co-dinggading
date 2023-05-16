SELECT
    class
FROM (
    SELECT
        class
      , COUNT(student) AS cnt_students
    FROM 
        Courses
    GROUP BY 1
    ) AS calc_students
WHERE cnt_students >= 5
;

-- SELECT
--     class
-- FROM
--     Courses
-- GROUP BY 1
-- HAVING COUNT(student) >= 5
-- ;

-- WITH calc_students AS (
--     SELECT
--         class
--       , COUNT(student) AS cnt_students
--     FROM 
--         Courses
--     GROUP BY 1
-- )

-- SELECT
--     class
-- FROM
--     calc_students
-- WHERE cnt_students >= 5
-- ;