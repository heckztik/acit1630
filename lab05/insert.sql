INSERT INTO class (class_id, class_name, class_category, intensity, duration)
VALUES
    (1, 'Morning Flow Yoga', 'Yoga', 2, 60),
    (2, 'Power Spin', 'Spin', 4, 45),
    (3, 'Cardio Blast', 'Cardio', 3, 45),
    (4, 'HIIT Express', 'HIIT', 5, 20),
    (5, 'Cardio Kickboxing', 'Kick Boxing', 4, 60);

INSERT INTO offering (offering_id, class_id, offering_datetime, room_num)
VALUES
    (1, 1, '2026-10-19 07:00:00', 102),
    (2, 4, '2026-10-19 12:00:00', 101),
    (3, 2, '2026-10-19 18:00:00', 103),
    (4, 5, '2026-10-20 18:00:00', 102),
    (5, 3, '2026-10-22 12:00:00', 104);

INSERT INTO registration (member_id, offering_id)
VALUES
    (1, 1),
    (2, 1),
    (3, 2),
    (4, 4),
    (1, 5);