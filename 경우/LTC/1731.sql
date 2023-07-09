SELECT  e1.employee_id
        , e1.name 
        , count(e2.reports_to) reports_count
        , ROUND(avg(e2.age),0) average_age
FROM Employees e1, Employees e2
WHERE e1.employee_id = e2.reports_to
GROUP BY employee_id
ORDER BY employee_id
