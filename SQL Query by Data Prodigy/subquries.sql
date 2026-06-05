USE CollegeDB


--Single Row Subquery
--Show the student name who is having the maximum marks in CS branch

SELECT * FROM AllStudents

SELECT s.StudentID ,s.FirstName, s.LastName, b.BranchName, MarksObtained
FROM AllStudents s INNER JOIN Branch b ON s.BranchID=b.BranchID 
WHERE b.BranchName='CSE' AND s.MarksObtained = (SELECT MAX(s.MarksObtained) FROM AllStudents s INNER JOIN Branch b ON s.BranchID=b.BranchID 
WHERE b.BranchName='CSE')



--for single row value
SELECT MAX(s.MarksObtained) AS 'MAXMarks'
FROM AllStudents s INNER JOIN Branch b ON s.BranchID=b.BranchID 
WHERE b.BranchName='CSE' AND s.MarksObtained = (
												SELECT MAX(s.MarksObtained) FROM AllStudents s INNER JOIN Branch b ON s.BranchID=b.BranchID 
												WHERE b.BranchName='CSE')


--Multiple Row Subquery

--Show the same of the students where the students count is a brach is three or fewer

SELECT * FROM AllStudents

SELECT * FROM Branch

SELECT FirstName, LastName, b.BranchName, MarksObtained
FROM AllStudents s INNER JOIN Branch b ON s.BranchID=b.BranchID 
WHERE b.BranchName IN (SELECT b.BranchName
						FROM AllStudents s INNER JOIN Branch b ON s.BranchID=b.BranchID 
						GROUP BY b.BranchName HAVING COUNT(*)<=3)


--Correlated Subquery

--find the students who have obtained marks higher than average marks obtained by studenta in he same branch

SELECT * FROM AllStudents

SELECT * FROM Branch

SELECT s1.StudentID ,s1.FirstName, s1.LastName, b1.BranchName, s1.MarksObtained
FROM AllStudents s1 INNER JOIN Branch b1 ON s1.BranchID=b1.BranchID 
WHERE s1.MarksObtained > (SELECT AVG(s2.MarksObtained)
							FROM AllStudents s2 INNER JOIN Branch b2 ON s2.BranchID=b2.BranchID WHERE b2.BranchName=b1.BranchName)

--inner subbquery for understanding
(SELECT b2.BranchName, AVG(s2.MarksObtained)
FROM AllStudents s2 INNER JOIN Branch b2 ON s2.BranchID=b2.BranchID GROUP BY b2.BranchName)