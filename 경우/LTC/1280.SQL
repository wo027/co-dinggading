
SELECT a.student_id,st.student_name ,a.subject_name,IFNULL(gr.attended_exams,0) attended_exams
FROM (
SELECT cr.student_id , subject_name
FROM Subjects
CROSS JOIN (
	SELECT DISTINCT student_id FROM Students ) cr
) a
LEFT JOIN (
	SELECT student_id,subject_name , count(student_id) attended_exams
	FROM Examinations
	GROUP BY student_id,subject_name
) gr
ON a.student_id = gr.student_id
AND a.subject_name = gr.subject_name
LEFT JOIN Students st
ON a.student_id =st.student_id
ORDER BY 1,3
