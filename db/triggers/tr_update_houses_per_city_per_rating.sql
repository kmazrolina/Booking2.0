GO
CREATE TRIGGER tr_update_houses_per_city_per_rating
ON housing
AFTER INSERT
AS
BEGIN
 EXEC ('DROP VIEW houses_per_city_per_rating');
 EXEC(
 'CREATE VIEW houses_per_city_per_rating
  AS
  SELECT C.housing_name, dbo.CalculateRating(C.housing_id, 'housing')[rating] FROM houses_per_city C');
END
