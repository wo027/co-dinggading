SELECT w1.id
FROM Weather as w1, Weather as w2
WHERE w1.temperature > w2.temperature and datediff(w1.recordDate,w2.recordDate) = 1
