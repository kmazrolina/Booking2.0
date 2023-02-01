EXEC DropObject 'HousingCityDates'
GO
CREATE PROCEDURE HousingCityDates(
@city varchar(50), 
@start_date DATETIME, 
@end_date DATETIME
)
AS
BEGIN
SELECT * FROM housing_per_city_detailed AS HCD
WHERE city_name = @city AND dbo.IsHousingAvaliable(HCD.housing_id, @start_date, @end_date) = 'TRUE'
END
