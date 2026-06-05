USE CollegeDB

SELECT * FROM AllStudents

SELECT * FROM AllStudents WHERE MarksObtained BETWEEN 900 AND 1000

SELECT * FROM AllStudents WHERE MarksObtained NOT BETWEEN 900 AND 1000



SELECT * FROM AllStudents WHERE Branch IN ('IT','CS','EE')

SELECT * FROM AllStudents WHERE Branch NOT IN ('IT','CS','EE')



SELECT * FROM AllStudents WHERE Email IS NULL

SELECT * FROM AllStudents WHERE Email IS NOT NULL


SELECT * FROM AllStudents WHERE FirstName LIKE 'A%'

SELECT * FROM AllStudents WHERE FirstName LIKE '%A'

SELECT * FROM AllStudents WHERE FirstName LIKE '%YA'

SELECT * FROM AllStudents WHERE FirstName LIKE 'A%YA'


SELECT * FROM AllStudents WHERE Branch LIKE '_E'


SELECT * FROM AllStudents ORDER BY MarksObtained DESC

SELECT * FROM AllStudents ORDER BY MarksObtained DESC, FirstName ASC

SELECT TOP 5 * FROM AllStudents ORDER BY MarksObtained DESC, FirstName ASC

