---- widok z danymi na daty pobytu, koszt i rodzaj obiektu
IF OBJECT_ID('full_reservation_info', 'v') IS NOT NULL
  DROP VIEW full_reservation_info
GO

CREATE VIEW full_reservation_info AS
SELECT r.start_date, r.end_date, rd.room_id, rd.cost, hc.name
FROM reservation r
JOIN reservation_details rd ON r.id = rd.reservation_id
JOIN housing h ON h.id = r.housing_id
JOIN housing_category hc ON h.housing_category_id = hc.id
GO

-- SELECT * FROM full_reservation_info
