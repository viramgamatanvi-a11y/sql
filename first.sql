CREATE DATABASE companydata;

USE companydata;

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100),
    Salary DECIMAL(10,2),
    Department VARCHAR(50),
    JoiningDate DATE
);

-- Insert a single record
INSERT INTO Employees (EmpID, Name, Salary, Department, JoiningDate) 
VALUES (1, 'John Doe', 50000.00, 'HR', '2023-01-10');

-- Insert multiple records
INSERT INTO Employees (EmpID, Name, Salary, Department, JoiningDate) 
VALUES 
(2, 'Alice Smith', 60000.00, 'IT', '2022-12-01'),
(3, 'Bob Johnson', 55000.00, 'Finance', '2023-02-15');

-- Select all records
SELECT * FROM Employees;

-- Select specific columns
SELECT Name, Salary FROM Employees;

-- Filter records using WHERE clause
SELECT * FROM Employees WHERE Salary > 50000;

-- Sorting results (Descending Order)
SELECT * FROM Employees ORDER BY Salary DESC;

-- Counting records
SELECT COUNT(*) FROM Employees WHERE Department = 'IT';

-- Update salary for a specific employee
UPDATE Employees 
SET Salary = 65000.00 
WHERE EmpID = 2;

-- Delete a specific record
DELETE FROM Employees WHERE EmpID = 3;

-- Reset auto-increment after deletion (if using AUTO_INCREMENT)
ALTER TABLE Employees AUTO_INCREMENT = 1;
