USE CollegeDB

SELECT * FROM AllStudents s INNER JOIN Branch b ON s.BranchID=b.BranchID

SELECT FirstName, LastName,b.BranchName, ProfessorName,
CASE
WHEN MarksObtained>900 AND MarksObtained<=1000 THEN 'Excellent'
WHEN MarksObtained>800 AND MarksObtained<=900 THEN 'Average'
WHEN MarksObtained>700 AND MarksObtained<=800 THEN 'Paassed'
ELSE 'Poor Marks'
END AS 'Marks Status'
FROM AllStudents s FULL JOIN Branch b ON s.BranchID=b.BranchID


SELECT s.FirstName, s.LastName,b.BranchName, s.ProfessorName,
CASE
WHEN MarksObtained>900 AND MarksObtained<=1000 THEN 'Excellent'
WHEN MarksObtained>800 AND MarksObtained<=900 THEN 'Average'
WHEN MarksObtained>700 AND MarksObtained<=800 THEN 'Paassed'
ELSE 'Poor Marks'
END AS 'Marks Status'
FROM AllStudents s FULL JOIN Branch b ON s.BranchID=b.BranchID