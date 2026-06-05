USE CollegeDB

SELECT StudentID, FirstName, Email, PhoneNo, COALESCE(Email, PhoneNo, FirstName) As 'ContactDetails' FROM AllStudents

SELECT STRING_AGG(FirstName, ', ') AS 'AllFirstNames' FROM AllStudents

