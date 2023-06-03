WITH less_salary AS (
    SELECT
        employee_id
      , manager_id
    FROM
        Employees
    WHERE salary < 30000
      AND manager_id IS NOT NULL
)

SELECT
    less_salary.employee_id
FROM
    less_salary
    LEFT JOIN Employees 
        ON less_salary.manager_id = Employees.employee_id
WHERE Employees.employee_id IS NULL
ORDER BY 1
;