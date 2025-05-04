/*
Write commands to create use and drop database.

Create table for bookmyshow, without constraints having columns with numeric text and datetime datatypes. 
(bit, tinyint, smallint, int, big int), (char, varchar, text), (date yyyymmdd, time , datetime)
Insert atleast 20 entries in your table.
*/

-- Create Database
CREATE DATABASE OG

-- Use the Database
USE OG

-- Create Table for BookMyShow
CREATE TABLE bookmyshow (
    show_id CHAR(4),
    show_name VARCHAR(50),
    show_desc TEXT,
    show_date DATE,
    show_time TIME,
    is_full BIT,
    show_count TINYINT,
    price DECIMAL(15,2),
    capacity BIGINT
)

-- Insert Data into the Table
INSERT INTO bookmyshow VALUES
('1001', 'The Weeknd', 'After Hours Tour', '2025-07-15', '20:00:00', 0, 2, 150.00, 1800),
('1002', 'Imagine Dragons', 'Mercury Tour', '2025-08-10', '19:30:00', 0, 4, 175.00, 2200),
('1003', 'Ed Sheeran', 'Mathematics Tour', '2025-09-05', '18:00:00', 1, 6, 250.00, 2500),
('1004', 'Taylor Swift', 'Eras Tour', '2025-10-20', '20:00:00', 0, 7, 300.00, 3500),
('1005', 'Billie Eilish', 'Happier Than Ever', '2025-06-12', '19:00:00', 1, 5, 200.00, 2000),
('1006', 'Arijit Singh', 'Live in Concert', '2025-05-22', '20:30:00', 0, 3, 150.50, 2700),
('1007', 'Bruno Mars', '24K Magic', '2025-04-18', '21:00:00', 0, 4, 280.00, 3000),
('1008', 'Shawn Mendes', 'Wonder Tour', '2025-03-25', '18:45:00', 1, 3, 220.75, 2500),
('1009', 'Maroon 5', 'Red Pill Blues', '2025-11-14', '19:15:00', 0, 5, 210.00, 2900),
('1010', 'OneRepublic', 'Human Tour', '2025-08-20', '20:45:00', 0, 6, 185.00, 2600),
('1011', 'Post Malone', 'Twelve Carat Tour', '2025-09-30', '21:15:00', 1, 4, 270.50, 2400),
('1012', 'Dua Lipa', 'Future Nostalgia', '2025-12-10', '20:00:00', 0, 3, 230.00, 3000),
('1013', 'Adele', '30 Tour', '2025-11-25', '19:30:00', 0, 4, 350.00, 3100),
('1014', 'Katy Perry', 'Smile Tour', '2025-10-05', '20:15:00', 1, 5, 190.50, 2800),
('1015', 'Justin Bieber', 'Justice Tour', '2025-09-18', '18:30:00', 0, 6, 260.00, 3200),
('1016', 'Green Day', 'Hella Mega Tour', '2025-08-15', '19:00:00', 1, 3, 220.00, 2700),
('1017', 'Linkin Park', 'Hybrid Theory Live', '2025-07-21', '21:00:00', 0, 7, 275.00, 3300),
('1018', 'Red Hot Chili Peppers', 'Unlimited Love Tour', '2025-06-28', '20:30:00', 0, 4, 280.00, 3400),
('1020', 'Coldplay', NULL, '2025-12-01', '09:00:00', 0, 3, 200.50, 2500),
('1019', 'Xyz', NULL, '2026-12-31', '09:30:00', 1, 5, 210.15, 3000)

-- Retrieve Data from the Table
SELECT * FROM bookmyshow