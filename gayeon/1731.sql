SELECT
    employee_info.employee_id
  , employee_info.name
  , COUNT(reports_info.employee_id) AS reports_count
  , ROUND(AVG(reports_info.age))    AS average_age
FROM Employees AS employee_info
    INNER JOIN Employees AS reports_info
        ON employee_info.employee_id = reports_info.reports_to
GROUP BY 1, 2
ORDER BY 1
;