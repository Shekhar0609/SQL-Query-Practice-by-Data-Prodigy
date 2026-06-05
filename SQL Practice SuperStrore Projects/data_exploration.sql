--BEGINNER
--1.List the top 10 orders with the highest sales from the EachOrderBreakdown table.

USE SuperStoreMasterDB

SELECT * FROM EachOrderBreakdown

SELECT TOP 10 * FROM EachOrderBreakdown ORDER BY Sales DESC



--2.Show the number of orders for each product category in the EachOrderBreakdown table.

SELECT * FROM EachOrderBreakdown

SELECT Category,COUNT(*) AS NumberOfOrders FROM EachOrderBreakdown GROUP BY Category



--3.Find the total profit for each sub-category in the EachOrderBreakdown table.

SELECT * FROM EachOrderBreakdown

SELECT SubCategory, SUM(Profit) AS TotalProfit FROM EachOrderBreakdown GROUP BY SubCategory ORDER BY TotalProfit DESC



--Intermediate
--1.Identify the customer with the highest total sales across all orders.

SELECT * FROM OrdersList

SELECT * FROM EachOrderBreakdown

SELECT TOP 1 O.CustomerName, SUM(E.Sales) AS TotalSales FROM OrdersList O JOIN EachOrderBreakdown E ON O.OrderID=E.OrderID GROUP BY O.CustomerName ORDER BY TotalSales DESC 



--2.Find the month with the highest average sales in the OrdersList table.

SELECT * FROM OrdersList

SELECT * FROM EachOrderBreakdown


SELECT TOP 1 MONTH(O.OrderDate) AS MonthOrdered, AVG(E.Sales) AS AverageSales FROM OrdersList O JOIN EachOrderBreakdown E ON O.OrderID=E.OrderID GROUP BY MONTH(O.OrderDate) ORDER BY AverageSales DESC



--3.Find out the average quantity ordered by customers whose first name starts with an alphabet 's'?

SELECT * FROM OrdersList

SELECT * FROM EachOrderBreakdown


SELECT AVG(E.Quantity) AS AverageQuantity FROM OrdersList O JOIN EachOrderBreakdown E ON O.OrderID=E.OrderID WHERE O.CustomerName LIKE 'S%'

SELECT AVG(E.Quantity) AS AverageQuantity FROM OrdersList O JOIN EachOrderBreakdown E ON O.OrderID=E.OrderID WHERE LEFT(O.CustomerName, 1)='S'




--Advanced
--1.Find out how many new customers were acquired in the year 2014?

SELECT * FROM OrdersList

WITH CustWithFirstOrder2014 AS (
SELECT CustomerName, MIN(OrderDate) AS FirstOrderedDate FROM OrdersList GROUP BY CustomerName HAVING YEAR(MIN(OrderDate)) = '2014'
)

SELECT COUNT(*) AS NumberOfNewCustomers FROM CustWithFirstOrder2014


SELECT COUNT(*) AS NumberOfNewCustomers FROM (
SELECT CustomerName, MIN(OrderDate) AS FirstOrderedDate FROM OrdersList GROUP BY CustomerName HAVING YEAR(MIN(OrderDate)) = '2014'
) AS CustWithFirstOrder2014



--2.Calculate the percentage of total profit contributed by each sub-category to the overall profit.

SELECT * FROM OrdersList

SELECT * FROM EachOrderBreakdown

SELECT SUM(Profit) AS TotalProfit  FROM EachOrderBreakdown

SELECT 
SubCategory, 
SUM(Profit) AS SubCategoryTotalProfit,
SUM(Profit)/(SELECT SUM(Profit) AS TotalProfit  FROM EachOrderBreakdown) * 100 AS PercentageOfTotalContribution
FROM EachOrderBreakdown GROUP BY SubCategory


WITH SubCategoryTotalProfitTable AS (
SELECT 
SubCategory, 
SUM(Profit) AS SubCategoryTotalProfit
FROM EachOrderBreakdown GROUP BY SubCategory
) 
SELECT S.SubCategory, 
S.SubCategoryTotalProfit, 
S.SubCategoryTotalProfit/(SELECT SUM(Profit) AS TotalProfit  FROM EachOrderBreakdown) * 100 AS PercentageOfTotalContribution
FROM SubCategoryTotalProfitTable S



--3.Find the average sales per customer, considering only customers who have made more than one order.

SELECT * FROM OrdersList

SELECT * FROM EachOrderBreakdown

SELECT 
OL.CustomerName, 
COUNT(DISTINCT OL.OrderID) AS NumberOfOrders,
AVG(EOB.Sales) AS AverageSalesPerCustomer
FROM OrdersList OL 
JOIN EachOrderBreakdown EOB 
ON OL.OrderID=EOB.OrderID
GROUP BY OL.CustomerName
HAVING COUNT(DISTINCT OL.OrderID)>12


WITH AverageSalesPerCustomerTable AS (
SELECT 
OL.CustomerName, 
COUNT(DISTINCT OL.OrderID) AS NumberOfOrders,
AVG(EOB.Sales) AS AverageSalesPerCustomer
FROM OrdersList OL 
JOIN EachOrderBreakdown EOB 
ON OL.OrderID=EOB.OrderID
GROUP BY OL.CustomerName
)
SELECT CustomerName, NumberOfOrders, AverageSalesPerCustomer FROM AverageSalesPerCustomerTable WHERE NumberOfOrders>12



--4.Identify the top-performing subcategory in each category based on total sales. Include the sub-category name, total sales, and a ranking of sub-category within each category.

SELECT * FROM EachOrderBreakdown

SELECT Category, 
SubCategory, 
SUM(Sales) AS TotalSales,
RANK() OVER(PARTITION BY Category ORDER BY SUM(Sales) DESC) AS SubCategoryRank
FROM EachOrderBreakdown 
GROUP BY Category,SubCategory