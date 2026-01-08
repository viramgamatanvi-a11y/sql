-- Create a new database
CREATE DATABASE Tracker;

-- use database
USE Tracker;

-- Create table for department 
CREATE TABLE Departments (
	Department_id INT PRIMARY KEY,
    Department_name VARCHAR(50) 
);

-- Insert value for department table
INSERT INTO Departments (Department_id, Department_name)
VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Sales'),
(6, 'Operations'),
(7, 'Customer Support'),
(8, 'Research'),
(9, 'Computer Science'),
(10, 'Training'),
(11, 'Logistics'),
(12, 'Legal');

-- Create table for Students
CREATE TABLE Students (
	Student_id INT PRIMARY KEY,
    Name VARCHAR(100),
    Dob DATE,
    Gender VARCHAR(10),
    Email VARCHAR(50),
    Phone_number INT,
    Address VARCHAR(50),
    Admission_date DATE,
    Department_id INT,
	FOREIGN KEY (Department_id) REFERENCES Departments(Department_id)
);

-- Insert value for Students table
INSERT INTO Students (Student_id, Name, Dob, Gender, Email, Phone_number, Address, Admission_date, Department_id)
VALUES
(1, 'Rahul Sharma', '2002-05-10', 'Male', 'rahul@gmail.com', 987654321, 'Ahmedabad', '2021-06-15', 1),
(2, 'Priya Patel', '2001-09-18', 'Female', 'priya@gmail.com', 987654322, 'Surat', '2021-06-16', 2),
(3, 'Amit Verma', '2002-01-25', 'Male', 'amit@gmail.com', 987654323, 'Vadodara', '2021-06-17', 3),
(4, 'Neha Mehta', '2001-11-12', 'Female', 'neha@gmail.com', 987654324, 'Rajkot', '2021-06-18', 4),
(5, 'Karan Joshi', '2002-03-08', 'Male', 'karan@gmail.com', 987654325, 'Bhavnagar', '2021-06-19', 5),
(6, 'Sneha Iyer', '2001-07-21', 'Female', 'sneha@gmail.com', 987654326, 'Mumbai', '2021-06-20', 6),
(7, 'Rohit Singh', '2002-12-30', 'Male', 'rohit@gmail.com', 987654327, 'Delhi', '2021-06-21', 7),
(8, 'Pooja Nair', '2001-04-14', 'Female', 'pooja@gmail.com', 987654328, 'Kochi', '2021-06-22', 8),
(9, 'Ankit Malhotra', '2002-06-19', 'Male', 'ankit@gmail.com', 987654329, 'Chandigarh', '2021-06-23', 9),
(10, 'Riya Kapoor', '2001-02-05', 'Female', 'riya@gmail.com', 987654330, 'Jaipur', '2021-06-24', 10),
(11, 'Vikas Yadav', '2002-10-09', 'Male', 'vikas@gmail.com', 987654331, 'Lucknow', '2021-06-25', 11),
(12, 'Ayesha Khan', '2001-08-27', 'Female', 'ayesha@gmail.com', 987654332, 'Bhopal', '2021-06-26', 12);

-- Create table for Faculty 
CREATE TABLE Faculty (
	Faculty_id INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(50),
    Phone_number INT,
	Department_id INT,
	FOREIGN KEY (Department_id) REFERENCES Departments(Department_id)
);

-- Insert value for Faculty table
INSERT INTO Faculty (Faculty_id, Name, Email, Phone_number, Department_id)
VALUES
(1, 'Dr. Suresh Patel', 'suresh.patel@gmail.com', 912345671, 1),
(2, 'Prof. Anita Shah', 'anita.shah@gmail.com', 912345672, 2),
(3, 'Dr. Rajesh Mehta', 'rajesh.mehta@gmail.com', 912345673, 3),
(4, 'Prof. Neelam Joshi', 'neelam.joshi@gmail.com', 912345674, 4),
(5, 'Dr. Ketan Desai', 'ketan.desai@gmail.com', 912345675, 5),
(6, 'Prof. Sunita Iyer', 'sunita.iyer@gmail.com', 912345676, 6),
(7, 'Dr. Manoj Singh', 'manoj.singh@gmail.com', 912345677, 7),
(8, 'Prof. Latha Nair', 'latha.nair@gmail.com', 912345678, 8),
(9, 'Dr. Anil Malhotra', 'anil.malhotra@gmail.com', 912345679, 9),
(10, 'Prof. Kavita Kapoor', 'kavita.kapoor@gmail.com', 912345680, 10),
(11, 'Dr. Ramesh Yadav', 'ramesh.yadav@gmail.com', 912345681, 11),
(12, 'Prof. Farah Khan', 'farah.khan@gmail.com', 912345682, 12);

