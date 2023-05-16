SELECT teacher_id 
				, count(distinct subject_id) cnt 
FROM Teacher 
GROUP BY teacher_id