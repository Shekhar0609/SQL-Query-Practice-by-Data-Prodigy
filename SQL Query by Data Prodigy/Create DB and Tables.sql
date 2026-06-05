ALTER DATABASE College MODIFY NAME=CollegeDB

USE [CollegeDB]

CREATE TABLE StudentTable (
StudentId INT,
FirstName VARCHAR(50),
LastNamr VARCHAR(50),
Branch VARCHAR(20),
Semester INT
)

SP_HELP StudentTable

INSERT INTO StudentTable VALUES
(101, 'Amit', 'Sharma', 'EE', 5),
(102, 'Ravi', 'Mehta', 'IT', 3),
(103, 'Vivek', 'Sharma', 'ME', 7)


ALTER TABLE StudentTable ADD EmailId VARCHAR(100), State VARCHAR(29), ContactNumber INT

ALTER TABLE StudentTable DROP COLUMN EmailId, Address, State

ALTER TABLE StudentTable ALTER COLUMN LastName

SELECT * FROM StudentTable

ALTER TABLE StudentTable ADD EmailID VARCHAR(30)

INSERT INTO StudentTable(StudentId, LastNamr) VALUES
(104, 'Goyal')

EXEC sp_rename 'StudentTable.LastNamr', 'LastName', 'COLUMN';

UPDATE StudentTable SET EmailID='sharma@gmil.com', FirstName='Bobby' WHERE LastName='Sharma'

UPDATE StudentTable SET EmailID='abc@gmail.com', FirstName='Ajay' WHERE StudentId IN (103)

DROP TABLE StudentTable

CREATE TABLE Student (
StudentId INT CONSTRAINT pKStudentID PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50),
BranchID INT CONSTRAINT fkBranchID FOREIGN KEY REFERENCES Branch(BranchID),
Email VARCHAR(50) CONSTRAINT unqEmail UNIQUE
)

CREATE TABLE Branch(
BranchID INT CONSTRAINT pkBranchID PRIMARY KEY,
BranchName VARCHAR(10),
Capacity INT CONSTRAINT defCapacity DEFAULT 200
)


INSERT INTO Branch VALUES
(100, 'EE', 200),
(101, 'CSE', 200),
(102, 'ECE', 150),
(103, 'ME', 150)


INSERT INTO Branch(BranchID, BranchName) VALUES (104,'IT')

ALTER TABLE Branch ADD CONSTRAINT chkBranchName CHECK (BranchName IN ('EE','CSE','ECE','ME','IT'))

INSERT INTO Branch VALUES (105, 'DATA', 100)


INSERT INTO Student VALUES
(1, 'Manav', 'Sharma', 100, 'manish@test.com'),
(2, 'Manish', 'Mehta', 101, 'manav@test.com'),
INSERT INTO Student VALUES (3, 'Bobby', 'Pal', 104, 'bobby@test.com'),
INSERT INTO Student VALUES (1, 'Manav', 'Sharma', 103, 'manish@test.com')

INSERT INTO Student (StudentId, FirstName, BranchID) VALUES (4, 'Mohan', 100)
INSERT INTO Student (StudentId, FirstName, BranchID, Email) VALUES (5, 'Amit', 102, 'amit@test.com')

SELECT * FROM Student

SELECT * FROM Branch
