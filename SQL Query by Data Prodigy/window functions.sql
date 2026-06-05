USE CollegeDB


--AGREGATE FUNCTION WITH OVER FUNCTION IN PARTITION BY 
SELECT * FROM AllStudents

SELECT b.BranchName, AVG(s.MarksObtained)  AS 'AVG_Marks' FROM AllStudents s INNER JOIN Branch b ON s.BranchID=b.BranchID GROUP BY b.BranchName

SELECT s.FirstName, s.LastName, b.BranchName, s.MarksObtained,
AVG(s.MarksObtained)  OVER(PARTITION BY b.BranchName) AS 'AVG_Marks',
COUNT(*)  OVER(PARTITION BY b.BranchName) AS 'No_Of_Branch',
SUM(s.MarksObtained)  OVER(PARTITION BY b.BranchName) AS 'Total_Marks',
MAX(s.MarksObtained)  OVER(PARTITION BY b.BranchName) AS 'Max_Marks',
MIN(s.MarksObtained)  OVER(PARTITION BY b.BranchName) AS 'Min_Marks'
FROM AllStudents s INNER JOIN Branch b 
ON s.BranchID=b.BranchID



--VALUE WINDOW FUNCTIONS
SELECT * FROM AllStudents

SELECT b.BranchName, AVG(s.MarksObtained)  AS 'AVG_Marks' FROM AllStudents s INNER JOIN Branch b ON s.BranchID=b.BranchID GROUP BY b.BranchName

SELECT s.StudentID ,s.FirstName, s.LastName, b.BranchName, s.MarksObtained,
LAG(s.MarksObtained,3 , 0) OVER(ORDER BY s.MarksObtained) AS 'Prev Value',
LEAD(s.MarksObtained, 2, 0) OVER(ORDER BY s.MarksObtained) AS 'Next Value',
FIRST_VALUE(s.MarksObtained)  OVER(ORDER BY s.MarksObtained ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS 'FIRST_Mark_Value',
LAST_VALUE(s.MarksObtained)  OVER(ORDER BY s.MarksObtained ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS 'LAST_Marks_Value'
FROM AllStudents s INNER JOIN Branch b 
ON s.BranchID=b.BranchID



--ROWS BETWEEN
SELECT * FROM AllStudents

SELECT b.BranchName, AVG(s.MarksObtained)  AS 'AVG_Marks' FROM AllStudents s INNER JOIN Branch b ON s.BranchID=b.BranchID GROUP BY b.BranchName

SELECT s.FirstName, s.LastName, b.BranchName, s.MarksObtained,
SUM(s.MarksObtained)  OVER(PARTITION BY b.BranchName ORDER BY s.MarksObtained ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS 'Running_Total_Marks',
SUM(s.MarksObtained)  OVER(PARTITION BY b.BranchName ORDER BY s.MarksObtained ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS 'Total_Marks_By_Branch'
FROM AllStudents s INNER JOIN Branch b 
ON s.BranchID=b.BranchID


--RANKING WINDOW FUNCTIONS
--ROW_NUMBER(), RANK(), DENSE_RANK() FUNCTION

SELECT * FROM AllStudents

SELECT b.BranchName, AVG(s.MarksObtained)  AS 'AVG_Marks' FROM AllStudents s INNER JOIN Branch b ON s.BranchID=b.BranchID GROUP BY b.BranchName

SELECT s.FirstName, s.LastName, b.BranchName, s.MarksObtained,
ROW_NUMBER() OVER(PARTITION BY b.branchName ORDER BY s.MarksObtained DESC) AS 'ROW_Number',
RANK() OVER(PARTITION BY b.branchName ORDER BY s.MarksObtained DESC) AS 'RANK_Number',
DENSE_RANK() OVER(PARTITION BY b.branchName ORDER BY s.MarksObtained DESC) AS 'DENSE_RANK'
FROM AllStudents s INNER JOIN Branch b 
ON s.BranchID=b.BranchID



--NTILE() FUNCTION
--EXAMPLE: USING ODERS TABLE OF SAMPLE Superstore DB, find out the top 10 and bottom 10 percent customers bases on the profit

USE SuperStoreDB

SELECT * FROM Orders --WHERE [Customer Name]='Justin MacKendrick' 

SELECT [Customer Name],Profit, Segregation
FROM(
SELECT [Customer Name], SUM(Profit) AS 'Profit',
NTILE(10) OVER (ORDER BY SUM(Profit) DESC) AS 'Segregation'
FROM Orders
GROUP BY [Customer Name]) AS DerivedTable
WHERE Segregation=1 OR Segregation=10



