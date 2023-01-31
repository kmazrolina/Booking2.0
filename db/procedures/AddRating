GO
CREATE OR ALTER PROCEDURE add_rating (@housing_id INT, @author_id INT, @score INT, @title VARCHAR(100), @description VARCHAR(2000))
AS
BEGIN
  DECLARE @rating_id INT;

  INSERT INTO rating_data (score, title, description)
  VALUES (@score, @title, @description);

  INSERT INTO housing_rating (housing_id, author_id, rating_data_id)
  VALUES (@housing_id, @author_id, @rating_id);
END
GO
EXEC add_rating 3,10, 4, 'Nice hotel with easy parking and good breakfast', 'Hotel located 5 minutes
away from the ferry crossing, in a small quiet village with restaurants and small supermarket nearby. 
Friendly and discreet staff. Very clean bedroom with comfy bed. Great choice of local fresh breads 
(including a delicious gingerbread and sugar/cinnamon) for breakfast with ample selection of local 
cheese and ham, cereals and yogourts, bacon and egg, and fresh fruit salad - all continuously
refilled by watchful staff member. Free tea and coffee during the day'
