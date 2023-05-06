  SELECT e1.name
  FROM Employee e1, Employee e2
  WHERE e1.id = e2.managerId 
  GROUP BY e2.managerId
  HAVING COUNT(e1.name) >= 5
