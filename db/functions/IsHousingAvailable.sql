--Sprawdzenie, czy dany domek jest dostępny w danych datach.
GO
CREATE OR ALTER FUNCTION dbo.IsHousingAvailable
(
 @housingId INT,
 @startDate DATETIME,
 @endDate DATETIME
)
RETURNS BIT
AS
BEGIN
 DECLARE @result BIT = 'TRUE'

 IF EXISTS (SELECT * FROM reservation r 
            WHERE r.housing_id = @housingId 
            AND (@startDate BETWEEN r.start_date AND r.end_date OR
                 @endDate BETWEEN r.start_date AND r.end_date))
 BEGIN
  SET @result = 'FALSE'
 END

 RETURN @result
END
GO
--SELECT dbo.IsHousingAvailable(29, '2023-12-11', '2023-12-13'); ---niedostepne
