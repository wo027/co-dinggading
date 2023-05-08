SELECT st.student_id,
        st.student_name,
        sb.subject_name,
        COUNT(ex.subject_name) as attended_exams
FROM Students as st
CROSS JOIN Subjects sb
LEFT JOIN Examinations ex
ON st.student_id = ex.student_id and sb.subject_name = ex.subject_name
GROUP BY st.student_id, sb.subject_name
ORDER BY st.student_id, sb.subject_name
