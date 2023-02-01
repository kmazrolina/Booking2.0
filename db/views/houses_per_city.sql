IF OBJECT_ID('houses_per_city', 'v') IS NOT NULL
  DROP VIEW houses_per_city
GO

CREATE VIEW houses_per_city
AS
  SELECT
    co.name country_name,
    ci.name city_name,
    h.name house_name
  FROM country co
  INNER JOIN city ci ON ci.location.STWithin(co.location) = 1
  INNER JOIN housing h ON ci.location.STIntersects(h.location) = 1
GO

-- SELECT * FROM houses_per_city
-- ORDER BY country_name, city_name, house_name
