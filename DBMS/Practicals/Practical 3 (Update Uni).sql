-- PRACTICAL 3
-- Update DDL structures: Alter, Set, Update ,etc

USE university
SELECT * FROM students

-- Add a new column to students table
ALTER TABLE students ADD email VARCHAR(50);
ALTER TABLE students ADD phone_number CHAR(10);
ALTER TABLE students ADD address VARCHAR(100);
SELECT * FROM students

-- Modify the datatype of teacher_name in teachers table
ALTER TABLE teachers ALTER COLUMN teacher_name VARCHAR(100)
SELECT * FROM students

-- Update admission_status to 'yes' for student with roll_no 105
UPDATE students SET admission_status = 'yes', cgpa_10 = 7.0, cgpa_12 = 7.5 WHERE roll_no = 105;
UPDATE students SET admission_status = 'no', cgpa_10 = NULL, cgpa_12 = NULL WHERE roll_no = 107;
UPDATE students SET admission_status = 'yes', cgpa_10 = 8.2, cgpa_12 = 8.5 WHERE roll_no = 103;
SELECT * FROM students

-- Modifying check condition on cgpa
ALTER TABLE students DROP CONSTRAINT chk_cgpa_10_range;
ALTER TABLE students ADD CONSTRAINT chk_cgpa_10_range CHECK (cgpa_10 BETWEEN 0 AND 100);
ALTER TABLE students DROP CONSTRAINT chk_cgpa_12_range;
ALTER TABLE students ADD CONSTRAINT chk_cgpa_12_range CHECK (cgpa_12 BETWEEN 0 AND 100);

-- Set max_cgpa, cgpas out of 100
UPDATE students SET max_cgpa = 100;
UPDATE students SET cgpa_10 = cgpa_10*10;
UPDATE students SET cgpa_12 = cgpa_12*10;
SELECT * FROM students

-- Rename column 'student_name' to 'name' in students table
EXEC sp_rename 'students.student_name', 'name', 'COLUMN';
EXEC sp_rename 'teachers.teacher_name', 'name', 'COLUMN';
SELECT * FROM students
