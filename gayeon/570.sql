WITH cnt_direct_reports AS (
    SELECT managerId, COUNT(*) AS cnt_managerID
    FROM Employee
    GROUP BY 1
    HAVING cnt_managerID >= 5
)

SELECT name
FROM Employee
    INNER JOIN cnt_direct_reports ON Employee.id = cnt_direct_reports.managerId
;