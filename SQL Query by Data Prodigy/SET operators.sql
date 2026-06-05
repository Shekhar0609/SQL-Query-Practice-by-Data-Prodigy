CREATE DATABASE Employee

USE Employee

/* CREATE TABLE Employees (
EmployeeID INT NULL,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NULL,
Department VARCHAR(50) NOT NULL,
EMail VARCHAR(50) NULL
) */


/* CREATE TABLE Contractors (
ContractorID INT NULL,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NULL,
Department VARCHAR(50) NOT NULL,
EMail VARCHAR(50) NULL,
) */

SELECT * FROM Employees

SELECT * FROM Contractors

/* INSERT INTO Employees VALUES 
(1001, 'Amit', 'Sharma', 'HR', 'amit.sharma@example.com'),
(1002, 'Neha', 'Mehta', 'Finance', 'neha.mehta@example.com'),
(1003, 'Ravi', 'Singh', 'IT', 'ravi.singh@example.com'),
(2004, 'Oliver', 'Clark', 'Finance', 'oliver.clark@example.com'),
(2004, 'John', 'Paul', 'IT', 'john.paul@example.com')
*/


/* INSERT INTO Contractors VALUES 
(2001, 'Samanth', 'Brown', 'IT', 'samantha.brown.ext@example.com'),
(2002, 'Alex', 'Lee', 'HR', 'alex.lee.ext@example.com'),
(2003, 'Oliver', 'Clark', 'Finance', 'oliver.clark.ext@example.com'),
(2004, 'John', 'Paul', 'IT', 'john.paul.ext@example.com')
*/

SELECT * FROM Employees

SELECT * FROM Contractors



--UNION
SELECT * FROM Employees

SELECT * FROM Contractors

SELECT EmployeeID, FirstName, LastName,Department FROM Employees
UNION
SELECT ContractorID, FirstName, LastName,Department FROM Contractors



--UNION ALL
SELECT * FROM Employees

SELECT * FROM Contractors

SELECT EmployeeID, FirstName, LastName,Department FROM Employees
UNION ALL
SELECT ContractorID, FirstName, LastName,Department FROM Contractors



--INSERSECT
SELECT * FROM Employees

SELECT * FROM Contractors

SELECT EmployeeID, FirstName, LastName,Department FROM Employees
INTERSECT
SELECT ContractorID, FirstName, LastName,Department FROM Contractors


--EXCEPT OR MINUS
SELECT * FROM Employees

SELECT * FROM Contractors

SELECT EmployeeID, FirstName, LastName,Department FROM Employees
EXCEPT
SELECT ContractorID, FirstName, LastName,Department FROM Contractors 