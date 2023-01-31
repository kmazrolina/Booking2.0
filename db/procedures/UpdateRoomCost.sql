EXEC DropObject 'update_room_cost'
GO
CREATE PROCEDURE update_room_cost (@id INT, @new_cost MONEY)
AS
BEGIN 
IF @new_cost < 0
    BEGIN
        RAISERROR('Podana cena jest nieprawidlowa.', 16, 1)
        RETURN
    END
    UPDATE room
    SET cost_per_night = @new_cost
    WHERE id = @id;
END
GO
