SELECT 
    employee_id
    , department_id
FROM Employee
GROUP BY employee_id
HAVING COUNT(primary_flag) = 1

UNION DISTINCT

SELECT 
    employee_id
    , department_id
FROM Employee
WHERE primary_flag = 'Y'
GROUP BY employee_id
;
