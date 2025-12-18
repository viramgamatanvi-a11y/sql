CREATE DATABASE Librarydatabase;

USE Librarydatabase;

-- Create a sample table
CREATE TABLE library(
	BookID INT PRIMARY KEY,
    BookName VARCHAR(50),
    StudentName VARCHAR(50),
    ReturnDate date
);

-- Insert a single record
INSERT INTO library(BookID , BookName , StudentName , ReturnDate )
VALUES (1 , 'Python' , 'Rahul' , '2021-11-12' );

-- Insert a multiple records
INSERT INTO library(BookID , BookName , StudentName , ReturnDate )
VALUES
(2 , 'datascience' , 'Mihir' , '2021-02-11' ),
(3 , 'science' , 'Anuj' , '2021-04-11' ),
(4 , 'Maths' , 'Hiral' , '2021-04-03' ),
(5 , 'Hindi' , 'Kiran' , '2027-04-11' );

-- Select all records
SELECT * FROM library;

-- Select specific column
SELECT BookName , ReturnDate FROM library;

-- Filter records using WHERE clause
SELECT * FROM library WHERE ReturnDate > 2027-04-11;

-- Sorting result (Descending Order)
SELECT * FROM library ORDER BY ReturnDate DESC;

-- Counting records
SELECT COUNT(*) FROM library WHERE BookName = 'Python';

-- Update BookName for a specific library
UPDATE library 
SET BookID = 7
WHERE BookID = 2;

-- Delete a specific record
DELETE FROM library WHERE BookID = 3;
