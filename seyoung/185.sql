WITH Rank_salary AS(
    SELECT 
        *
        , DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY Salary desc) AS rank_S
    FROM 
        Employee
)

SELECT 
    Department.name
    , Rank_salary.name
    , Rank_salary.Salary
FROM Department
    INNER JOIN Rank_salary
    ON Department.id = Rank_salary.departmentId
WHERE rank_S <= 3
;

--오류남 좀더 고민해봐야
