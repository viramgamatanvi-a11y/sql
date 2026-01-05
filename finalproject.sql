-- Create a new database
CREATE DATABASE Final;

-- Use created database
USE Final;

-- Create table for Students table
CREATE TABLE Students(
	StudentID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email varchar(100),
    BirthDate DATE,
    EnrollmentDate DATE 
);

-- Insert multiple records
INSERT INTO Students (StudentID,FirstName,LastName,Email,BirthDate,EnrollmentDate)
VALUES
(1,'John','Doe','john.doe@email.com','2000-01-15','2022-08-01'),
(2,'Jane','Smith','jane.smith@email.com','1999-05-25','2021-08-01'),
(3,'Rahul','Sharma','rahul.sharma@email.com','2001-03-10','2023-08-01'),
(4,'Priya','Patel','priya.patel@email.com','2000-11-20','2022-08-01'),
(5,'Aman','Gupta','aman.gupta@email.com','1999-07-05','2021-08-01');

-- Create table for Departments table
CREATE TABLE Departments(
	DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) 
);

-- Insert multiple records
INSERT INTO Departments(DepartmentID,DepartmentName)
VALUES 
(1,'Computer Science'),
(2,'Mathematics'),
(3,'Physics'),
(4,'Chemistry'),
(5,'Biology');

