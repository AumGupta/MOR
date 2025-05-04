-- 1. INNER JOIN: Get student name, course ID, and corresponding teacher name
SELECT s.name, s.course_id, t.teacher_name
FROM students s
INNER JOIN teachers t ON s.teacher_id = t.teacher_id;

-- 2. LEFT JOIN: List all students and their teacher names (if any)
SELECT s.name, t.teacher_name
FROM students s
LEFT JOIN teachers t ON s.teacher_id = t.teacher_id;

-- 3. RIGHT JOIN: List all teachers and their assigned students (if any)
SELECT t.teacher_name, s.name AS student_name
FROM students s
RIGHT JOIN teachers t ON s.teacher_id = t.teacher_id;

-- 4. FULL OUTER JOIN: List all students and teachers, even if not matched
SELECT s.name AS student_name, t.teacher_name
FROM students s
FULL OUTER JOIN teachers t ON s.teacher_id = t.teacher_id;

-- 5. CROSS JOIN: All possible student-teacher pairs
SELECT s.name AS student_name, t.teacher_name
FROM students s
CROSS JOIN teachers t;

-- 6. INNER JOIN using course_id instead of teacher_id
SELECT s.name, s.course_id, t.teacher_name
FROM students s
INNER JOIN teachers t ON s.course_id = t.course_id;

-- 7. LEFT JOIN with CASE: Show 'Unassigned' if teacher is NULL
SELECT s.name, 
       CASE 
           WHEN t.teacher_name IS NULL THEN 'Unassigned'
           ELSE t.teacher_name 
       END AS teacher_assigned
FROM students s
LEFT JOIN teachers t ON s.teacher_id = t.teacher_id;

-- 8. INNER JOIN to get teachers who have at least one student
SELECT DISTINCT t.teacher_name
FROM teachers t
JOIN students s ON s.teacher_id = t.teacher_id;

-- 9. LEFT JOIN: Count how many students are assigned to each teacher
SELECT t.teacher_name, COUNT(s.roll_no) AS student_count
FROM teachers t
LEFT JOIN students s ON t.teacher_id = s.teacher_id
GROUP BY t.teacher_name;

-- 10. INNER JOIN with WHERE condition
SELECT s.name, t.teacher_name
FROM students s
INNER JOIN teachers t ON s.teacher_id = t.teacher_id
WHERE s.admission_status = 'yes';

-- 11. LEFT JOIN to find all students' courses and who is teaching
SELECT s.name, s.course_id, t.teacher_name
FROM students s
LEFT JOIN teachers t ON s.course_id = t.course_id;

-- 12. RIGHT JOIN with additional columns
SELECT t.teacher_name, t.course_id, s.name AS student_name
FROM students s
RIGHT JOIN teachers t ON s.teacher_id = t.teacher_id;

-- 13. FULL JOIN with max_cgpa
SELECT s.name, t.teacher_name, s.max_cgpa
FROM students s
FULL OUTER JOIN teachers t ON s.teacher_id = t.teacher_id;

-- 14. JOIN with alias and ORDER BY
SELECT s.name AS Student, t.teacher_name AS Teacher
FROM students s
JOIN teachers t ON s.teacher_id = t.teacher_id
ORDER BY s.name;

-- 15. CROSS JOIN with condition (avoid full cartesian output)
SELECT s.name AS Student, t.teacher_name AS Teacher
FROM students s
CROSS JOIN teachers t
WHERE s.roll_no % 2 = t.teacher_id % 2;
