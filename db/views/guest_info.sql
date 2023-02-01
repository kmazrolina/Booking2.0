---- widok na gosci i ich dane
CREATE VIEW guest_info AS
SELECT ud.first_name, ud.last_name, ud.email
FROM user_data ud
JOIN guest g ON ud.id = g.user_data_id;
GO

-- SELECT * FROM guest_info

