
USE CollegeDB

SELECT * FROM Branch

SELECT * FROM Student

exec sp_rename 'dbo.Student', 'AllStudents'

SELECT * FROM AllStudents

CREATE TABLE dbo.AllStudents (
StudentID INT NOT NULL,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Branch VARCHAR(100) NULL,
Email VARCHAR(100) NULL, 
PhoneNo VARCHAR(20) NULL,
MarksObtained INT NULL
)

EXEC sp_rename 'AllStudents.StundenID', 'StudentID'

INSERT [dbo].[AllStudents] ([StudentID], [FirstName], [LastName], [Branch], [Email], [PhoneNo], [MarksObtained]) VALUES (1, N'Aarav', N'Kumar', N'ECE', N'aarav.kumar@example.com', N'1234567890', 800)
INSERT [dbo].[AllStudents] ([StudentID], [FirstName], [LastName], [Branch], [Email], [PhoneNo], [MarksObtained]) VALUES (2, N'Aditi', N'Sharma', N'CS', N'aditi.sharma@example.com', NULL, 900)
INSERT [dbo].[AllStudents] ([StudentID], [FirstName], [LastName], [Branch], [Email], [PhoneNo], [MarksObtained]) VALUES (3, N'Advait', N'Gupta', N'EE', NULL, N'9876543210', 920)
INSERT [dbo].[AllStudents] ([StudentID], [FirstName], [LastName], [Branch], [Email], [PhoneNo], [MarksObtained]) VALUES (4, N'Aishwarya', N'Singh', N'ME', N'aishwarya.singh@example.com', N'9988776655', 750)
INSERT [dbo].[AllStudents] ([StudentID], [FirstName], [LastName], [Branch], [Email], [PhoneNo], [MarksObtained]) VALUES (5, N'Akash', N'Verma', N'IT', NULL, NULL, 820)
INSERT [dbo].[AllStudents] ([StudentID], [FirstName], [LastName], [Branch], [Email], [PhoneNo], [MarksObtained]) VALUES (6, N'Ananya', N'Choudhary', N'ECE', N'ananya.choudhary@example.com', N'9090909090', 930)
INSERT [dbo].[AllStudents] ([StudentID], [FirstName], [LastName], [Branch], [Email], [PhoneNo], [MarksObtained]) VALUES (7, N'Aniket', N'Yadav', N'CS', N'aniket.yadav@example.com', NULL, 850)
INSERT [dbo].[AllStudents] ([StudentID], [FirstName], [LastName], [Branch], [Email], [PhoneNo], [MarksObtained]) VALUES (8, N'Anisha', N'Shah', N'EE', NULL, N'9999999999', 780)
INSERT [dbo].[AllStudents] ([StudentID], [FirstName], [LastName], [Branch], [Email], [PhoneNo], [MarksObtained]) VALUES (9, N'Anuj', N'Gupta', N'ME', N'anuj.gupta@example.com', N'8888888888', 890)
INSERT [dbo].[AllStudents] ([StudentID], [FirstName], [LastName], [Branch], [Email], [PhoneNo], [MarksObtained]) VALUES (10, N'Arjun', N'Rao', N'IT', NULL, NULL, 760)
INSERT [dbo].[AllStudents] ([StudentID], [FirstName], [LastName], [Branch], [Email], [PhoneNo], [MarksObtained]) VALUES (11, N'Aryan', N'Patel', N'ECE', N'aryan.patel@example.com', N'7777777777', 810)
INSERT [dbo].[AllStudents] ([StudentID], [FirstName], [LastName], [Branch], [Email], [PhoneNo], [MarksObtained]) VALUES (12, N'Ayush', N'Nair', N'CS', N'ayush.nair@example.com', NULL, 920)
INSERT [dbo].[AllStudents] ([StudentID], [FirstName], [LastName], [Branch], [Email], [PhoneNo], [MarksObtained]) VALUES (13, N'Bhavya', N'Deshpande', N'EE', NULL, N'7777777777', 930)
INSERT [dbo].[AllStudents] ([StudentID], [FirstName], [LastName], [Branch], [Email], [PhoneNo], [MarksObtained]) VALUES (14, N'Chetan', N'Raj', N'ME', N'chetan.raj@example.com', N'8765432109', 870)
INSERT [dbo].[AllStudents] ([StudentID], [FirstName], [LastName], [Branch], [Email], [PhoneNo], [MarksObtained]) VALUES (15, N'Daksh', N'Mehta', N'CS', N'daksh.mehta@example.com', NULL, 920)
INSERT [dbo].[AllStudents] ([StudentID], [FirstName], [LastName], [Branch], [Email], [PhoneNo], [MarksObtained]) VALUES (16, N'Diya', N'Sinha', N'EE', N'diya.sinha@example.com', N'7654321098', 890)
INSERT [dbo].[AllStudents] ([StudentID], [FirstName], [LastName], [Branch], [Email], [PhoneNo], [MarksObtained]) VALUES (17, N'Tanvi', N'Rao', N'ME', N'tanvi.rao@example.com', N'9090909090', 850)