-- Create table for Courses table
CREATE TABLE Courses(
	CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    DepartmentID INT,
    Credits INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Insert multiple records
INSERT INTO Courses (CourseID, CourseName, DepartmentID, Credits)
VALUES
(101,'Introduction to SQL',1,3),
(102,'Data Structures',2,4),
(103,'Quantum Mechanics',3,4),
(104,'Organic Chemistry',4,3),
(105,'Molecular Biology',5,4);

-- Create table for Instructors table
CREATE TABLE Instructors(
	InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Insert multiple records
INSERT INTO Instructors (InstructorID, FirstName, LastName, Email, DepartmentID)
VALUES
(1,'Alice','Johnson','alice.johnson@univ.com',1),
(2,'Bob','Lee','bob.lee@univ.com',2),
(3,'Neha','Verma','neha.verma@univ.com',3),
(4,'Amit','Kumar','amit.kumar@univ.com',4),
(5,'Rohit','Mehta','rohit.mehta@univ.com',5);

-- Create table for Enrollments table
CREATE TABLE Enrollments(
	EnrolmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Insert multiple records
INSERT INTO Enrollments (EnrolmentID, StudentID, CourseID, EnrollmentDate)
VALUES
(1,1,101,'2022-08-01'),
(2,2,102,'2021-08-01'),
(3,3,103,'2023-08-01'),
(4,4,104,'2022-08-01'),
(5,5,105,'2021-08-01');

-- CRUD Operations for Students table
-- Insert values
INSERT INTO Students
VALUES (6,'Karan','Malhotra','karan@univ.com','2001-06-15','2023-08-01');

-- Select all records
SELECT * FROM Students;

-- Select specific records
SELECT FirstName, LastName FROM Students;

-- Update
UPDATE Students
SET Email = 'karan.updated@univ.com'
WHERE StudentID = 6;

-- Delete
DELETE FROM Students
WHERE StudentID = 6;

-- CRUD Operations for Departments table
-- Insert values
INSERT INTO Departments
VALUES (6,'data science');

-- Select all records
SELECT * FROM Departments;

-- Select specific records
SELECT DepartmentName FROM Departments;

-- Update
UPDATE Departments
SET DepartmentName = 'Statistics'
WHERE DepartmentID = 6;

-- Delete
DELETE FROM Departments
WHERE DepartmentID = 6;

-- CRUD Operations for Courses table
-- Insert values
INSERT INTO Courses
VALUES (106,'Linear Algebra',2,4);

-- Select all records
SELECT * FROM Courses;

-- Select specific records
SELECT CourseID, CourseName FROM Courses;

-- Update
UPDATE Courses
SET Credits = 5
WHERE CourseID = 106;

-- Delete
DELETE FROM Courses
WHERE CourseID = 106;

-- CRUD Operations for Instructors table
-- Insert values
INSERT INTO Instructors
VALUES (6,'Anita','Desai','anita@univ.com',1);

-- Select all records
SELECT * FROM Instructors;

-- Select specific records
SELECT InstructorID, FirstName, LastName FROM Instructors;

-- Update
UPDATE Instructors
SET Email = 'anita.updated@univ.com'
WHERE InstructorID = 6;

-- Delete
DELETE FROM Instructors
WHERE InstructorID = 6;

-- CRUD Operations for Enrollments table
-- Insert values
INSERT INTO Enrollments
VALUES (6,1,102,'2023-08-01');

-- Select all records
SELECT * FROM Enrollments;

-- Select specific records
SELECT EnrolmentID, EnrollmentDate FROM Enrollments;

-- Update
UPDATE Enrollments
SET CourseID = 103
WHERE EnrolmentID = 6;

-- Delete
DELETE FROM Enrollments
WHERE EnrolmentID = 6;

-- Retrieve students who enrolled after 2022
SELECT * FROM Students
WHERE EnrollmentDate > '2022-12-31';

-- Retrieve courses offered by the Mathematics department with a limit of 5 courses
SELECT * FROM Courses
WHERE DepartmentID = 2
LIMIT 5;

-- Get the number of students enrolled in each course, filtering for courses with more than 5 students
SELECT CourseID, COUNT(StudentID) AS NumOfStudents
FROM Enrollments
GROUP BY CourseID
HAVING COUNT(StudentID) > 5;

-- Find students who are enrolled in both Introduction to SQL and Data Structures
SELECT s.StudentID, s.FirstName, s.LastName FROM Students s
JOIN Enrollments e1 ON s.StudentID = e1.StudentID
JOIN Enrollments e2 ON s.StudentID = e2.StudentID
WHERE e1.CourseID = 101   
  AND e2.CourseID = 102;
  
-- Find students who are either enrolled in Introduction to SQL or Data Structures
SELECT DISTINCT s.StudentID, s.FirstName, s.LastName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.CourseID = 101
   OR e.CourseID = 102;

-- Calculate the average number of credits for all courses
SELECT AVG(Credits) AS AverageCredits FROM Courses;

-- Find the maximum salary of instructors in the computer science department
-- Salary column not available

-- Count the number of students enrolled in each department
SELECT d.DepartmentName,COUNT(DISTINCT e.StudentID) AS TotalStudents
FROM Departments d
JOIN Courses c ON d.DepartmentID = c.DepartmentID
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY d.DepartmentName;

-- INNER JOIN : Retrieve students and their corresponding courses
SELECT s.StudentID, s.FirstName, s.LastName, c.CourseName
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID;

-- LEFT JOIN : Retrieve all students and their corresponding courses, if any
SELECT s.StudentID, s.FirstName, s.LastName, c.CourseName
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
LEFT JOIN Courses c ON e.CourseID = c.CourseID;

-- Subquery : Find students enrolled in courses that have more than 10 students
SELECT StudentID, FirstName, LastName
FROM Students
WHERE StudentID IN (
    SELECT e.StudentID
    FROM Enrollments e
    WHERE e.CourseID IN (
        SELECT CourseID
        FROM Enrollments
        GROUP BY CourseID
        HAVING COUNT(StudentID) > 10
    )
);

-- Extract the year from the EnrollmentDate of Students
SELECT StudentID, FirstName, LastName,
       YEAR(EnrollmentDate) AS EnrollmentYear
FROM Students;

-- Concatenate the instructor's first and last name
SELECT InstructorID,
       CONCAT(FirstName, ' ', LastName) AS FullName
FROM Instructors;

-- Calculate the running total of students enrolled in courses
SELECT EnrollmentDate,
    COUNT(StudentID) AS StudentsPerDate,
    SUM(COUNT(StudentID)) OVER (ORDER BY EnrollmentDate) AS RunningTotal
FROM Enrollments
GROUP BY EnrollmentDate
ORDER BY EnrollmentDate;

-- Label students as 'Senior' or 'Junior' based on their year of enrollment. (If the enrollment date is more than 4 years from the currendate , put the label 'Senior' otherwise 'Junior') 
SELECT StudentID, FirstName, LastName, EnrollmentDate,
    CASE
        WHEN EnrollmentDate <= DATE_SUB(CURDATE(), INTERVAL 4 YEAR) THEN 'Senior'
        ELSE 'Junior'
    END AS StudentLevel
FROM Students;