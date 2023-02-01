IF OBJECT_ID('houses_per_city_detailed', 'v') IS NOT NULL
  DROP VIEW houses_per_city_detailed
GO

CREATE VIEW houses_per_city_detailed
AS
  SELECT
    co.name country_name,
    ci.name city_name,
    COUNT(DISTINCT a.id) city_attractions,
    h.name house_name,
    AVG(rd.score) housing_rating,
    r.name room_name,
    r.cost_per_night cost_per_night
  FROM country co
  INNER JOIN city ci ON ci.location.STWithin(co.location) = 1
  LEFT JOIN attraction a ON ci.location.STBuffer(0.15).STIntersects(a.location) = 1
  INNER JOIN housing h ON ci.location.STIntersects(h.location) = 1
  INNER JOIN room r ON r.housing_id = h.id
  LEFT JOIN housing_rating hr ON hr.housing_id = h.id
  LEFT JOIN rating_data rd ON rd.id = hr.rating_data_id
  GROUP BY co.name, ci.name, h.name, r.name, r.cost_per_night
GO

-- SELECT * FROM houses_per_city_detailed
-- ORDER BY
--   country_name,
--   city_attractions DESC,
--   housing_rating DESC,
--   cost_per_night