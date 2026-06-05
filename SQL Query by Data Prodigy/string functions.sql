USE CollegeDB

SELECT * FROM AllStudents

SELECT FirstName, LastName ,CONCAT(FirstName,' ', LastName) AS 'FullName' FROM AllStudents

SELECT PhoneNo ,LEN(PhoneNo) AS PhoneNumberLength FROM AllStudents

SELECT FirstName, LastName, UPPER(CONCAT(FirstName,' ', LastName)) AS 'UppercaseFullName' FROM AllStudents

SELECT FirstName, LastName, LOWER(CONCAT(FirstName,' ', LastName)) AS 'LowercaseFullName' FROM AllStudents

SELECT Email, SUBSTRING(Email, 0, CHARINDEX('@example.com',Email)) as 'SubStringUserID' FROM AllStudents

SELECT Email, REPLACE(Email,'.','') as 'REPLACED' FROM AllStudents

SELECT Email, CHARINDEX('@example.com',Email) as 'CHARINDEX' FROM AllStudents

SELECT FirstName, LTRIM(FirstName) as 'LeftTrimmed' FROM AllStudents

SELECT LastName, RTRIM(LastName) as 'RightTrimmed' FROM AllStudents

SELECT Email, LEFT(Email, 6) as 'LeftPart' FROM AllStudents

SELECT Email, RIGHT(Email, 10) as 'RightPart' FROM AllStudents
