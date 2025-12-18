CREATE DATABASE Shopdatabase;

USE Shopdatabase;

-- Create a sample table
CREATE TABLE clothes (
    CustomerId INT PRIMARY KEY,
    Name VARCHAR(50),
    Phone VARCHAR(15),
    Gender VARCHAR(10)
);

-- Insert a single record
INSERT INTO clothes (CustomerId , Name , Phone , Gender) 
VALUES (1, 'Rahul' , '1234567897' , 'Male');

-- Insert multiple records
INSERT INTO clothes (CustomerId , Name , Phone , Gender) 
VALUES 
(2, 'Hiral' , '23457596' , 'Female'),
(3, 'Sumit' , '65784353' , 'Male');

-- Select all records
SELECT * FROM clothes;

-- Select specific columns
SELECT Name, Gender FROM clothes;

-- Filter records using WHERE clause
SELECT * FROM clothes WHERE CustomerId > 2;

-- Sorting results (Descending Order)
SELECT * FROM clothes ORDER BY Phone DESC;

-- Counting records
SELECT COUNT(*) FROM clothes WHERE Name = 'Hiral';

-- Update salary for a specific employee
UPDATE clothes 
SET CustomerId = 5 
WHERE  CustomerId= 2;

-- Delete a specific record
DELETE FROM clothes WHERE CustomerId = 1;

