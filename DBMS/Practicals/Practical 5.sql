/*
Step: Perform at least 15 queries using OFFSET & FETCH, pattern matching (LIKE), and LIMIT-equivalent (TOP).
Database: university
*/

USE university;

-- 1. Get first 5 students (LIMIT equivalent in SQL Server)
SELECT TOP 5 * FROM students;

-- 2. Get next 5 students after skipping first 5 (OFFSET + FETCH)
SELECT * FROM students
ORDER BY roll_no
OFFSET 5 ROWS
FETCH NEXT 5 ROWS ONLY;

-- 3. Get students where name starts with 'A' (pattern matching)
SELECT * FROM students WHERE name LIKE 'A%';

-- 4. Get students where name ends with 'a'
SELECT * FROM students WHERE name LIKE '%a';

-- 5. Get students whose name contains 'an'
SELECT * FROM students WHERE name LIKE '%an%';

-- 6. Get students whose name has second letter 'a'
SELECT * FROM students WHERE name LIKE '_a%';

-- 7. Get teachers where teacher_name starts with 'P'
SELECT * FROM teachers WHERE teacher_name LIKE 'P%';

-- 8. Get teachers whose name ends with 'a'
SELECT * FROM teachers WHERE teacher_name LIKE '%a';

-- 9. Get students with non-null CGPA_10 and order them with OFFSET-FETCH
SELECT * FROM students
WHERE cgpa_10 IS NOT NULL
ORDER BY cgpa_10 DESC
OFFSET 2 ROWS
FETCH NEXT 3 ROWS ONLY;

-- 10. Get students with names containing 'ar'
SELECT * FROM students WHERE name LIKE '%ar%';

-- 11. Use OFFSET to skip top 3 scorers and fetch next 2
SELECT * FROM students
WHERE cgpa_10 IS NOT NULL
ORDER BY cgpa_10 DESC
OFFSET 3 ROWS
FETCH NEXT 2 ROWS ONLY;

-- 12. Get top 1 student with highest cgpa_12
SELECT TOP 1 * FROM students
WHERE cgpa_12 IS NOT NULL
ORDER BY cgpa_12 DESC;

-- 13. Get names of students whose Aadhaar contains '56'
SELECT name, aadhaar_no FROM students WHERE aadhaar_no LIKE '%56%';

-- 14. Get teachers with course_id ending in '1'
SELECT * FROM teachers WHERE course_id LIKE '%1';

-- 15. Get 3 students after skipping first 2 alphabetically
SELECT * FROM students
ORDER BY name ASC
OFFSET 2 ROWS
FETCH NEXT 3 ROWS ONLY;
