USE university

-- 1. Subquery: List students whose CGPA_10 is above the average
SELECT name, cgpa_10
FROM students
WHERE cgpa_10 > (SELECT AVG(cgpa_10) FROM students WHERE cgpa_10 IS NOT NULL);

-- 2. Subquery: Find names of teachers who teach a student named 'Aarav Kapoor'
SELECT teacher_name
FROM teachers
WHERE teacher_id IN (
    SELECT teacher_id FROM students WHERE name = 'Aarav Kapoor'
);

-- 3. Subquery: Get the list of students whose course is being taught by teachers with ID less than 5
SELECT name, course_id
FROM students
WHERE course_id IN (
    SELECT course_id FROM teachers WHERE teacher_id < 5
);

-- 4. Correlated Subquery: Find students whose CGPA_10 is the highest among students enrolled in the same course
SELECT name, course_id, cgpa_10
FROM students s1
WHERE cgpa_10 = (
    SELECT MAX(cgpa_10) FROM students s2 WHERE s1.course_id = s2.course_id
);

-- 5. Subquery: List names of students who are taught by 'Rajesh Sharma'
SELECT name
FROM students
WHERE teacher_id = (
    SELECT teacher_id FROM teachers WHERE teacher_name = 'Rajesh Sharma'
);

-- 6. Correlated Subquery: Find students with the highest CGPA_10 under each teacher
SELECT name, cgpa_10, teacher_id
FROM students s1
WHERE cgpa_10 = (
    SELECT MAX(cgpa_10)
    FROM students s2
    WHERE s1.teacher_id = s2.teacher_id
);

-- 7. Subquery in SELECT clause: Show each student's CGPA and the average CGPA_10 of all students
SELECT name, cgpa_10,
       (SELECT AVG(cgpa_10) FROM students WHERE cgpa_10 IS NOT NULL) AS avg_cgpa
FROM students;

-- 8. Subquery: Find students who are in a course taught by a teacher whose name starts with 'P'
SELECT name
FROM students
WHERE course_id IN (
    SELECT course_id FROM teachers WHERE teacher_name LIKE 'P%'
);

-- 9. Correlated Subquery: Find students whose CGPA_12 is higher than the CGPA_12 of any student in a different course.
SELECT name, cgpa_12, course_id
FROM students s1
WHERE cgpa_12 > (
    SELECT MAX(cgpa_12)
    FROM students s2
    WHERE s1.course_id != s2.course_id AND s2.cgpa_12 IS NOT NULL
);



-- 10. Subquery: List all teachers who teach at least one student with CGPA_10 above 9
SELECT DISTINCT teacher_name
FROM teachers
WHERE teacher_id IN (
    SELECT teacher_id FROM students WHERE cgpa_10 > 9
);
