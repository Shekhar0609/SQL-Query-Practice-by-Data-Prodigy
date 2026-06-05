USE CollegeDB

CREATE TABLE Student(StudentID INT NOT NULL)

SELECT * FROM AllStudents

SELECT * FROM Branch


--ALTER TABLE AllStudents ADD BranchID INT NULL CONSTRAINT fkBranchID FOREIGN KEY REFERENCES Branch(BranchID)
--ALTER TABLE AllStudents ADD ProfessorId INT NULL
--ALTER TABLE AllStudents ADD ProfessorName VARCHAR(50) NULL
--ALTER TABLE AllStudents ADD StudentsProfessorID INT


/* INSERT INTO AllStudents(StudentID,FirstName, LastName, BranchID, Email) VALUES 
(18,'Amit', 'Desai', 100, 'amit@example.com'),
(19,'Shivam', 'Gupta', 100, 'shivam@example.com') */

--begin tran
--UPDATE AllStudents SET StudentsProfessorID=1  WHERE BranchID IN (104)
--commit

--ALTER TABLE AllStudents DROP COLuMN Branch

SP_HELP AllStudents

--INNER JOIN
SELECT * FROM AllStudents

SELECT * FROM Branch

SELECT s.StudentID, s.FirstName, s.LastName, s.BranchID, b.BranchName, b.Capacity  FROM AllStudents s INNER JOIN Branch b ON s.BranchID=b.BranchID


--LEFT JOIN
SELECT * FROM AllStudents

SELECT * FROM Branch

SELECT s.StudentID, s.FirstName, s.LastName, s.MarksObtained, s.BranchID, b.BranchName, b.Capacity FROM AllStudents s LEFT JOIN Branch b ON s.BranchID=b.BranchID

--RIGHT JOIN
SELECT * FROM AllStudents

SELECT * FROM Branch

SELECT s.StudentID, s.FirstName, s.LastName, s.MarksObtained, s.BranchID, b.BranchName, b.Capacity FROM AllStudents s RIGHT JOIN Branch b ON s.BranchID=b.BranchID


--FULL JOIN 
SELECT * FROM AllStudents

SELECT * FROM Branch

SELECT * FROM AllStudents s FULL OUTER JOIN BRANCH b ON s.BranchID=b.BranchID


--SELFF JOIN
SELECT * FROM AllStudents

SELECT * FROM Branch

SELECT s1.StudentsProfessorID, s2.ProfessorId, s1.FirstName, s2.ProfessorName FROM AllStudents s1 INNER JOIN AllStudents s2 ON s1.StudentsProfessorID=s2.ProfessorId


--CROSS JOIN
SELECT * FROM AllStudents

SELECT * FROM Branch

SELECT * FROM AllStudents CROSS JOIN Branch