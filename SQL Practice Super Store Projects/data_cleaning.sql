--Q1 Establish the relationship between the tables as per the ER diagram.

USE SuperStoreMasterDB

SELECT TOP (10) * FROM OrdersList

SP_HELP OrdersList


ALTER TABLE dbo.OrdersList 
ADD CONSTRAINT pk_orderID PRIMARY KEY (OrderID)


ALTER TABLE dbo.OrdersList 
ALTER COLUMN OrderID nvarchar(255) NOT NULL

SELECT *
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = 'EachOrderBreakdown';

SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES;


ALTER TABLE EachOrderBreakdown 
ALTER COLUMN OrderID nvarchar(255) NOT NULL

ALTER TABLE EachOrderBreakdown 
ADD CONSTRAINT fk_orderID FOREIGN KEY(OrderID) REFERENCES OrdersList(OrderID)


--Q2. Split City State Country into 3 individual columns namely ‘City’, ‘State’, ‘Country’.

SELECT* FROM OrdersList

SELECT* FROM EachOrderBreakdown

ALTER TABLE OrdersList 
ADD 
City  nvarchar(255) NULL,
State nvarchar(255) NULL,
Country nvarchar(255) NULL

ALTER TABLE OrdersList DROP COLUMN [City State Country]

SELECT [City State Country], PARSENAME(REPLACE([City State Country], ',', '.'),	 3) AS COUNTRY FROM OrdersList


SELECT [City State Country], cty.value as City, s.value as State, cntry.value as Country  FROM OrdersList o
CROSS APPLY STRING_SPLIT([City State Country], ',', 1) cty
CROSS APPLY STRING_SPLIT([City State Country], ',', 1) s
CROSS APPLY STRING_SPLIT([City State Country], ',', 1) cntry
WHERE cty.ordinal=1 and s.ordinal=2 and cntry.ordinal=3


UPDATE OrdersList 
SET 
Country=PARSENAME(REPLACE([City State Country], ',', '.'),1),
State=PARSENAME(REPLACE([City State Country], ',', '.'),2),
City=PARSENAME(REPLACE([City State Country], ',', '.'),	 3)


UPDATE o
SET Country=LTRIM(RTRIM(s.value))
FROM OrdersList o
CROSS APPLY STRING_SPLIT([City State Country], ',', 1) s
WHERE ordinal=3



--Q3. Add a new Category Column using the following mapping as per the first 3 characters in the Product Name Column:
--TEC- Technology
--OFS – Office Supplies
--FUR - Furniture 


SELECT* FROM OrdersList

SELECT* FROM EachOrderBreakdown

ALTER TABLE dbo.EachOrderBreakdown ALTER COLUMN Category NVARCHAR(255) NOT NULL

SELECT
ORDERid,
ProductName,
CASE
WHEN LEFT(ProductName, 3)='OFS' then 'Office Appliance'
WHEN LEFT(ProductName, 3)='FUR' then 'Furniture'
WHEN LEFT(ProductName, 4)='TECH' then 'Technology'
END AS CATEGORY
FROM EachOrderBreakdown

UPDATE EachOrderBreakdown SET 
Category=
CASE
WHEN LEFT(ProductName, 3)='OFS' then 'Office Appliance'
WHEN LEFT(ProductName, 3)='FUR' then 'Furniture'
WHEN LEFT(ProductName, 4)='TECH' then 'Technology'
END

--Q4. Delete the first 4 characters from the ProductName Column.

SELECT* FROM OrdersList

SELECT* FROM EachOrderBreakdown

SELECT
ProductName,
SUBSTRING(ProductName, 5, LEN(ProductName)-4)
FROM EachOrderBreakdown

SELECT
ProductName,
CASE
WHEN ProductName LIKE 'OFS-%' THEN SUBSTRING(ProductName, 5, LEN(ProductName)-4)
WHEN ProductName LIKE 'FUR-%' THEN SUBSTRING(ProductName, 5, LEN(ProductName)-4)
WHEN ProductName LIKE 'TECH-%' THEN SUBSTRING(ProductName, 6, LEN(ProductName)-5)
END AS AfterRemovedProductCode
FROM EachOrderBreakdown

UPDATE EachOrderBreakdown SET ProductName=
CASE
WHEN ProductName LIKE 'OFS-%' THEN SUBSTRING(ProductName, 5, LEN(ProductName)-4)
WHEN ProductName LIKE 'FUR-%' THEN SUBSTRING(ProductName, 5, LEN(ProductName)-4)
WHEN ProductName LIKE 'TECH-%' THEN SUBSTRING(ProductName, 6, LEN(ProductName)-5)
END


--Q5. Remove duplicate rows from EachOrderBreakdown table, if all column values are matching


SELECT* FROM OrdersList

SELECT* FROM EachOrderBreakdown


WITH DuplicateRows AS (
SELECT *,
ROW_NUMBER() OVER(PARTITION BY OrderID,ProductName,Discount,Sales,Profit,Quantity,SubCategory,Category ORDER BY OrderID) AS RowNumber
FROM EachOrderBreakdown
) DELETE FROM DuplicateRows WHERE RowNumber>1



--Q6. Replace blank with NA in OrderPriority Column in OrdersList table


SELECT* FROM OrdersList

SELECT* FROM EachOrderBreakdown

SELECT* FROM OrdersList WHERE OrderPriority=''

UPDATE OrdersList SET OrderPriority='NA' WHERE OrderPriority=''
