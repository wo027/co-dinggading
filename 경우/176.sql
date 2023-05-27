SELECT MAX(salary) SecondHighestSalary 
FROM employee
WHERE salary <> (SELECT max(salary) FROM employee)
 