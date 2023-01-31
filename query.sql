-- SELECT
--   country.name,
--   city.name
-- FROM city
-- INNER JOIN country
--   ON city.location.STWithin(country.location) = 1
-- ORDER BY country.name

-- SELECT
--   c.name,
--   COUNT(a.id)
-- FROM
--   city c
-- LEFT JOIN attraction a ON c.location.STBuffer(0.15).STIntersects(a.location) = 1
-- GROUP BY c.name

-- SELECT COUNT(*) FROM attraction a

-- SELECT
--   c.name,
--   ROUND(CAST(c.population AS FLOAT) / 100000, 0)
-- FROM city c

-- SELECT
--   c.name,
--   COUNT(h.id)
-- FROM city c
-- LEFT JOIN housing h ON c.location.STBuffer(0.15).STIntersects(h.location) = 1
-- GROUP BY c.name

-- USE master
-- DROP DATABASE test1
-- GO
-- CREATE DATABASE test1
-- GO
-- USE test1
-- GO

-- DELETE FROM attraction_rating WHERE 1=1
-- DELETE FROM rating_data WHERE 1=1

-- SELECT * FROM rating_data
