---Obliczanie ilości wolnych domków w danym dniu
GO
CREATE OR ALTER FUNCTION dbo.GetNumberOfFreeStays (@date DATETIME)
RETURNS INT
AS
BEGIN
    DECLARE @totalStays INT
    DECLARE @occupiedStays INT
    DECLARE @freeStays INT

    SELECT @totalStays = COUNT(*)
    FROM housing h

    SELECT @occupiedStays = COUNT(*)
    FROM reservation r
    JOIN reservation_details rd ON r.id = rd.reservation_id
    WHERE (@date BETWEEN r.start_date AND r.end_date)

    SET @freeStays = @totalStays - @occupiedStays

    RETURN @freeStays
END
GO
