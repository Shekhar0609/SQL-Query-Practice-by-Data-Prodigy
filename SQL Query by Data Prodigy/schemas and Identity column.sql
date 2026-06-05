USE [CollegeDB]

CREATE SCHEMA Engineering

CREATE SCHEMA Management

CREATE TABLE Engineering.test (
testID INT
)

CREATE TABLE Management.test (
testID INT
)

SELECT * FROM Engineering.test

CREATE TABLE Engineering.test1 (
testID INT
)


ALTER SCHEMA Management TRANSFER Engineering.test1


CREATE TABLE Sports
(
SportsID INT IDENTITY(100,1) NOT NULL,
SportsName VARCHAR(50) NOT NULL,
EnrolledStudentID INT
)

INSERT INTO Sports(SportsName, EnrolledStudentID) VALUES
('Hockey', 1),
('Cricket',2),
('Basket Ball',3)

SELECT * FROM Sports