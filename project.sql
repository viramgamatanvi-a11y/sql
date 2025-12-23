-- Create a new database
CREATE DATABASE Schooldatabase;

-- Use the created database
USE Schooldatabase;

-- Create a table for Student
CREATE TABLE Student(
	Student_id INT PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
    Age INT,
    Marks INT CHECK (MARKS BETWEEN 0 AND 100),
    City VARCHAR(50) DEFAULT 'Delhi'
);

-- Create a table for Employees
CREATE TABLE EMPLOYEES (
    Emp_Id INT PRIMARY KEY,                       
    Emp_Name VARCHAR(50) NOT NULL,                
    Salary DECIMAL(10,2) CHECK (Salary > 0),      
    Department VARCHAR(50) NOT NULL,              
    Joining_Date DATE         
);

-- Insert multiple records for Student 
INSERT INTO Student (Student_id , Name , Age , Marks , City)
VALUES
(1, 'Rahul', 18, 85, 'Ahmedabad'),
(2, 'Priya', 17, 78, 'Delhi'),
(3, 'Amit', 19, 90, 'Delhi'),
(4, 'Neha', 18, 88, 'Rajkot'),
(5, 'Karan', 17, 72, 'Bhavnagar'),
(6, 'Pooja', 18, 95, 'Delhi'),
(7, 'Ravi', 19, 80, 'Mumbai'),
(8, 'Sneha', 17, 83, 'Anand'),
(9, 'Vikas', 18, 76, 'Delhi'),
(10, 'Meena', 19, 89, 'Mumbai');

-- insert values
INSERT INTO Employees (Emp_Id , Emp_Name , Salary , Department , Joining_Date)
VALUES
(101, 'Rahul Sharma', 45000.00, 'IT', '2023-01-10'),
(102, 'Amit Verma', 38000.00, 'HR', '2023-03-15'),
(103, 'Neha Singh', 52000.00, 'Finance', '2022-11-20'),
(104, 'Rohit Kumar', 60000.00, 'IT', '2021-08-05'),
(105, 'Pooja Patel', 24000.00, 'Marketing', '2023-06-01'),
(106, 'Suresh Mehta', 75000.00, 'IT', '2020-02-18'),
(107, 'Anjali Jain', 28000.00, 'HR', '2022-09-12'),
(108, 'Vikas Gupta', 68000.00, 'Finance', '2021-04-25'),
(109, 'Kavita Rao', 47000.00, 'Marketing', '2023-07-30'),
(110, 'Manoj Yadav', 15000.00, 'IT', '2022-12-05');

-- Select all recoeds
SELECT * FROM Student;

-- Select specific columns
SELECT Name, Marks FROM Student;

-- Filter records using WHERE clause
SELECT * FROM Student WHERE Marks > 70;

-- find students who belong to the city 'Delhi'
SELECT * FROM Student WHERE City = 'Delhi';

-- Filter records using WHERE clause
SELECT * FROM Employees WHERE Salary > 30000;

-- find students who are from Delhi AND marks > 60
SELECT * FROM Student WHERE City = 'Delhi' AND Marks > 60;

-- find employees who work in HR OR IT department
SELECT * FROM Employees WHERE Department = 'HR' OR Department = 'IT';

-- find students who are NOT from Mumbai
SELECT * FROM Student WHERE City != 'Mumbai';

-- students ordered by marks in descending order
SELECT * FROM Student ORDER BY Marks DESC;

-- employees ordered by salary in ascending order
SELECT * FROM Employees ORDER BY Salary ASC;

-- top 5 students based on marks
SELECT * FROM Student ORDER BY Marks DESC LIMIT 5;

-- first 3 employees from the Employees table
SELECT * FROM Employees LIMIT 3;

-- total number of employees in each department
SELECT Department, COUNT(*) FROM Employees GROUP BY department;

-- average salary of each department
SELECT AVG(Salary) AS AVERAGE_SALARY FROM Employees;

-- departments where average salary is greater than 40000
SELECT Department FROM Employees GROUP BY Department HAVING AVG(Salary) > 40000;

-- cities having more than 2 students
SELECT City FROM Student GROUP BY City HAVING COUNT(*) > 2;

-- the maximum marks scored by students
SELECT MAX(Marks) AS MAX_MARKS FROM Student;

-- the minimum salary among employees
SELECT MIN(Salary) AS MIN_SALARY FROM Employees;

-- the average marks of all students
SELECT AVG(Marks) AS AVERAGE_MARKS FROM Student;

-- the total number of students
SELECT SUM(Marks) AS TOTAL_MARKS FROM Student;