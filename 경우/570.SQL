
SELECT name
FROM Employee
WHERE id in (
SELECT id FROM(
SELECT e.id ,count(cr.managerId) as num
FROM Employee e
INNER JOIN (
SELECT managerId FROM Employee
) cr
ON e.id = cr.managerId
GROUP BY 1
HAVING num >= 5)a
)
