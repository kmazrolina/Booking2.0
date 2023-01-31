GO
CREATE OR ALTER PROCEDURE add_answer (@question_id INT,
@author_id INT,
@description VARCHAR(2000))
AS
BEGIN
	IF @description = ''
    BEGIN
        RAISERROR('Nieprawidlowa odpowiedz.', 16, 1)
        RETURN
    END

	IF NOT EXISTS (SELECT 1 FROM housing_question WHERE id = @question_id)
    BEGIN
        RAISERROR('Pytanie z id %d nie istnieje.', 16, 1, @question_id)
        RETURN
    END
INSERT INTO question_answer(question_id,description)
VALUES (@question_id, @description);
END;
GO
--EXEC add_answer 38,100,'Yes'
