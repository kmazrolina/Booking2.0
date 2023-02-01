DROP TRIGGER trigger_AddReservation
GO
CREATE TRIGGER trigger_AddReservation ON reservation
INSTEAD OF INSERT 
AS
BEGIN
	DECLARE @housing_id INT
	DECLARE @start_date DATETIME
	DECLARE @end_date DATETIME
	SET @housing_id = (SELECT housing_id FROM inserted)
	SET @start_date = (SELECT start_date FROM inserted)
	SET @end_date  = (SELECT end_date FROM inserted)
	
	DECLARE @result BIT 
	SELECT @result = dbo.IsHousingAvailable(@housing_id, @start_date, @end_date)
	IF @result = 'FALSE'
		RAISERROR('Obiekt niedostêpny w podanych datach.', 16,  1)
	ELSE
	BEGIN
		INSERT INTO reservation
		SELECT guest_id, housing_id, start_date, end_date FROM INSERTED
	END
END
GO





