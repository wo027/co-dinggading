WITH salary_rank_info AS (
    SELECT
        name
      , salary
      , departmentId
      , DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) AS salary_rank
    FROM
        Employee
)

SELECT
    Department.name AS Department
  , salary_rank_info.name AS Employee
  , salary_rank_info.salary AS Salary
FROM
    Department
    INNER JOIN salary_rank_info
        ON Department.id = salary_rank_info.departmentId
WHERE
    salary_rank <= 3
;