SELECT
    MAX(salary) AS SecondHighestSalary
FROM (
        SELECT *
        , DENSE_RANK() OVER(ORDER BY salary DESC) AS rank_salary
        FROM
            Employee
    ) AS calc_rank
WHERE rank_salary = 2
;