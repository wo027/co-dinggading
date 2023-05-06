
select name, bonus
from employee e
left join bonus b
on e.empId = b.empId
where IFNULL(b.bonus, 0) < 1000
