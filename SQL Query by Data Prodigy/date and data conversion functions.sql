USE SuperStoreDB

SELECT * FROM Orders

SELECT GETDATE() AS 'CurrentDateTime'

SELECT [Order Date], DATEPART(YEAR, [Order Date]) AS 'YearValue' FROM Orders

SELECT [Order Date], DATEPART(MONTH, [Order Date]) AS 'MonthValue' FROM Orders

SELECT [Order Date], DATEPART(DAY, [Order Date]) AS 'DayValue' FROM Orders

SELECT [Order Date], DATEPART(WEEKDAY, [Order Date]) AS 'WeekDayValue' FROM Orders

SELECT DATEPART(HOUR, GETDATE()) AS 'HourValue'

SELECT DATEPART(MINUTE, GETDATE()) AS 'MinutesValue'

SELECT DATEPART(SECOND, GETDATE()) AS 'SecondsValue'

SELECT DATEPART(MILLISECOND, GETDATE()) AS 'MilliSeccondsValue'

SELECT DATEPART(MICROSECOND, GETDATE()) AS 'MicreSecondsValue'

SELECT DATEPART(NANOSECOND, GETDATE()) AS 'NanoSecondsValue'



SELECT [Order ID],[Order Date], [Ship Date], DATEDIFF(DAY,[Order Date], [Ship Date]) AS 'DayDefference', DATEDIFF(MONTH,[Order Date], [Ship Date]) AS 'MonthDefference' FROM Orders


SELECT [Order ID],[Order Date], [Ship Date], DATEADD(DAY,2, [Order Date]) AS 'FutureDay', DATEADD(MONTH,1,[Order Date]) AS 'FutureMonth' FROM Orders


SELECT [Order ID],[Order Date], [Ship Date], EOMONTH([Ship Date]) AS 'ShippedEndOfTheMonthDay' FROM Orders



SELECT [Order Date], YEAR([Order Date]) AS 'YearValue' FROM Orders

SELECT [Order Date], MONTH([Order Date]) AS 'MonthValue' FROM Orders

SELECT [Order Date], DAY([Order Date]) AS 'DayValue' FROM Orders

SELECT [Order ID],[Order Date], CONVERT(VARCHAR(20), [Order Date], 101) AS 'ConvertFunction' FROM Orders

