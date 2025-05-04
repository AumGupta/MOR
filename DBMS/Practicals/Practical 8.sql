USE university
select * from students
select * from teachers
-- 1. Get course_ids present in both teachers and students (INTERSECT)
SELECT course_id FROM students
INTERSECT
SELECT course_id FROM teachers;

-- 2. Get course_ids that are in students but not in teachers (EXCEPT)
SELECT course_id FROM students
EXCEPT
SELECT course_id FROM teachers;

-- 3. Get course_ids that are in teachers but not in students (EXCEPT)
SELECT course_id FROM teachers
EXCEPT
SELECT course_id FROM students;

-- 4. List all course_ids from both tables (UNION)
SELECT course_id FROM students
UNION
SELECT course_id FROM teachers;

-- 5. List all course_ids from both tables (duplicates allowed - UNION ALL)
SELECT course_id FROM students
UNION ALL
SELECT course_id FROM teachers;

-- 6. List all teacher_ids who also appear in students table (INTERSECT)
SELECT teacher_id FROM teachers
INTERSECT
SELECT teacher_id FROM students;

-- 7. List names of students and teacher_names together (UNION ALL)
SELECT name AS person FROM students
UNION ALL
SELECT teacher_name FROM teachers;

-- 8. Roll numbers of students with cgpa_10 and cgpa_12 not null (INTERSECT of two filtered sets)
SELECT roll_no FROM students WHERE cgpa_10 IS NOT NULL
INTERSECT
SELECT roll_no FROM students WHERE cgpa_12 IS NOT NULL;

-- 9. Students who are admitted (yes) but have no CGPA_10 set (set difference)
SELECT roll_no FROM students WHERE admission_status = 'yes'
EXCEPT
SELECT roll_no FROM students WHERE cgpa_10 IS NOT NULL;

-- 10. Combine teacher and student IDs into one column (UNION)
SELECT teacher_id AS id FROM teachers
UNION
SELECT teacher_id FROM students;
