GO
CREATE OR ALTER PROCEDURE add_question (@housing_name NVARCHAR(100), @author_id INT, @description VARCHAR(2000))
AS
BEGIN
DECLARE @housing_id INT;
  
  SELECT @housing_id = id
  FROM housing
  WHERE name = @housing_name;

  INSERT INTO housing_question (housing_id, author_id, description)
  VALUES (@housing_id, @author_id, @description);
END;
GO
--EXEC add_question 'Graham-Hills',10, 'How far aways is a grocery shop?'
