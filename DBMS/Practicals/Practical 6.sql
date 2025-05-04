USE university

-- 1. Total students per teacher
SELECT teacher_id, COUNT(*) AS total_students
FROM students
GROUP BY teacher_id
ORDER BY total_students DESC;

-- 2. Average CGPA_10 per teacher
SELECT teacher_id, AVG(cgpa_10) AS avg_cgpa_10
FROM students
WHERE cgpa_10 IS NOT NULL
GROUP BY teacher_id
ORDER BY avg_cgpa_10 DESC;

-- 3. Students per course
SELECT course_id, COUNT(*) AS total_students
FROM students
GROUP BY course_id
ORDER BY course_id;

-- 4. Number of students with admission_status = 'yes' per teacher
SELECT teacher_id, COUNT(*) AS admitted_students
FROM students
WHERE admission_status = 'yes'
GROUP BY teacher_id
ORDER BY teacher_id;

-- 5. Maximum CGPA_12 per teacher
SELECT teacher_id, MAX(cgpa_12) AS max_cgpa_12
FROM students
WHERE cgpa_12 IS NOT NULL
GROUP BY teacher_id;

-- 6. All courses with number of students
SELECT course_id, COUNT(*) AS total_students
FROM students
GROUP BY course_id;

-- 7. Number of students having CGPA_10 >= 8 grouped by course
SELECT course_id, COUNT(*) AS high_cgpa_students
FROM students
WHERE cgpa_10 >= 8
GROUP BY course_id;

-- 8. Group by admission_status and show average CGPA_12
SELECT admission_status, AVG(cgpa_12) AS avg_cgpa_12
FROM students
WHERE cgpa_12 IS NOT NULL
GROUP BY admission_status;

-- 9. Total students grouped by Aadhaar number pattern (first digit)
SELECT LEFT(aadhaar_no, 1) AS aadhaar_prefix, COUNT(*) AS count
FROM students
GROUP BY LEFT(aadhaar_no, 1)
ORDER BY aadhaar_prefix;

-- 10. Student count per teacher
SELECT teacher_id, COUNT(*) AS students
FROM students
GROUP BY teacher_id;

-- 11. Group students by max_cgpa and show count
SELECT max_cgpa, COUNT(*) AS count
FROM students
GROUP BY max_cgpa;

-- 12. Students with CGPA_12 above 8 per teacher
SELECT teacher_id, COUNT(*) AS top_students
FROM students
WHERE cgpa_12 > 8
GROUP BY teacher_id;

-- 13. Group by course_id and show minimum cgpa_10
SELECT course_id, MIN(cgpa_10) AS min_cgpa_10
FROM students
WHERE cgpa_10 IS NOT NULL
GROUP BY course_id;

-- 14. Group by course_id and admission_status together
SELECT course_id, admission_status, COUNT(*) AS count
FROM students
GROUP BY course_id, admission_status
ORDER BY course_id;

-- 15. Average CGPA_10 per teacher with students
SELECT teacher_id, AVG(cgpa_10) AS avg_cgpa
FROM students
WHERE cgpa_10 IS NOT NULL
GROUP BY teacher_id;
