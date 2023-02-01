GO
CREATE TRIGGER tr_update_houses_per_city_per_price
ON room
AFTER INSERT
AS
BEGIN
EXEC DropObject 'houses_per_city_per_price'
EXEC('CREATE VIEW houses_per_city_per_price
AS
SELECT C.city_name, C.housing_name, MIN(R.cost_per_night) [prices from] FROM houses_per_city C JOIN room R ON C.housing_id = R.housing_id
GROUP BY C.housing_name')
END
GO
