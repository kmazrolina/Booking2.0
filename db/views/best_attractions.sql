IF OBJECT_ID('best_attractions', 'v') IS NOT NULL
  DROP VIEW best_attractions
GO

CREATE VIEW best_attractions
AS
  SELECT
    a.name attraction_name,
    AVG(rd.score) average_rating,
    COUNT(DISTINCT rd.id) rating_count,
    ci.name city_name,
    co.name country_name
  FROM country co
  INNER JOIN city ci ON ci.location.STWithin(co.location) = 1
  RIGHT JOIN attraction a ON ci.location.STBuffer(0.15).STIntersects(a.location) = 1
  LEFT JOIN attraction_rating ar ON ar.attraction_id = a.id
  LEFT JOIN rating_data rd ON rd.id = ar.rating_data_id
  GROUP BY a.name, ci.name, co.name
GO

-- SELECT * FROM best_attractions
-- ORDER BY average_rating DESC, rating_count DESC, attraction_name