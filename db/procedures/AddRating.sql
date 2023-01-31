GO
CREATE OR ALTER PROCEDURE add_rating (@housing_id INT, @author_id INT, @score INT, @title VARCHAR(100), @description VARCHAR(2000))
AS
BEGIN
  DECLARE @rating_id INT;
  IF @score > 10 OR @score < 1 
  BEGIN
  RAISERROR ('Nieprawidlowa ocena. Wybierz liczbe od 1 do 10', 16, 1);
RETURN;
END
  INSERT INTO rating_data (score, title, description)
  VALUES (@score, @title, @description);

  INSERT INTO housing_rating (housing_id, author_id, rating_data_id)
  VALUES (@housing_id, @author_id, @rating_id);
END
GO
