-- Insert Data
INSERT INTO Departments_287 (DeptName, HOD) VALUES
('Computer Science', 'Dr. Rajesh Sharma'),
('Electronics and Communication', 'Dr. Pooja Mehta'),
('Mechanical Engineering', 'Dr. Anil Kumar'),
('Civil Engineering', 'Dr. Ramesh Patil'),
('Electrical Engineering', 'Dr. Neha Verma');

INSERT INTO Students_287 (Name, Age, DepartmentID, CGPA) VALUES
('Amit Kumar', 19, 1, 8.5),
('Priya Sharma', 20, 1, 9.2),
('Rahul Verma', 21, 2, 7.8),
('Sneha Patel', 22, 3, 8.1),
('Vikram Reddy', 23, 4, 7.3),
('Arjun Singh', 20, 2, 8.7),
('Neha Joshi', 19, 1, 9.0),
('Suresh Nair', 21, 5, 7.6),
('Ananya Iyer', 22, 3, 8.9),
('Rohan Deshmukh', 23, 4, 7.5);

INSERT INTO Courses_287 (CourseID, CourseName, DepartmentID) VALUES
('CSE101', 'Data Structures', 1),
('CSE102', 'Database Management Systems', 1),
('ECE201', 'Digital Electronics', 2),
('ECE202', 'Microprocessors', 2),
('ME301', 'Thermodynamics', 3),
('ME302', 'Fluid Mechanics', 3),
('CIV401', 'Structural Analysis', 4),
('CIV402', 'Concrete Technology', 4),
('EE501', 'Power Systems', 5),
('EE502', 'Control Systems', 5);

INSERT INTO Enrollments_287 (StudentID, CourseID, Marks) VALUES
(1, 'CSE101', 85), (1, 'CSE102', 78),
(2, 'CSE101', 92), (2, 'CSE102', 89),
(3, 'ECE201', 76), (3, 'ECE202', 81),
(4, 'ME301', 88), (4, 'ME302', 74),
(5, 'CIV401', 65), (5, 'CIV402', 72),
(6, 'ECE201', 90), (6, 'ECE202', 85),
(7, 'CSE101', 95),
(8, 'EE501', 79), (8, 'EE502', 82),
(9, 'ME301', 91),
(10, 'CIV401', 68);

-- 1
SELECT * FROM Students_287
WHERE CGPA > (SELECT AVG(CGPA) FROM Students_287);

-- 2
SELECT * FROM Students_287
WHERE StudentID NOT IN (SELECT DISTINCT StudentID FROM Enrollments_287);

-- 3
SELECT * FROM Courses_287
WHERE CourseID NOT IN (SELECT DISTINCT CourseID FROM Enrollments_287);

-- 4
SELECT s.* FROM Students_287 s
JOIN Enrollments_287 e ON s.StudentID = e.StudentID
JOIN Courses_287 c ON e.CourseID = c.CourseID
JOIN Departments_287 d ON c.DepartmentID = d.DeptID
WHERE d.DeptName LIKE 'Computer Sci%';

-- 5
SELECT * FROM Students_287
WHERE Age = (SELECT MAX(Age) FROM Students_287);

-- 6
SELECT DISTINCT c.CourseName FROM Courses_287 c
JOIN Enrollments_287 e ON c.CourseID = e.CourseID
WHERE e.Marks > 85;

-- 7
SELECT d.DeptName, MAX(s.CGPA) AS HighestCGPA
FROM Students_287 s
JOIN Departments_287 d ON s.DepartmentID = d.DeptID
GROUP BY d.DeptName;

-- 8
SELECT StudentID FROM Enrollments_287
GROUP BY StudentID HAVING COUNT(DISTINCT CourseID) > 1;

-- 9
SELECT d.DeptName
FROM Students_287 s
JOIN Departments_287 d ON s.DepartmentID = d.DeptID
GROUP BY d.DeptName
ORDER BY COUNT(*) DESC LIMIT 1;

-- 10
SELECT * FROM Students_287
WHERE StudentID NOT IN (SELECT StudentID FROM Enrollments_287);

-- 11
SELECT e.StudentID, e.CourseID, e.Marks
FROM Enrollments_287 e
WHERE Marks < (
  SELECT AVG(Marks)
  FROM Enrollments_287 e2
  WHERE e2.CourseID = e.CourseID
);

-- 12
SELECT s.*, d.DeptName
FROM Students_287 s
JOIN Departments_287 d ON s.DepartmentID = d.DeptID
WHERE CGPA = (SELECT MAX(CGPA) FROM Students_287);

-- 13 (Same as 9)

-- 14
SELECT CourseID FROM Enrollments_287
GROUP BY CourseID
HAVING MIN(Marks) > 70;

-- 15
SELECT * FROM Students_287
WHERE CGPA = (SELECT CGPA FROM Students_287 WHERE Name = 'Alice');

-- 16
SELECT CourseID FROM Enrollments_287
GROUP BY CourseID
ORDER BY COUNT(*) DESC LIMIT 1;

-- 17
SELECT StudentID FROM Enrollments_287
GROUP BY StudentID HAVING COUNT(*) > 2;

-- 18
SELECT s.StudentID, s.Name, e.CourseID, e.Marks
FROM Enrollments_287 e
JOIN Students_287 s ON s.StudentID = e.StudentID
WHERE e.Marks = (
  SELECT MAX(Marks) FROM Enrollments_287
);

-- 19
SELECT d.DeptName FROM Students_287 s
JOIN Departments_287 d ON s.DepartmentID = d.DeptID
GROUP BY d.DeptName
ORDER BY AVG(CGPA) ASC LIMIT 1;

-- 20
SELECT CourseID FROM Enrollments_287
WHERE Marks < 40
GROUP BY CourseID
ORDER BY COUNT(*) DESC LIMIT 1;
