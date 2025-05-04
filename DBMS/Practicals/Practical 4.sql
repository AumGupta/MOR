/*
Step: Import database and perform 15 queries using SELECT, *, DISTINCT, LITERAL SELECT, CASE END, FROM, WHERE, and ORDER BY.
Database: university
Assumption: The database and tables (students, teachers) are already created and populated.
*/

USE university;

-- 1. SELECT all columns from students table
SELECT * FROM students;

-- 2. SELECT specific columns: name and aadhaar number
SELECT name, aadhaar_no FROM students;

-- 3. SELECT DISTINCT course_id from students
SELECT DISTINCT course_id FROM students;

-- 4. LITERAL SELECT (no table)
SELECT 'Welcome to University DB' AS greeting;

-- 5. SELECT rows where admission_status is 'yes'
SELECT * FROM students WHERE admission_status = 'yes';

-- 6. SELECT rows ordered by cgpa_10 in descending order
SELECT * FROM students ORDER BY cgpa_10 DESC;

-- 7. SELECT with CASE to classify performance
SELECT name,
       cgpa_10,
       CASE 
         WHEN cgpa_10 >= 9 THEN 'Excellent'
         WHEN cgpa_10 >= 7 THEN 'Good'
         ELSE 'Average'
       END AS performance
FROM students;

-- 8. SELECT rows with teacher_id = 4 and order by name ascending
SELECT * FROM students WHERE teacher_id = 4 ORDER BY name ASC;

-- 9. SELECT specific columns with aliases
SELECT name AS student_name, cgpa_12 AS twelfth_cgpa FROM students;

-- 10. SELECT where cgpa_10 is between 70 and 90
SELECT * FROM students WHERE cgpa_12 BETWEEN 70 AND 90;

-- 11. SELECT students where cgpa_12 is NULL
SELECT * FROM students WHERE cgpa_12 IS NULL;

-- 12. SELECT students in CS101 or ME102 course
SELECT * FROM students WHERE course_id IN ('CS101', 'ME102');

-- 13. SELECT students with names starting with 'A'
SELECT * FROM students WHERE name LIKE 'A%';

-- 14. SELECT all data from teachers table
SELECT * FROM teachers;

-- 15. SELECT with CASE to determine eligibility based on admission_status
SELECT name,
       admission_status,
       CASE 
         WHEN admission_status = 'yes' THEN 'Eligible'
         ELSE 'Not Eligible'
       END AS eligibility
FROM students
ORDER BY name;