USE CollegeDB

SELECT * FROM AllStudents

SELECT * FROM AllStudents WHERE BRANCH='CS'

SELECT * FROM AllStudents WHERE Branch<>'CS'

SELECT * FROM AllStudents WHERE MarksObtained>900

SELECT * FROM AllStudents WHERE MarksObtained<800

SELECT * FROM AllStudents WHERE MarksObtained>=900

SELECT * FROM AllStudents WHERE MarksObtained<=900

SELECT * FROM AllStudents WHERE BRANCH='CS' AND MarksObtained>=900

SELECT * FROM AllStudents WHERE BRANCH='CS' OR MarksObtained>=900

SELECT * FROM AllStudents WHERE NOT Branch='CS'

SELECT * FROM AllStudents WHERE Branch<>'CS'