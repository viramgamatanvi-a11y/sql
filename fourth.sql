CREATE DATABASE Studentsmarks;

USE Studentsmarks;

-- CReate a sample table
CREATE TABLE marks(
	ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Hindi INT,
    English INT,
    Science INT,
    Computer INT,
    Maths INT
);

-- INsert a single record
INSERT INTO marks(ID , Name , Hindi , English , Science , Computer , Maths )
VALUES (1 , 'Rahul' , 45 , 56 , 23 , 23, 56 );

-- Insert multiple records
INSERT INTO marks(ID , Name , Hindi , English , Science , Computer , Maths )
VALUES 
(2 , 'Sumit' , 48 , 45 , 78 , 24, 56 ),
(3 , 'Hiral' , 45 , 80 , 45 , 34, 67 ),
(4 , 'Anjali' , 24 , 24 , 78 , 24, 56 ),
(5 , 'Hina' , 45 , 45 , 75 , 24, 56 ),
(6 , 'HArsh' , 89 , 45 , 23 , 24, 45 ),
(7 , 'HAsti' , 45 , 89 , 78 , 24, 56 );

-- SElect all records
SELECT * FROM marks;

-- Select specific column
SELECT Name , English FROM marks;

-- Filter records using Where clause
SELECT * FROM marks WHERE English > 67;

-- Sorting results (Descending Order)
SELECT * FROM marks ORDER BY English DESC;

-- Counting records
SELECT COUNT(*) FROM marks WHERE English = 45;

-- Update English for a specific marks
UPDATE marks
SET English = 90
WHERE ID = 1;

-- Delete a specific record
DELETE FROM marks WHERE ID = 3;

