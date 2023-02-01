EXEC DropObject 'housing_and_rooms'
GO

CREATE VIEW housing_and_rooms AS
SELECT H.id AS housing_id, H.name AS housing_name, R.id AS room_id, R.name AS room_name FROM
housing H RIGHT JOIN room R ON H.id = R.housing_id
GO

