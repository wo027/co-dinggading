SELECT Department 
        , Employee
        , Salary
FROM (
    SELECT d.name         AS Department
            , e.name      AS Employee
            , e.Salary 
            , dense_rank() over(partition by d.name order by e.Salary DESC)  AS num
    FROM Department d
        INNER JOIN Employee  e
        ON d.id = e.departmentId
) A
WHERE num <=3