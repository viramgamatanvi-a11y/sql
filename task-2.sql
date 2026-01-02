create database task2;
use task2;

create table departments (
	dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

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


create table Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    city VARCHAR(50),
    dept_id INT,
    marks INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

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



CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

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


CREATE TABLE Enrollments (
    enroll_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

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


CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

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


SELECT * FROM Students;

SELECT name, city FROM Students;

SELECT * FROM Students
WHERE age > 18;

SELECT * FROM Students
WHERE city = 'Delhi';

SELECT * FROM Students
WHERE marks >= 80;

SELECT * FROM Students
ORDER BY marks DESC;

SELECT * FROM Students
ORDER BY marks DESC
LIMIT 5;

SELECT * FROM Students
ORDER BY name ASC;

SELECT * FROM Students
WHERE age > 18 AND marks > 75;

SELECT * FROM Students
WHERE city = 'Delhi' OR city = 'Mumbai';

SELECT * FROM Students
WHERE name LIKE 'A%';

SELECT * FROM Students
WHERE marks BETWEEN 60 AND 90;

SELECT COUNT(*) AS total_students
FROM Students;

SELECT AVG(marks) AS average_marks
FROM Students;

SELECT MAX(marks) AS highest_marks
FROM Students;

SELECT city, COUNT(*) AS total_students
FROM Students
GROUP BY city;

SELECT s.name AS student_name, d.dept_name
FROM Students s
JOIN Departments d ON s.dept_id = d.dept_id;

SELECT c.course_name, d.dept_name
FROM Courses c
JOIN Departments d ON c.dept_id = d.dept_id;

SELECT s.name AS student_name, c.course_name
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id;

SELECT t.name AS teacher_name, d.dept_name
FROM Teachers t
JOIN Departments d ON t.dept_id = d.dept_id;

SELECT s.name AS student_name, c.course_name
FROM Students s
JOIN Departments d ON s.dept_id = d.dept_id
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE d.dept_name = 'Computer Science';

SELECT s.name AS student_name, d.dept_name
FROM Students s
LEFT JOIN Departments d ON s.dept_id = d.dept_id
WHERE s.dept_id IS NULL;

SELECT d.dept_name
FROM Departments d
LEFT JOIN Students s ON d.dept_id = s.dept_id
WHERE s.student_id IS NULL;

SELECT d.dept_name, COUNT(s.student_id) AS total_students
FROM Departments d
JOIN Students s ON d.dept_id = s.dept_id
GROUP BY d.dept_name;

SELECT *
FROM Students
WHERE marks > (SELECT AVG(marks) FROM Students);

SELECT *
FROM Students
WHERE marks = (SELECT MAX(marks) FROM Students);

SELECT *
FROM Students
WHERE dept_id = (SELECT dept_id FROM Students WHERE name = 'Ravi');

SELECT *
FROM Courses
WHERE course_id IN (SELECT course_id FROM Enrollments);

SELECT s.name, COUNT(e.course_id) AS total_courses
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.name
HAVING COUNT(e.course_id) > 1;

SELECT d.dept_name, AVG(s.marks) AS avg_marks
FROM Departments d
JOIN Students s ON d.dept_id = s.dept_id
GROUP BY d.dept_name
HAVING AVG(s.marks) > 75;