USE CollegeDB

SELECT * FROM AllStudents

SELECT COUNT(StudentID) AS 'No. Of Records' FROM AllStudents

SELECT COUNT(Email) AS 'No. Of Records' FROM AllStudents

SELECT COUNT(*) AS 'No. Of Records' FROM AllStudents



SELECT SUM(MarksObtained) AS 'Sum' FROM AllStudents


SELECT AVG(MarksObtained) AS 'Average Marks' FROM AllStudents


SELECT MAX(MarksObtained) AS 'Maximum Marks' FROM AllStudents


SELECT MIN(MarksObtained) AS 'Minimum Marks' FROM AllStudents
