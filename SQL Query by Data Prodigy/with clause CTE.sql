USE CollegeDB

SELECT * FROM AllStudents

SELECT b.BranchName, AVG(s1.MarksObtained) AS 'AVGmarks' FROM AllStudents s1 INNER JOIN Branch b ON s1.BranchID=b.BranchID GROUP BY b.BranchName


WITH cte_avgmarks AS 
(
SELECT b.BranchID, AVG(s1.MarksObtained) AS 'AVGmarks' FROM AllStudents s1 INNER JOIN Branch b ON s1.BranchID=b.BranchID GROUP BY b.BranchID
)
SELECT s2.StudentID, s2.FirstName, s2.LastName, b2.BranchName,s2.MarksObtained, c.AVGmarks
FROM AllStudents s2 
INNER JOIN Branch b2 ON s2.BranchID=b2.BranchID 
INNER JOIN cte_avgmarks c ON b2.BranchID=c.BranchID WHERE s2.MarksObtained> c.AVGmarks