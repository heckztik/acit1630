PRAGMA foreign_keys = ON;

INSERT INTO member (member_id, first_name, last_name, email)
VALUES (6, 'Luke', 'Orlowski', 'luke.orlowski@example.com');

INSERT INTO class (class_id, class_name, class_category, intensity, duration)
VALUES (6, 'Sunset Yoga', 'Yoga', 1, 45);

INSERT INTO offering (offering_id, class_id, offering_datetime, room_num)
VALUES (6, 6, '2026-10-24 19:00:00', 104);

INSERT INTO registration (member_id, offering_id)
VALUES 
    (6, 6),
    (6, 3);