EXEC drop_object 'availability_in_dates'

GO
CREATE FUNCTION availability_in_dates(
@housing_name VARCHAR(100),
@start_date DATETIME,  
@end_date DATETIME )
RETURNS BIT
AS
BEGIN
	
	--dany obiekt nie ma zadnych rezerwacji lub
	--nie ma zadnych rezerwacji w podanych datach w danym obiekcie
		IF NOT EXISTS( 
			SELECT * FROM housing_and_reservations 
			WHERE housing_name = @housing_name AND start_date >= @start_date AND end_date <= @end_date
		)
			RETURN 'TRUE'
		ELSE
			BEGIN
			--jesli w danym obiekcie sa inne wolne pokoje
			IF EXISTS ( 
			SELECT * FROM 
			housing_and_rooms AS [Rms] 
			LEFT JOIN (
			--wybrane zostaja zajete pokoje
			SELECT room_id FROM housing_and_reservations 
			WHERE housing_name = @housing_name AND start_date >= @start_date AND end_date <= @end_date 	
			)
			AS [Rsvs] 
			ON Rms.room_id = Rsvs.room_id
			WHERE (Rms.housing_name = @housing_name) AND (Rsvs.room_id IS NULL )
			)	
				RETURN 'TRUE'
				
			END
	RETURN 'FALSE'
END
GO

