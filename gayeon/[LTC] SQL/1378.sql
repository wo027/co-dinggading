SELECT
    uni.unique_id
  , Employees.name
FROM Employees
LEFT JOIN EmployeeUNI AS uni ON Employees.id = uni.id
;