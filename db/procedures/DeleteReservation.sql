EXEC DropObject 'DeleteReservation'

GO
CREATE PROCEDURE DeleteReservation(@reservation_id int)
AS
BEGIN
BEGIN TRANSACTION

	--tutaj uruchomiony zostanie wyzwalacz aktualizujacy widoki zawierajace rezerwacje
	DELETE FROM reservation
	WHERE id = @reservation_id
	
	DELETE FROM reservation_details
	WHERE reservation_id = @reservation_id

COMMIT
END
GO
