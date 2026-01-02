-- Create a new database 
CREATE DATABASE Transformer;

-- Use the created database
USE Transformer;

-- Create table for Customers table
CREATE TABLE Customers (
	CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(100),
    RegistrationDate DATE
);

-- Insert multiple records
INSERT INTO Customers (CustomerID,FirstName,LastName,Email,RegistrationDate)
VALUES
(1,'John','Doe','john.doe@email.com','2022-03-15'),
(2,'Jane','Smith','jane.smith@email.com','2021-11-02');

-- Create table for Orders table
CREATE TABLE Orders (
	OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert multiple records
INSERT INTO Orders (OrderID,CustomerID,OrderDate,TotalAmount)
VALUES
(101,1,'2023-07-01',150.50),
(102,2,'2023-07-03',200.75);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Department VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10,2)
);

-- Insert multiple records
INSERT INTO Employees (EmployeeID,FirstName,LastName,Department,HireDate,Salary)
VALUES
(1,'Mark','Johnson','Sales','2020-01-15',50000.00),
(2,'Susan','Lee','HR','2021-03-20',55000.00);

-- INNER JOIN : Retrieve all orders and customer details where orders exist.
SELECT o.*, c.FirstName, c.LastName, c.Email, c.RegistrationDate
FROM Orders as o
INNER JOIN Customers as c ON o.CustomerID = c.CustomerID;

-- LEFT JOIN: Retrieve all Customers and their corresponding orders. 
SELECT c.*, o.OrderID, o.OrderDate, o.TotalAmount
FROM Customers as c
LEFT JOIN Orders as o ON c.CustomerID = o.CustomerID;

-- RIGHT JOIN: Retrieve all Orders and their corresponding Customers. 
SELECT c.*, o.OrderID, o.OrderDate, o.TotalAmount
FROM Orders as o
RIGHT JOIN Customers as c ON o.CustomerID = c.CustomerID;

-- FULL OUTER JOIN: Retrieve all Customers and all Orders, regardless of matching.
SELECT c.*, o.OrderID, o.OrderDate, o.TotalAmount
FROM Customers as c
LEFT JOIN Orders as o ON c.CustomerID = o.CustomerID
UNION
SELECT c.*, o.OrderID, o.OrderDate, o.TotalAmount
FROM Customers as c
RIGHT JOIN Orders as o ON c.CustomerID = o.CustomerID;

-- Subquery to find customers who have placed orders worth more than the average amount.
SELECT * FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID FROM Orders
    WHERE TotalAmount > (SELECT AVG(TotalAmount) FROM Orders)
);

-- Subquery to find employees with salaries above the average salary.
SELECT * FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- Extract the year and month from the OrderDate.
SELECT 
    OrderID,
    YEAR(OrderDate) AS OrderYear,
    MONTH(OrderDate) AS OrderMonth
FROM Orders;

-- Calculate the difference in days between two dates
SELECT 
    OrderID, OrderDate,
    DATEDIFF(CURDATE(), OrderDate) AS Days_Difference
FROM Orders;

-- Format the OrderDate to a more readable format.
SELECT 
    OrderID,
    DATE_FORMAT(OrderDate, '%d %M %Y') AS Formatted_OrderDate
FROM Orders;

-- Concatenate FirstName and LastName to form a full name : 
SELECT 
    CONCAT(FirstName, ' ', LastName) AS FullName
FROM Customers;

-- Replace part of a string 
SELECT 
    REPLACE(FirstName, 'John', 'Jonathan') AS UpdatedName
FROM Customers;

-- Convert FirstName to uppercase and lastName to Lowercase:
SELECT 
    UPPER(FirstName) AS FirstNameUpper,
    LOWER(LastName) AS LastNameLower
FROM Customers;

-- Trim extra spaces from the Email field:
SELECT 
    TRIM(Email) AS TrimmedEmail
FROM Customers;

-- Calculate the running total of TotalAmount for each order:
SELECT
    OrderID, OrderDate, TotalAmount,
    SUM(TotalAmount) OVER (ORDER BY OrderDate) AS RunningTotal
FROM Orders;

-- Rank orders based on TotalAmount using the RANK() function:
SELECT 
    OrderID, TotalAmount,
    RANK() OVER (ORDER BY TotalAmount DESC) AS AmountRank
FROM Orders;

-- Assign a discount based on TotalAmount in Orders:
SELECT
    OrderID, TotalAmount,
    CASE
        WHEN TotalAmount >= 200 THEN '20% Discount'
        WHEN TotalAmount >= 150 THEN '10% Discount'
        ELSE 'No Discount'
    END AS Discount
FROM Orders;

-- Categorize employees' salaries as high, medium, or low:
SELECT 
    EmployeeID, Salary,
    CASE
        WHEN Salary >= 55000 THEN 'High'
        WHEN Salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory
FROM Employees;