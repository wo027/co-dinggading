SELECT employee_id 
FROM Employees
WHERE salary < 30000 
AND NOT ISNULL(manager_id)
AND manager_id NOT in (SELECT employee_id  FROM Employees)
ORDER BY 1
