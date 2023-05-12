WITH a  as (
  SELECT employee_id
FROM Employee
GROUP BY employee_id
HAVING count(department_id)  =1
)

SELECT employee_id,department_id
FROM Employee
WHERE primary_flag = 'Y'
OR employee_id in (SELECT employee_id FROM a )
