GO
CREATE OR ALTER PROCEDURE add_rating (@housing_id INT, @object_type varchar(50),
@author_id INT, @score INT, @title VARCHAR(100), @description VARCHAR(2000))
AS
BEGIN
  DECLARE @rating_id INT;
  IF @score > 10 OR @score < 1 
  BEGIN
  RAISERROR ('Nieprawidlowa ocena. Wybierz liczbe od 1 do 10', 16, 1);
RETURN;
END

IF @object_type = 'housing'
BEGIN
  INSERT INTO housing_rating (housing_id, author_id, rating_data_id)
  VALUES (@housing_id, @author_id, @rating_id);
END

 IF @object_type = 'host'
BEGIN
 INSERT INTO host_rating(host_id, author_id, rating_data_id)
 VALUES (@housing_id, @author_id, @rating_id);

END

IF @object_type = 'guest'
BEGIN
INSERT INTO guest_rating(guest_id, author_id, rating_data_id)
 VALUES (@housing_id, @author_id, @rating_id);

END

IF @object_type = 'attraction'
BEGIN
INSERT INTO attraction_rating(attraction_id, author_id, rating_data_id)
 VALUES (@housing_id, @author_id, @rating_id);
END

  INSERT INTO housing_rating (housing_id, author_id, rating_data_id)
  VALUES (@housing_id, @author_id, @rating_id);
END
GO
