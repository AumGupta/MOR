/*
Question:
Create a database 'university' having two tables: 'students' and 'teachers'.
Students table should have columns: roll_no (primary key), aadhaar_no (not null, unique),
cgpa_10 and cgpa_12 (check condition between 0 and 10), course_id, teacher_id (foreign key), admission_status.
If admission_status is 'yes', CGPA values must be provided; otherwise, they should be NULL.
Maximum CGPA should have a default value of 10.
Teachers table should have columns: teacher_id (primary key), course_id, teacher_name.
Insert 10 entries into both tables.
*/

-- Create Database
CREATE DATABASE university

-- Use the Database
USE university

-- Create Teachers Table
CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY,
    course_id VARCHAR(10) UNIQUE,
    teacher_name VARCHAR(50)
)

-- Create Students Table
CREATE TABLE students (
    roll_no INT PRIMARY KEY,
    name VARCHAR(50),
    aadhaar_no CHAR(12) NOT NULL UNIQUE,
    cgpa_10 FLOAT,
    cgpa_12 FLOAT,
    course_id VARCHAR(10),
    teacher_id INT,
    admission_status VARCHAR(3) CHECK (admission_status IN ('yes', 'no')),
    max_cgpa FLOAT DEFAULT 10,
    CONSTRAINT chk_cgpa_10_range CHECK (cgpa_10 BETWEEN 0 AND 10),
    CONSTRAINT chk_cgpa_12_range CHECK (cgpa_12 BETWEEN 0 AND 10),
    FOREIGN KEY (course_id) REFERENCES teachers(course_id),
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id),
    CHECK ((admission_status = 'yes' AND cgpa_10 IS NOT NULL AND cgpa_12 IS NOT NULL) OR
           (admission_status = 'no' AND cgpa_10 IS NULL AND cgpa_12 IS NULL))
);

-- Insert Data into Teachers Table
INSERT INTO teachers VALUES
(1, 'CS101', 'Rajesh Sharma'),
(2, 'ME102', 'Anil Kumar'),
(3, 'EC103', 'Priya Mehta'),
(4, 'BT104', 'Amitabh Joshi'),
(5, 'CE105', 'Neha Reddy'),
(6, 'IT106', 'Arun Mishra'),
(7, 'EE107', 'Pooja Patel'),
(8, 'CH108', 'Ravi Verma'),
(9, 'MA109', 'Sanjay Gupta'),
(10, 'PH110', 'Kavita Iyer');

-- Insert Data into Students Table
INSERT INTO students VALUES
(101, 'Aarav Kapoor', '123456789012', 9.2, 8.8, 'CS101', 1, 'yes', 10),
(102, 'Ishaan Malhotra', '223456789012', 8.1, 7.9, 'ME102', 2, 'yes', 10),
(103, 'Riya Sharma', '323456789012', NULL, NULL, 'EC103', 3, 'no', 10),
(104, 'Ananya Gupta', '423456789012', 7.5, 8.1, 'BT104', 4, 'yes', 10),
(105, 'Kabir Khanna', '523456789012', NULL, NULL, 'CE105', 5, 'no', 10),
(106, 'Devansh Nair', '623456789012', 9.0, 9.3, 'IT106', 6, 'yes', 10),
(107, 'Aryan Sinha', '723456789012', NULL, NULL, 'EE107', 7, 'no', 10),
(108, 'Tara Menon', '823456789012', 7.8, 8.0, 'CH108', 8, 'yes', 10),
(109, 'Neel Patel', '923456789012', NULL, NULL, 'MA109', 9, 'no', 10),
(110, 'Sanya Kapoor', '103456789012', 8.7, 9.1, 'PH110', 10, 'yes', 10);

-- View Data
SELECT * FROM teachers
SELECT * FROM students
