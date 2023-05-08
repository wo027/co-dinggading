
SELECT v.customer_id customer_id,
count(*) count_no_trans
FROM Visits v
LEFT JOIN Transactions t
ON v.visit_id = t.visit_id
WHERE t.amount is null
GROUP BY v.customer_id
