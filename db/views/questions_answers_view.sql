--- widok q&a
DROP VIEW questions_answers_view
GO
CREATE VIEW  questions_answers_view AS
SELECT  q.author_id AS question_author, q.description AS question, a.description AS answer
FROM housing_question q
JOIN question_answer a ON q.id=a.question_id;

