GO
CREATE OR ALTER PROCEDURE add_user (@first_name varchar(100), @last_name varchar(100), @email varchar(100), @phone varchar(20), @gender varchar(20))
AS
BEGIN
  INSERT INTO user_data (first_name, last_name, email, phone, gender)
  VALUES (@first_name, @last_name, @email, @phone, @gender)
END
GO
