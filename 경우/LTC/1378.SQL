
SELECT en.unique_id ,e.name FROM Employees e
LEFT JOIN EmployeeUNI en
ON e.id = en.id
