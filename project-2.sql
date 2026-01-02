-- Create database
CREATE DATABASE Project;

-- Use database
USE Project;

-- Create table for Departments
CREATE TABLE Departments (
	dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Insert multiple records
INSERT INTO departments (dept_id, dept_name) VALUES
(1, 'Computer Science'),
(2, 'Information Technology'),
(3, 'Mechanical Engineering'),
(4, 'Civil Engineering'),
(5, 'Electrical Engineering'),
(6, 'Electronics and Communication'),
(7, 'Business Administration'),
(8, 'Commerce'),
(9, 'Mathematics'),
(10, 'Physics');

-- Create table for Students
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    city VARCHAR(50),
    dept_id INT,
    marks INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Insert multiple records
INSERT INTO Students (student_id, name, age, city, dept_id, marks) VALUES
(1, 'Amit', 18, 'Delhi', 1, 75),
(2, 'Riya', 19, 'Mumbai', 2, 82),
(3, 'Rahul', 16, 'Pune', 3, 68),
(4, 'Neha', 18, 'Delhi', 1, 90),
(5, 'Karan', 21, 'Jaipur', 4, 55),
(6, 'ravi', 17, 'Indore', 2, 88),
(7, 'Vikas', 22, 'Bhopal', 5, 60),
(8, 'Sneha', 20, 'Surat', 6, 92),
(9, 'Ankit', 18, 'Delhi', null, 98),
(10, 'Nisha', 21, 'Nagpur', 7, 85);

-- Create table for Courses
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Insert multiple records
INSERT INTO Courses (course_id, course_name, dept_id) VALUES
(1, 'C', 4),
(2, 'CPP', 3),
(3, 'JAVA', 1),
(4, 'PY', 5),
(5, 'sql', 2),
(6, 'OS', 6),
(7, 'CN', 2),
(8, 'DS', 1),
(9, 'MATH', 9),
(10, 'PHY', 10);

-- Create table for Enrollments
CREATE TABLE Enrollments (
    enroll_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Insert multiple records
INSERT INTO Enrollments (enroll_id, student_id, course_id) VALUES
(1, 1, 1),
(2, 1, 5),
(3, 2, 2),
(4, 3, 3),
(5, 4, 4),
(6, 5, 6),
(7, 6, 7),
(8, 7, 8),
(9, 8, 9),
(10, 9, 10);

-- Create table for Teachers
CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Insert multiple records
INSERT INTO Teachers (teacher_id, name, dept_id) VALUES
(1, 'Raj', 1),
(2, 'Anita', 2),
(3, 'Suresh', 3),
(4, 'Kavita', 4),
(5, 'Amita', 5),
(6, 'Neelam', 6),
(7, 'Rohan', 7),
(8, 'Pooja', 8),
(9, 'Manoj', 9),
(10, 'Sunita', 10);

-- Show all students
SELECT * FROM students;

-- Show only student name and city
SELECT name , city FROM students;

-- Show students whose age is greater than 18
SELECT * FROM students 
WHERE age > 18;

-- Show students who live in “Delhi”
SELECT * FROM students 
WHERE city='Delhi';

-- Show students with marks greater than or equal to 80
SELECT * FROM Students
WHERE marks >= 80;

-- Show all students sorted by marks (highest first)
SELECT * FROM Students
ORDER BY marks DESC;

-- Show top 5 students by marks
SELECT * FROM Students
ORDER BY marks DESC
LIMIT 5;

-- Show students sorted by name (A → Z)
SELECT * FROM Students
ORDER BY name ASC;

-- Show students who are older than 18 and have marks above 75
SELECT * FROM Students
WHERE age > 18 AND marks > 75;

-- Show students who live in “Delhi” or “Mumbai”
SELECT * FROM Students
WHERE city = 'Delhi' OR city = 'Mumbai';

-- Show students whose name starts with “A”
SELECT * FROM Students
WHERE name LIKE 'A%';

-- Show students whose marks are between 60 and 90
SELECT * FROM Students
WHERE marks BETWEEN 60 AND 90;

-- Count how many students are in the table
SELECT COUNT(*) AS total_students
FROM Students;

-- Find the average marks of all students
SELECT AVG(marks) AS average_marks
FROM Students;

-- Find the highest marks
SELECT MAX(marks) AS highest_marks
FROM Students;

-- Show total students from each city (GROUP BY city)
SELECT city, COUNT(*) AS total_students
FROM Students
GROUP BY city;

-- Show each student with their department name(Students + Departments)
SELECT s.name AS student_name, d.dept_name
FROM Students s
JOIN Departments d ON s.dept_id = d.dept_id;

-- Show each course with its department name(Courses + Departments)
SELECT c.course_name, d.dept_name
FROM Courses c
JOIN Departments d ON c.dept_id = d.dept_id;

-- Show students enrolled in courses(Students + Enrollments + Courses)
SELECT s.name AS student_name, c.course_name
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id;

-- Show teachers with the departments they belong to
SELECT t.name AS teacher_name, d.dept_name
FROM Teachers t
JOIN Departments d ON t.dept_id = d.dept_id;

-- Show students and their courses, only for “Computer Science” department
SELECT s.name AS student_name, c.course_name
FROM Students s
JOIN Departments d ON s.dept_id = d.dept_id
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE d.dept_name = 'Computer Science';

-- Show students who do not have a department (LEFT JOIN)
SELECT s.name AS student_name, d.dept_name
FROM Students s
LEFT JOIN Departments d ON s.dept_id = d.dept_id
WHERE s.dept_id IS NULL;

-- Show departments that have no students
SELECT d.dept_name
FROM Departments d
LEFT JOIN Students s ON d.dept_id = s.dept_id
WHERE s.student_id IS NULL;

-- Show how many students are in each department(JOIN + GROUP BY)
SELECT d.dept_name, COUNT(s.student_id) AS total_students
FROM Departments d
JOIN Students s ON d.dept_id = s.dept_id
GROUP BY d.dept_name;

-- Show students whose marks are higher than the average marks
SELECT *
FROM Students
WHERE marks > (SELECT AVG(marks) FROM Students);

-- Show students who have the highest marks in the table
SELECT *
FROM Students
WHERE marks = (SELECT MAX(marks) FROM Students);

-- Show students who belong to the same department as a student named ‘Ravi’
SELECT *
FROM Students
WHERE dept_id = (SELECT dept_id FROM Students WHERE name = 'Ravi');

-- Show courses that have at least one student enrolled(sub-query on Enrollments)
SELECT *
FROM Courses
WHERE course_id IN (SELECT course_id FROM Enrollments);

-- Show students who are enrolled in more than one course
SELECT s.name, COUNT(e.course_id) AS total_courses
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.name
HAVING COUNT(e.course_id) > 1;

-- Show departments where average marks of students are above 75
SELECT d.dept_name, AVG(s.marks) AS avg_marks
FROM Departments d
JOIN Students s ON d.dept_id = s.dept_id
GROUP BY d.dept_name
HAVING AVG(s.marks) > 75;