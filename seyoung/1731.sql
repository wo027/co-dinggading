SELECT
    e1.employee_id
    , e1.name
    , count(e2.name) AS reports_count
    , round(avg(e2.age)) AS average_age
FROM Employees as e1
    JOIN Employees as e2 
    ON e1.employee_id = e2.reports_to
GROUP BY e1.employee_id
ORDER BY e1.employee_id
;