-- Create table for Courses
CREATE TABLE Courses (
	Course_id INT PRIMARY KEY,
    Course_name VARCHAR(50),
    Faculty_id INT,
	FOREIGN KEY (Faculty_id) REFERENCES Faculty(Faculty_id)
);

-- Insert value for Courses table
INSERT INTO Courses (Course_id, Course_name, Faculty_id)
VALUES
(1, 'Human Resource Management', 1),
(2, 'Database Management System', 2),
(3, 'Financial Accounting', 3),
(4, 'Digital Marketing', 4),
(5, 'Sales Management', 5),
(6, 'Operations Research', 6),
(7, 'Customer Relationship Management', 7),
(8, 'Research Methodology', 8),
(9, 'Office Administration', 9),
(10, 'Corporate Training', 10),
(11, 'Supply Chain Management', 11),
(12, 'Business Law', 12);

-- Create table for Enrollments 
CREATE TABLE Enrollments (
	Enrollment_id INT PRIMARY KEY,
    Student_id INT,
    Course_id INT,
    Enrollment_date DATE,
	FOREIGN KEY (Student_id) REFERENCES Students(Student_id),
	FOREIGN KEY (Course_id) REFERENCES Courses(Course_id)
);

-- Insert value for Enrollment table
INSERT INTO Enrollments (Enrollment_id, Student_id, Course_id, Enrollment_date)
VALUES
(1, 1, 1, '2021-07-01'),
(2, 2, 2, '2021-07-02'),
(3, 3, 3, '2021-07-03'),
(4, 4, 4, '2021-07-04'),
(5, 5, 5, '2021-07-05'),
(6, 6, 6, '2021-07-06'),
(7, 7, 7, '2021-07-07'),
(8, 8, 8, '2021-07-08'),
(9, 9, 9, '2021-07-09'),
(10, 10, 10, '2021-07-10'),
(11, 11, 11, '2021-07-11'),
(12, 2, 12, '2021-07-12');

-- Create table for Attendance
CREATE TABLE Attendance (
	Attendance_id INT PRIMARY KEY,
	Student_id INT,
    Course_id INT,
    Attendance_date DATE,
    Status VARCHAR(50),
 	FOREIGN KEY (Student_id) REFERENCES Students(Student_id),
	FOREIGN KEY (Course_id) REFERENCES Courses(Course_id)   
);

-- Insert value for Attendance table
INSERT INTO Attendance (Attendance_id, Student_id, Course_id, Attendance_date, Status)
VALUES
(1, 1, 1, '2021-07-15', 'Present'),
(2, 2, 2, '2021-07-15', 'Absent'),
(3, 3, 3, '2021-07-15', 'Present'),
(4, 4, 4, '2021-07-15', 'Present'),
(5, 5, 5, '2021-07-15', 'Absent'),
(6, 6, 6, '2021-07-15', 'Present'),
(7, 7, 7, '2021-07-15', 'Present'),
(8, 8, 8, '2021-07-15', 'Absent'),
(9, 9, 9, '2021-07-15', 'Present'),
(10, 10, 10, '2021-07-15', 'Present'),
(11, 11, 11, '2021-07-15', 'Absent'),
(12, 2, 12, '2021-07-15', 'Present');

-- Create table for Grades
CREATE TABLE Grades (
	Grade_id INT PRIMARY KEY,
	Student_id INT,
    Course_id INT,
    Marks_obtained INT,
    Grade VARCHAR(50),
 	FOREIGN KEY (Student_id) REFERENCES Students(Student_id),
	FOREIGN KEY (Course_id) REFERENCES Courses(Course_id) 
);

-- Insert value for Grades table
INSERT INTO Grades (Grade_id, Student_id, Course_id, Marks_obtained, Grade)
VALUES
(1, 1, 1, 85, 'A'),
(2, 2, 2, 78, 'B'),
(3, 3, 3, 92, 'A+'),
(4, 4, 4, 88, 'A'),
(5, 5, 5, 69, 'C'),
(6, 6, 6, 74, 'B'),
(7, 7, 7, 90, 'A+'),
(8, 8, 8, 65, 'C'),
(9, 9, 9, 81, 'A'),
(10, 10, 10, 87, 'A'),
(11, 11, 11, 72, 'B'),
(12, 2, 12, 95, 'A+');

