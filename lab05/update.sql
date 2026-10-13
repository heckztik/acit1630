PRAGMA foreign_keys = ON;

UPDATE member
SET email = 'liam.m@example.com'
WHERE member_id = 4;

UPDATE class
SET intensity = 5
WHERE class_name = 'Power Spin';

UPDATE offering
SET offering_datetime = (DATETIME(offering_datetime, '+30 minutes'))
WHERE offering_id = 4;

UPDATE offering
SET offering_datetime = (DATETIME(offering_datetime, '+1 day'))
WHERE (room_num = 104) AND (DATE(offering_datetime) = '2026-10-22');

UPDATE offering
SET room_num = 104
WHERE offering_id = 2;

UPDATE class
SET duration = (duration + 15)
WHERE class_category IN ('Cardio', 'Kick Boxing');

