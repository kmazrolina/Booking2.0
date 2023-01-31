-- IF OBJECT_ID('attraction_category') IS NOT NULL
--   DROP TABLE attraction_category
-- GO

-- CREATE TABLE attraction_category (
--   id INT PRIMARY KEY,
--   name NVARCHAR(50),
-- )
-- GO

INSERT INTO attraction_category (id, name) VALUES
( 1, 'nature' ),
( 2, 'culture' ),
( 3, 'amusement' )