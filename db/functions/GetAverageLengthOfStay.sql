---- zwraca srednią dlugosc pobytu wszystkich guestow
GO
CREATE OR ALTER FUNCTION [dbo].[GetAverageLengthOfStay] ()
RETURNS FLOAT
AS
BEGIN
DECLARE @totalStays INT
DECLARE @totalStayLength FLOAT
DECLARE @averageStayLength FLOAT

SELECT @totalStays = COUNT(*)
FROM reservation

SELECT @totalStayLength = SUM(DATEDIFF(day, start_date, end_date))
FROM reservation

IF (@totalStays > 0)
BEGIN
SET @averageStayLength = @totalStayLength / @totalStays
END
ELSE
SET @averageStayLength = 0

 RETURN ROUND(@averageStayLength, 2) 
END
GO


