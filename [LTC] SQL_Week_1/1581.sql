SELECT v.customer_id,
      COUNT(v.visit_id) as count_no_trans
FROM Visits as v
LEFT JOIN Transactions as t
ON v.visit_id = t.visit_id
WHERE ISNULL(t.visit_id)
GROUP BY v.customer_id
