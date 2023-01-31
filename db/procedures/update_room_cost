DROP PROC update_room_cost
CREATE  PROCEDURE update_room_cost (@id INT, @new_cost MONEY)
AS
BEGIN
    UPDATE room
    SET cost_per_night = @new_cost
    WHERE id = @id;
END
