USE university

-- 1. List all distinct course IDs
SELECT DISTINCT course_id FROM students;

-- 2. Display student name and status label using CASE
SELECT name,
       CASE
           WHEN admission_status = 'yes' THEN 'Admitted'
           ELSE 'Not Admitted'
       END AS status
FROM students;

-- 3. List students with CGPA_10 >= 8, ordered by CGPA_10 descending
SELECT name, cgpa_10
FROM students
WHERE cgpa_10 >= 8
ORDER BY cgpa_10 DESC;

-- 4. Count of students per admission_status
SELECT admission_status, COUNT(*) AS count
FROM students
GROUP BY admission_status;

-- 5. Average CGPA_12 by admission_status, only where avg > 8
SELECT admission_status, AVG(cgpa_12) AS avg_12
FROM students
WHERE cgpa_12 IS NOT NULL
GROUP BY admission_status
HAVING AVG(cgpa_12) > 8;

-- 6. List of teachers with students admitted
SELECT DISTINCT t.teacher_name
FROM teachers t
JOIN students s ON t.teacher_id = s.teacher_id
WHERE s.admission_status = 'yes';

-- 7. Show first 5 students alphabetically
SELECT * FROM students
ORDER BY name
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

-- 8. Show students whose Aadhaar ends in '12'
SELECT * FROM students
WHERE aadhaar_no LIKE '%12';

-- 9. List of students with NULL in cgpa_10
SELECT name FROM students
WHERE cgpa_10 IS NULL;

-- 10. Count students per teacher, but only show those with more than 0
SELECT teacher_id, COUNT(*) AS student_count
FROM students
GROUP BY teacher_id
HAVING COUNT(*) > 0;

-- 11. Students whose names start with 'A'
SELECT * FROM students
WHERE name LIKE 'A%';

-- 12. Top 3 CGPA_12 holders
SELECT name, cgpa_12
FROM students
WHERE cgpa_12 IS NOT NULL
ORDER BY cgpa_12 DESC
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY;

-- 13. List courses and how many students have CGPA_10 >= 8
SELECT course_id, COUNT(*) AS high_achievers
FROM students
WHERE cgpa_10 >= 8
GROUP BY course_id;

-- 14. Count how many courses start with 'C'
SELECT COUNT(DISTINCT course_id) AS count
FROM students
WHERE course_id LIKE 'C%';

-- 15. Show teacher name and number of admitted students
SELECT t.teacher_name, COUNT(*) AS admitted
FROM teachers t
JOIN students s ON t.teacher_id = s.teacher_id
WHERE s.admission_status = 'yes'
GROUP BY t.teacher_name;

-- 16. List students ordered by CGPA_10 with NULLs last
SELECT name, cgpa_10
FROM students
ORDER BY
    CASE WHEN cgpa_10 IS NULL THEN 1 ELSE 0 END,
    cgpa_10 DESC;

-- 17. Students grouped by course and admission status
SELECT course_id, admission_status, COUNT(*) AS count
FROM students
GROUP BY course_id, admission_status
ORDER BY course_id;

-- 18. List student names with CGPA_10 > CGPA_12 (only if both are not null)
SELECT name, cgpa_10, cgpa_12
FROM students
WHERE cgpa_10 IS NOT NULL AND cgpa_12 IS NOT NULL AND cgpa_10 > cgpa_12;

-- 19. Show students with cgpa_10 greater than 7 and name ending with 'a'.
SELECT * FROM students
WHERE cgpa_10>7 AND name LIKE '%a';

-- 20. Show student names with roll_no between 103 and 108
SELECT name, roll_no
FROM students
WHERE roll_no BETWEEN 103 AND 108
ORDER BY roll_no;
