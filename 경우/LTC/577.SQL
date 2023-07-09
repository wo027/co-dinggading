
select name, bonus
from employee e
left join bonus b
on e.empId = b.empId
where IFNULL(b.bonus, 0) < 1000


-- #2 
select name, bonus
from employee e
left join bonus b
on e.empid = b.empid
WHERE e.empid not in(
SELECT empid FROM bonus WHERE bonus > 1000
) 
-- >>  RUN은 accept , sumit 은 wrong >> 이유 아시나요ㅜㅜ 이런 경우가 많더라구요
