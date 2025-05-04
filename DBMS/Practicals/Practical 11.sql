-- Create a new database
CREATE DATABASE PartsDatabase;
GO

-- Use the database
USE PartsDatabase;
GO

-- Drop tables if they exist (for re-execution)
IF OBJECT_ID('Catalog', 'U') IS NOT NULL DROP TABLE Catalog;
IF OBJECT_ID('Parts', 'U') IS NOT NULL DROP TABLE Parts;
IF OBJECT_ID('Supplier', 'U') IS NOT NULL DROP TABLE Supplier;
IF OBJECT_ID('Student', 'U') IS NOT NULL DROP TABLE Student;
GO

-- Create Student table
CREATE TABLE Student (
    Sid INT PRIMARY KEY,
    Sname VARCHAR(50)
);

-- Create Supplier table
CREATE TABLE Supplier (
    Sid INT PRIMARY KEY,
    Sname VARCHAR(50),
    Address VARCHAR(100)
);

-- Create Parts table
CREATE TABLE Parts (
    Pid INT PRIMARY KEY,
    Pname VARCHAR(50),
    Color VARCHAR(30)
);

-- Create Catalog table
CREATE TABLE Catalog (
    Sid INT,
    Pid INT,
    Cost REAL,
    FOREIGN KEY (Sid) REFERENCES Supplier(Sid),
    FOREIGN KEY (Pid) REFERENCES Parts(Pid)
);

-- Insert values into Student
INSERT INTO Student VALUES
(1, 'Aarav'),
(2, 'Riya'),
(3, 'Ishaan'),
(4, 'Ananya'),
(5, 'Kabir'),
(6, 'Tara'),
(7, 'Dev'),
(8, 'Sanya'),
(9, 'Neel'),
(10, 'Kriti');

-- Insert values into Supplier
INSERT INTO Supplier VALUES
(201, 'AutoParts Ltd', 'Delhi'),
(202, 'GearTech', 'Mumbai'),
(203, 'RoboSupplies', 'Pune'),
(204, 'SteelWorks', 'Kolkata'),
(205, 'ToolChain', 'Chennai'),
(206, 'NanoParts', 'Bangalore'),
(207, 'MechMart', 'Ahmedabad'),
(208, 'QuickFix', 'Hyderabad'),
(209, 'BuildCore', 'Lucknow'),
(210, 'PartsDepot', 'Jaipur');

-- Insert values into Parts
INSERT INTO Parts VALUES
(301, 'Screw', 'Silver'),
(302, 'Bolt', 'Black'),
(303, 'Nut', 'Black'),
(304, 'Washer', 'Silver'),
(305, 'Gear', 'Gray'),
(306, 'Sensor', 'White'),
(307, 'Switch', 'Red'),
(308, 'Fan', 'White'),
(309, 'Motor', 'Black'),
(310, 'Rotor', 'Gray');

-- Insert values into Catalog
INSERT INTO Catalog VALUES
(201, 301, 5.5),
(202, 302, 4.0),
(203, 303, 3.0),
(204, 304, 6.0),
(205, 305, 10.0),
(206, 306, 25.0),
(207, 307, 15.0),
(208, 308, 20.0),
(209, 309, 18.0),
(210, 310, 12.5);

-- -----------------------------
-- Perform 5 Sample Queries
-- -----------------------------

-- 1. List all parts that are black in color
SELECT * FROM Parts
WHERE Color = 'Black';

-- 2. List supplier names along with the parts they supply
SELECT S.Sname AS SupplierName, P.Pname AS PartName, C.Cost
FROM Supplier S
JOIN Catalog C ON S.Sid = C.Sid
JOIN Parts P ON P.Pid = C.Pid;

-- 3. Display all student names that start with 'A'
SELECT * FROM Student
WHERE Sname LIKE 'A%';

-- 4. Show parts with cost greater than 10
SELECT P.Pname, C.Cost
FROM Catalog C
JOIN Parts P ON P.Pid = C.Pid
WHERE C.Cost > 10;

-- 5. Count how many parts are supplied by each supplier
SELECT S.Sname, COUNT(C.Pid) AS PartCount
FROM Supplier S
JOIN Catalog C ON S.Sid = C.Sid
GROUP BY S.Sname
ORDER BY PartCount DESC;