-- 1. Implement CRUD Operations 
-- Insert new students, faculty members, courses, and enrollments.
INSERT INTO Students (Student_id, Name, Dob, Gender, Email, Phone_number, Address, Admission_date, Department_id)
VALUES (13, 'Aarav Shah', '2003-02-15', 'Male', 'aarav@gmail.com', 987654333, 'Gandhinagar', '2023-06-01', 2);

INSERT INTO Faculty (Faculty_id, Name, Email, Phone_number, Department_id)
VALUES (13, 'Dr. Meena Sharma', 'meena.sharma@gmail.com', 912345683, 2);

INSERT INTO Courses (Course_id, Course_name, Faculty_id)
VALUES (13, 'Advanced Databases', 13);

INSERT INTO Enrollments (Enrollment_id, Student_id, Course_id, Enrollment_date)
VALUES (13, 13, 13, '2023-06-05');

-- Update student records when they change contact details.
UPDATE Students
SET Email = 'aarav.shah@gmail.com', Phone_number = 987654334
WHERE Student_id = 13;

-- Delete students who have dropped out.
DELETE FROM Students WHERE Student_id = 12;

-- 2. Use SQL Clauses (WHERE, HAVING, LIMIT) 
-- Get students enrolled in the Computer Science Department.
SELECT s.* FROM Students s
JOIN Departments d ON s.department_id = d.department_id
WHERE d.department_name = 'Computer Science';

-- Retrieve the top 10 highest-scoring students.
SELECT student_id, SUM(marks_obtained) AS total_marks FROM Grades
GROUP BY student_id
ORDER BY total_marks DESC
LIMIT 10;

