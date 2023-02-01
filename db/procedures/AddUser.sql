CREATE OR ALTER PROCEDURE add_user (@first_name VARCHAR(100), @last_name VARCHAR(100), @email VARCHAR(100), @phone VARCHAR(20), @gender VARCHAR(20))
AS
BEGIN
  SET NOCOUNT ON;

  DECLARE @error_message VARCHAR(MAX);

  BEGIN TRY
    IF (@first_name IS NULL OR @first_name = '') OR (@last_name IS NULL OR @last_name = '')
    BEGIN
      SET @error_message = 'nieprawidlowe imie lub nazwisko';
      RAISERROR(@error_message, 16, 1);
    END
    ELSE IF EXISTS (SELECT 1 FROM user_data WHERE email = @email)
    BEGIN
      SET @error_message = 'podany email juz istnieje';
      RAISERROR(@error_message, 16, 1);
    END
    ELSE
    BEGIN
      INSERT INTO user_data (first_name, last_name, email, phone, gender)
      VALUES (@first_name, @last_name, @email, @phone, @gender);
    END
  END TRY
  BEGIN CATCH
    PRINT 'Wystapil nastepujacy blad: ' + ERROR_MESSAGE();
  END CATCH
END
GO
