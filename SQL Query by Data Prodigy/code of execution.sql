USE CollegeDB

SELECT * FROM AllStudents

SELECT MarksObtained,  COUNT(*) AS 'NoOfCount' 
FROM AllStudents 
WHERE MarksObtained>=800 
GROUP BY MarksObtained 
HAVING COUNT(*)>=2 
ORDER BY NoOfCount DESC


USE SuperStoreDB

SELECT * FROM Orders

SELECT State, Category, SUM(Profit) AS 'Sum'
FROM Orders 
WHERE Quantity>2
GROUP BY State, Category
HAVING SUM(Profit)<0