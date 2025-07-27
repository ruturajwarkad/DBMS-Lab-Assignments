-- Assignment 2 - MySQL Database Operations

-- 1. Create the StudentManagement database
CREATE DATABASE StudentManagement;

-- 2. Create the Students table under StudentManagement database
USE StudentManagement;

CREATE TABLE Students (
    PRN INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    MiddleName VARCHAR(50),
    Year INT NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Age INT NOT NULL,
    Department VARCHAR(100) NOT NULL
);

-- 3. Insert records into the Students table
INSERT INTO Students (PRN, FirstName, LastName, MiddleName, Year, Email, Age, Department)
VALUES
(101, 'John', 'Doe', 'A.', 2, 'john.doe@example.com', 20, 'Computer Science'),
(102, 'Jane', 'Smith', 'B.', 1, 'jane.smith@example.com', 19, 'Electronics'),
(103, 'Alice', 'Johnson', NULL, 3, 'alice.johnson@example.com', 21, 'Mechanical'),
(104, 'Brod', 'Stud', 'B', 2, 'brod.a@example.com', 20, 'Electronics'),
(105, 'Ruturaj', 'Warkad', 'S.', 2, 'ruturaj.warkad@example.com', 20, 'Computer Science'),
(106, 'Yash', 'Mahajan', 'G.', 2, 'yash.mahajan@example.com', 20, 'Computer Science');

-- 4. Retrieve all records from the Students table
SELECT * FROM Students;

-- 5. Update the Year of the student with PRN 102 to 2
UPDATE Students
SET Year = 2
WHERE PRN = 102;

-- 6. Delete the record of the student whose PRN is 103
DELETE FROM Students
WHERE PRN = 103;

-- 7. Delete the Students table from the StudentManagement database
DROP TABLE Students;

-- 8. Alter the Students table: Add PhoneNumber column
ALTER TABLE Students
ADD PhoneNumber VARCHAR(15);

-- 9. Retrieve all distinct departments
SELECT DISTINCT Department FROM Students;

-- 10. Find number of distinct departments
SELECT COUNT(DISTINCT Department) AS DistinctDepartments FROM Students;

-- 11. Retrieve the distinct years of students
SELECT DISTINCT Year FROM Students;

-- 12. Distinct ages of students in "Computer Science" department
SELECT DISTINCT Age FROM Students
WHERE Department = 'Computer Science';

-- 13. Distinct first names of students with age less than 21
SELECT DISTINCT FirstName FROM Students
WHERE Age < 21;

-- 14. Full details of students older than 20
SELECT * FROM Students
WHERE Age > 20;

-- 15. All students enrolled in their third year
SELECT * FROM Students
WHERE Year = 3;

-- 16. First and last names with department for students with PRN > 101
SELECT FirstName, LastName, Department FROM Students
WHERE PRN > 101;

-- 17. First names and emails of students in "Electronics"
SELECT FirstName, Email FROM Students
WHERE Department = 'Electronics';

-- 18. Students in "Computer Science" older than 19
SELECT * FROM Students
WHERE Department = 'Computer Science' AND Age > 19;

-- 19. Remove all records from Students table (keep structure)
TRUNCATE TABLE Students;

-- 20. Drop the Students table
DROP TABLE Students;
