-- 1. Create and use database
CREATE DATABASE StudentManagement;
USE StudentManagement;

-- 2. Create Tables
CREATE TABLE 3_courses_287 (
    CourseID INT PRIMARY KEY NOT NULL,
    CourseName VARCHAR(100) NOT NULL UNIQUE,
    Credits INT DEFAULT 3
);

CREATE TABLE 3_students_287 (
    StudentID INT PRIMARY KEY NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    DOB DATE NOT NULL,
    CourseID INT,
    FOREIGN KEY (CourseID) REFERENCES 3_courses_287(CourseID)
);

-- 3. Insert Records
INSERT INTO 3_courses_287 (CourseID, CourseName, Credits) VALUES 
(1, 'Computer Science', 3),
(2, 'Mathematics', 4),
(3, 'Physics', 3);

INSERT INTO 3_students_287 (StudentID, FirstName, LastName, Email, DOB, CourseID) VALUES 
(1, 'John', 'Doe', 'john.doe@example.com', '2001-05-15', 1),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '1999-09-10', 2),
(3, 'Emily', 'Johnson', 'emily.johnson@example.com', '2003-02-25', 3);

-- 4. Constraint Violation Tests
-- Test 1: NULL in NOT NULL column
INSERT INTO 3_students_287 (StudentID, FirstName, LastName, Email, DOB, CourseID)
VALUES (4, NULL, 'Williams', 'william@example.com', '2002-03-22', 1);

-- Test 2: Duplicate email
INSERT INTO 3_students_287 (StudentID, FirstName, LastName, Email, DOB, CourseID)
VALUES (5, 'Michael', 'Brown', 'john.doe@example.com', '1995-11-05', 2);

-- Test 3: Invalid foreign key
INSERT INTO 3_students_287 (StudentID, FirstName, LastName, Email, DOB, CourseID)
VALUES (6, 'Sophia', 'Davis', 'sophia.davis@example.com', '2004-06-18', 999);

-- 5. SQL Queries
-- 1. Students born after 2000
SELECT FirstName, LastName
FROM 3_students_287
WHERE YEAR(DOB) > 2000;

-- 2. Update credits for Computer Science
UPDATE 3_courses_287
SET Credits = 4
WHERE CourseName = 'Computer Science';

-- 3. Delete student by email
DELETE FROM 3_students_287
WHERE Email = 'test@example.com';

-- 4. Students not enrolled in any course
SELECT * 
FROM 3_students_287
WHERE CourseID IS NULL;

-- 5. Re-test UNIQUE constraint
INSERT INTO 3_students_287 (StudentID, FirstName, LastName, Email, DOB, CourseID)
VALUES (7, 'Ava', 'Martinez', 'jane.smith@example.com', '2002-10-17', 1);

-- 6. Re-test FOREIGN KEY constraint
INSERT INTO 3_students_287 (StudentID, FirstName, LastName, Email, DOB, CourseID)
VALUES (8, 'Liam', 'Taylor', 'liam.taylor@example.com', '2000-07-09', 999);
