EXEC DropObject 'ChangeReservation'

GO
CREATE PROCEDURE ChangeReservation(@reservation_id int, @new_start_date DATETIME, @new_end_date DATETIME)
AS
BEGIN
	BEGIN TRY
	BEGIN TRANSACTION
		IF @new_start_date >= @new_end_date
			RAISERROR('Podane daty s¹ niepoprawne.', 16,  1)
		ELSE
		BEGIN
			--tutaj uruchomiony zostanie wyzwalacz aktualizujacy widoki zawierajace rezerwacje
			--oraz wyzwalacz sprawdzajacy czy obiekt jest dostepny w podanych datach
			UPDATE reservation
			SET start_date = @new_start_date, end_date = @new_end_date
			WHERE id = @reservation_id
		
		END
	
	COMMIT
END TRY
BEGIN CATCH END CATCH
END
GO