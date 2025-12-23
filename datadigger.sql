-- Create a new database
CREATE DATABASE Diggerdatabase;

-- Use the Created database
USE Diggerdatabase;

-- Create a Customers Table
CREATE TABLE Customers (
	CustomersID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Address VARCHAR(100)
);

-- Insert data into the table
INSERT INTO Customers (CustomersID, Name, Email, Address)
VALUES
(1, 'Rahul', 'rahul@gmail.com', 'House No 12, MG Road, Connaught Place, Delhi'),
(2, 'Alice', 'alice@gmail.com', 'Flat 5B, Shanti Nagar, Satellite, Ahmedabad'),
(3, 'Amit', 'amit@gmail.com', 'Plot No 22, Andheri East, Mumbai'),
(4, 'Neha', 'neha@gmail.com', 'Bungalow 7, Vaishali Nagar, Jaipur'),
(5, 'Karan', 'karan@gmail.com', 'Shop No 3, FC Road, Shivaji Nagar, Pune');

-- Select all records
SELECT * FROM Customers;

-- Update a customer's address
UPDATE Customers 
SET Address = 'C wing Iskon heights alap main road , Rajkot'
WHERE CustomersID = 2;

-- Delete a customer using their CustomersID
DELETE FROM Customers 
WHERE CustomersID = 3;

-- Display all customers whose name is 'Alice'
SELECT * FROM Customers 
WHERE Name = 'Alice';

-- Create a Order Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomersID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomersID) REFERENCES Customers(CustomersID)
);

-- Insert data into the table
INSERT INTO Orders (OrderID, CustomersID, OrderDate, TotalAmount)
VALUES
(101, 1, '2024-01-10', 2500.50),
(102, 2, '2024-01-12', 1800.00),
(103, 4, '2025-12-15', 3200.75),
(104, 5, '2024-01-18', 1500.25),
(105, 1, '2025-12-20', 4200.00);

-- Select all records
SELECT * FROM Orders;

-- retrieve all orders made by a specific customer
SELECT * FROM Orders 
WHERE CustomersID=1;

-- Update an order's total amount
UPDATE Orders 
SET TotalAmount = 65000.00 
WHERE OrderID = 101;

-- Delete an order using its OrderID
DELETE FROM Orders WHERE OrderID = 102;

-- retrieve orders placed in the last 30 days
SELECT * FROM Orders
WHERE OrderDate >= current_date() - INTERVAL 30 DAY;

-- retrieve the highest, lowest, and average order amount using aggregate functions
SELECT 
    MAX(TotalAmount) AS Highest_Order_Amount,
    MIN(TotalAmount) AS Lowest_Order_Amount,
    AVG(TotalAmount) AS Average_Order_Amount
FROM Orders;

-- Create a Products Table
CREATE TABLE Products(
	ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL (10,2),
    Stock INT
);

-- Insert data into the table
INSERT INTO Products (ProductID, ProductName, Price, Stock)
VALUES
(1, 'Laptop', 55000.00, 10),
(2, 'Mobile Phone', 25000.00, 25),
(3, 'Headphones', 1500.00, 50),
(4, 'Keyboard', 1200.00, 40),
(5, 'Mouse', 800.00, 60);

-- Select all records
SELECT * FROM Products;

-- retrieve all products sorted by price in descending order
SELECT * FROM Products
ORDER BY Price DESC;

-- Update the price of a specific product
UPDATE Products
SET Price = 60000.00
WHERE ProductID = 1;

-- Delete a product if it's out of stock
DELETE FROM Products
WHERE Stock = 0;

-- retrieve products whose price is between 500 and 2000
SELECT * FROM Products
WHERE Price BETWEEN 500 AND 2000;

-- retrieve the most expensive and cheapest product using MAX() and MIN()
SELECT 
    MAX(Price) AS Most_Expensive_Product,
    MIN(Price) AS Cheapest_Product
FROM Products;

-- Create a OrderDetails Table
CREATE TABLE OrderDetails(
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    SubTotal DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert data into the table
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, SubTotal)
VALUES
(1, 101, 1, 1, 60000.00),   
(2, 101, 3, 2, 3000.00),   
(3, 103, 2, 1, 25000.00),  
(4, 104, 4, 1, 1200.00),    
(5, 105, 5, 3, 2400.00);

-- Select all records
SELECT * FROM OrderDetails;

-- retrieve all order details for a specific order
SELECT * FROM OrderDetails
WHERE OrderID = 101;

-- Calculate the total revenue generated from all orders using SUM()
SELECT SUM(SubTotal) AS Total_Revenue
FROM OrderDetails;

-- retrieve the top 3 most ordered products
SELECT ProductID, SUM(Quantity) AS Total_Quantity_Ordered
FROM OrderDetails
GROUP BY ProductID
ORDER BY Total_Quantity_Ordered DESC
LIMIT 3;

-- Count how many times a specific product has been sold using COUNT()
SELECT COUNT(*) AS times_sold
FROM OrderDetails
WHERE ProductID = 3;