GO
EXEC DropObject 'HousingCityDates_SortBy'
GO
CREATE PROCEDURE HousingCityDates_SortBy(
@city varchar(50), 
@start_date DATETIME, 
@end_date DATETIME,
@sort_by varchar(50)
)
AS
BEGIN
	IF(@sort_by = 'price')
	BEGIN
		SELECT * FROM houses_per_city_per_price AS HP
		WHERE city_name = @city 
		AND dbo.IsHousingAvaliable(HP.housing_id, @start_date, @end_date) = 'TRUE' 
		ORDER BY HP.[prices from]
	END
	
	IF(@sort_by = 'rating')
	BEGIN
		SELECT * FROM houses_per_city_per_rating AS HR
		WHERE city_name = @city 
		AND dbo.IsHousingAvaliable(HR.housing_id, @start_date, @end_date) = 'TRUE' 
		ORDER BY HR.rating
	END

	IF(@sort_by = 'distance from city center')
	BEGIN
		SELECT HC.* FROM 
		houses_per_city AS HC JOIN housing H on H.id = HC.housing_id
		WHERE city_name = @city 
		AND dbo.IsHousingAvaliable(H.housing_id, @start_date, @end_date) = 'TRUE' 
		ORDER BY dbo.DistanceFromCityCenter(H.location, @city)
	END

END
