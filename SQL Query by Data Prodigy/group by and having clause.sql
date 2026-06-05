USE CollegeDB

SELECT * FROM AllStudents

SELECT Branch, AVG(MarksObtained) AS 'AVG' FROM AllStudents GROUP BY Branch HAVING AVG(MarksObtained) >850 , Branch='EE'