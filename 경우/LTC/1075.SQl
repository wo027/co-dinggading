
SELECT p.project_id , ROUND(avg(experience_years),2) average_years
FROM Project p
LEFT JOIN Employee e
ON p.employee_id = e.employee_id
GROUP BY 1
