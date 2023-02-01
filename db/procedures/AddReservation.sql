EXEC DropObject 'AddReservation'

GO
CREATE PROCEDURE AddReservation(@guest_id INT, @housing_id INT, @room_id INT, @start_date DATETIME, @end_date DATETIME)
AS
BEGIN
BEGIN TRY
	SET XACT_ABORT ON
	BEGIN TRANSACTION
	IF (@start_date >= @end_date)
		RAISERROR('Podane daty są niepoprawne.', 16,  1)
	ELSE
	BEGIN
		--tutaj uruchomiony zostanie wyzwalacz sprawdzajacy, 
		--czy obiekt jest dostepny w podanych datach
		INSERT INTO reservation
		VALUES (@guest_id, @housing_id, @start_date, @end_date)
	
		DECLARE @cost MONEY
		SET @cost = (
			SELECT ( cost_per_night * DATEDIFF(day, @start_date, @end_date) )
			FROM room WHERE id = @room_id
		)

		INSERT INTO reservation_details
		VALUES (IDENT_CURRENT( 'reservation' ) ,@room_id, @cost)
	END

	COMMIT
END TRY
BEGIN CATCH END CATCH
END
GO

