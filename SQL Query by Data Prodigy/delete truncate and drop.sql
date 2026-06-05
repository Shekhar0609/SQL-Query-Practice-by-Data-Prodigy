USE [CollegeDB]


SELECT * FROM Sports

--DELETE
DELETE FROM Sports WHERE SportsID=101

INSERT INTO Sports VALUES 
('Hockey', 1),
('Basket Ball',2),
('Volley Ball',3),
('Base Ball',4)


--TRUNCATE
TRUNCATE TABLE Sports

--DROP TABLE
DROP TABLE Sports
