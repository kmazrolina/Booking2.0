--

IF OBJECT_ID('cities_info', 'v') IS NOT NULL
  DROP VIEW cities_info
GO

CREATE VIEW cities_info
AS
  SELECT
    ci.name city_name,
    co.name country_name,
    COUNT(DISTINCT a.id) attraction_count,
    COUNT(DISTINCT h.id) house_count,
    AVG(rd.score) attraction_average_rating
  FROM country co
  INNER JOIN city ci ON ci.location.STWithin(co.location) = 1
  RIGHT JOIN attraction a ON ci.location.STBuffer(0.15).STIntersects(a.location) = 1
  LEFT JOIN attraction_rating ar ON ar.attraction_id = a.id
  LEFT JOIN rating_data rd ON rd.id = ar.rating_data_id
  INNER JOIN housing h ON ci.location.STIntersects(h.location) = 1
  GROUP BY ci.name, co.name
GO

-- SELECT * FROM cities_info
-- ORDER BY
--   attraction_count DESC,
--   house_count DESC,
--   attraction_average_rating DESC
