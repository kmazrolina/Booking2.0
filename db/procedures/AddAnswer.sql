CREATE OR ALTER PROCEDURE add_answer (@question_id INT,
@author_id INT,
@description VARCHAR(2000))
AS
BEGIN
INSERT INTO question_answer(question_id,description)
VALUES (@question_id, @description);
END;
--EXEC add_answer 38,100,'Yes'