-- Find students with attendance below 75%.
SELECT student_id,
       (SUM(CASE WHEN status = 'Present' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS attendance_percentage
FROM Attendance
GROUP BY student_id
HAVING attendance_percentage < 75;

-- 3. Apply SQL Operators (AND, OR, NOT) 
-- Retrieve students who have attendance below 50% AND are failing.
SELECT g.student_id 
FROM Grades g
JOIN Attendance a ON g.student_id = a.student_id
GROUP BY g.student_id
HAVING AVG(g.marks_obtained) < 40
   AND (SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) / COUNT(*)) * 100 < 50;
   
-- Find students who scored above 90 OR have perfect attendance.
SELECT DISTINCT student_id FROM Grades
WHERE marks_obtained > 90
OR student_id IN (
    SELECT student_id
    FROM Attendance
    GROUP BY student_id
    HAVING SUM(status = 'Present') = COUNT(*)
);

-- List faculty members NOT assigned to any course.
SELECT *
FROM Faculty
WHERE faculty_id NOT IN (
    SELECT faculty_id FROM Courses
);

-- 4. Sorting & Grouping Data (ORDER BY, GROUP BY) 
-- List students alphabetically by name.
SELECT * FROM Students
ORDER BY name ASC;

-- Count the number of students enrolled in each department.
SELECT department_id, COUNT(*) AS total_students FROM Students
GROUP BY department_id;

-- Show the average marks per course.
SELECT course_id, AVG(marks_obtained) AS avg_marks FROM Grades
GROUP BY course_id;

-- 5. Use Aggregate Functions (SUM, AVG, MAX, MIN, COUNT)
-- Find the average attendance percentage of students.
SELECT student_id,
       (SUM(CASE WHEN status = 'Present' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS avg_attendance
FROM Attendance
GROUP BY student_id;

-- Identify the highest and lowest marks obtained in each course.
SELECT course_id,
       MAX(marks_obtained) AS highest,
       MIN(marks_obtained) AS lowest
FROM Grades
GROUP BY course_id;

-- Calculate the total number of students per department.
SELECT department_id, COUNT(*) AS total_students
FROM Students
GROUP BY department_id;

-- 6. Establish Primary & Foreign Key Relationships
-- Ensure thet students cannot enroll in the same course multiple times.
-- Link faculty members to the courses they teach.
-- This query is already created.

-- 7. Implement Joins 
-- Retrieve student details along with their department using INNER JOIN.
SELECT s.name, d.department_name
FROM Students s
INNER JOIN Departments d
ON s.department_id = d.department_id;

-- Get a list of students who have not enrolled in any course using LEFT JOIN.
SELECT s.*
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;

-- List courses that have no faculty assigned using RIGHT JOIN.
SELECT c.*
FROM Faculty f
RIGHT JOIN Courses c ON f.faculty_id = c.faculty_id
WHERE f.faculty_id IS NULL;

-- Show students without grades using FULL OUTER JOIN (Simulated via LEFT JOIN).
SELECT s.student_id
FROM Students s
LEFT JOIN Grades g ON s.student_id = g.student_id
WHERE g.grade_id IS NULL;

-- 8. Use Subqueries 
-- Find students with marks above the average score.
SELECT * FROM Grades
WHERE marks_obtained >
      (SELECT AVG(marks_obtained) FROM Grades);
      
-- Retrieve courses taught by faculty members with at least 5 years of experience
-- column is not available

-- Identify students who have missed more than 10 classes.
SELECT student_id FROM Attendance
WHERE status = 'Absent'
GROUP BY student_id
HAVING COUNT(*) > 10;

-- 9. Implement Date & Time Functions 
-- Extract the month from attendance_date to analyze attendance trends.
SELECT 
    MONTHNAME(Attendance_date) AS month_name,
    COUNT(*) AS total_records
FROM Attendance
GROUP BY MONTHNAME(Attendance_date), MONTH(Attendance_date)
ORDER BY MONTH(Attendance_date);

-- Calculate the number of years since a student’s admission.
SELECT student_id,
       TIMESTAMPDIFF(YEAR, admission_date, CURDATE()) AS years_since_admission
FROM Students;

-- Format attendance_date as DD-MM-YYYY.
SELECT DATE_FORMAT(attendance_date, '%d-%m-%Y')
FROM Attendance;

-- 10. Use String Manipulation Functions 
-- Convert all faculty names to uppercase.
SELECT UPPER(name) FROM Faculty;

-- Trim unnecessary spaces from student names.
SELECT TRIM(name) FROM Students;

-- Replace NULL email fields with "Email Not Provided".
SELECT IFNULL(email, 'Email Not Provided') FROM Students;

-- 11. Implement Window Functions 
-- Rank students based on their overall marks.
SELECT student_id,
       SUM(marks_obtained) AS overall_marks,
       RANK() OVER (ORDER BY SUM(marks_obtained) DESC) AS rank_no
FROM Grades
GROUP BY student_id;

-- Show the cumulative attendance percentage per course.
SELECT 
    course_id,
    attendance_date,
    (SUM(CASE WHEN status = 'Present' THEN 1 ELSE 0 END) OVER (PARTITION BY course_id ORDER BY attendance_date) / 
     COUNT(*) OVER (PARTITION BY course_id ORDER BY attendance_date)) * 100 AS cumulative_attendance_pct
FROM Attendance;

-- Display the running total of students enrolled per month.
SELECT 
    enroll_month,
    students_enrolled,
    SUM(students_enrolled) OVER (ORDER BY enroll_month) 
        AS running_total_students
FROM (
    SELECT 
        DATE_FORMAT(Enrollment_date, '%Y-%m') AS enroll_month,
        COUNT(DISTINCT student_id) AS students_enrolled
    FROM Enrollments
    GROUP BY DATE_FORMAT(Enrollment_date, '%Y-%m')
) t;

-- 12. Apply SQL CASE Expressions 
-- Assign student performance levels:
-- "Excellent" if marks_obtained > 90.
-- "Good" if marks_obtained BETWEEN 75 AND 90.
-- "Needs Improvement" otherwise.
SELECT student_id,
CASE
    WHEN marks_obtained > 90 THEN 'Excellent'
    WHEN marks_obtained BETWEEN 75 AND 90 THEN 'Good'
    ELSE 'Needs Improvement'
END AS performance
FROM Grades;

-- Categorize attendance records:
-- "Regular" for attendance above 80%.
-- "Irregular" for attendance between 50% and 80%.
-- "Defaulter" otherwise.
SELECT student_id,
CASE
    WHEN (SUM(CASE WHEN status='Present' THEN 1 ELSE 0 END)/COUNT(*))*100 > 80 THEN 'Regular'
    WHEN (SUM(CASE WHEN status='Present' THEN 1 ELSE 0 END)/COUNT(*))*100 BETWEEN 50 AND 80 THEN 'Irregular'
    ELSE 'Defaulter'
END AS attendance_status
FROM Attendance
GROUP BY student_id;