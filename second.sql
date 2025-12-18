CREATE DATABASE Schooldata;

USE Schooldata;

-- Create a simple table
CREATE TABLE Student(
	ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Standard INT,
    Gender VARCHAR(10),
    Dateofbirth Date,
    Hobby VARCHAR(50)
);

-- Insert a single record
INSERT INTO Student ( ID , Name , Standard , Gender , Dateofbirth , Hobby )
VALUES ( 1 , 'Rahul' , 8 , 'male' , '2021-01-01' , 'Reading' );

-- Insert multiple records
INSERT INTO Student ( ID , Name , Standard , Gender , Dateofbirth , Hobby )
VALUES
( 2 , 'Sumit' , 9 , 'male' , '2021-01-02' , 'Dancing' ),
( 3 , 'Hiral' , 10 , 'female' , '2022-01-29' , 'Study' ),
( 4 , 'Hasti' , 5 , 'female' , '2023-06-10' , 'Reading' ),
( 5 , 'Dharmik' , 4 , 'male' , '2022-05-09' , 'Dancing' ),
( 6 , 'Janvi' , 3 , 'female' , '2024-04-22' , 'Study' ),
( 7 , 'Mital' , 6 , 'female' , '2025-02-23' , 'Reading' ),
( 8 , 'Hetal' , 2 , 'female' , '2026-01-12' , 'Dancing' ),
( 9 , 'Harsh' , 11 , 'male' , '2024-07-23' , 'Reading' ),
( 10 , 'Ansh' , 9 , 'male' , '2021-02-02' , 'Dancing' );

-- Select all record
SELECT * FROM Student;

-- Select specific columns
SELECT Name, Gender from Student;

-- Filter records using WHERE clause
SELECT * FROM Student WHERE Standard >7;

-- Sorting results (Descending order)
SELECT * FROM Student ORDER BY Standard DESC;

-- Counting records
SELECT COUNT(*) FROM Student WHERE Standard = 4 ;

-- Update Standard for a specific student
UPDATE Student
SET Standard = 12
WHERE ID =5 ;

-- Delete a specific record
DELETE FROM Student WHERE ID = 2;
