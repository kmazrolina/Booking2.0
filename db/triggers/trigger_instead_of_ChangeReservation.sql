GO
CREATE OR ALTER TRIGGER trigger_ChangeReservation ON reservation
INSTEAD OF UPDATE 
AS
BEGIN
SET XACT_ABORT ON
BEGIN TRANSACTION

	DELETE FROM reservation 
	WHERE EXISTS( SELECT * FROM deleted D WHERE reservation.id = D.id)

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
COMMIT
END
GO





