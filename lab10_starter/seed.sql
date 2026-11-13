-- Load once into an empty schema, before creating the lab triggers.
PRAGMA foreign_keys = ON;

BEGIN TRANSACTION;

INSERT INTO program (program_id, program_name, program_description) VALUES
    ('ACIT', 'Computer Information Technology', 'Studies in IT infrastructure, systems, and databases.'),
    ('CST', 'Computer Systems Technology', 'Studies in software development and computing systems.');

-- Example term dates only; these are not official academic dates.
INSERT INTO term (term_code, start_date, end_date) VALUES
    ('202610', '2026-01-01', '2026-04-30'),
    ('202630', '2026-09-01', '2026-12-31');

INSERT INTO program_term_fee (program_id, term, fee_cents) VALUES
    ('ACIT', '202610', 300000),
    ('ACIT', '202630', 310000),
    ('CST', '202610', 320000),
    ('CST', '202630', 330000);

INSERT INTO student (student_id, first_name, last_name, program_id) VALUES
    ('A12345678', 'Maya', 'Chen', 'ACIT'),
    ('A23456789', 'Alex', 'Patel', 'ACIT'),
    ('A34567890', 'Jordan', 'Kim', 'CST'),
    ('A45678901', 'Priya', 'Singh', 'ACIT'),
    ('A56789012', 'Noah', 'Garcia', 'CST'),
    ('A67890123', 'Lina', 'Wong', 'CST');

INSERT INTO course (course_id, course_description, level) VALUES
    ('ACIT1630', 'Database Systems', 1),
    ('ACIT1420', 'Introduction to Systems Administration', 1),
    ('ACIT3910', 'Database Administration and Management', 3);

INSERT INTO course_prerequisite (course_id, prerequisite_course_id) VALUES
    ('ACIT3910', 'ACIT1630'),
    ('ACIT3910', 'ACIT1420');

INSERT INTO course_offering (course_id, term, available_seats) VALUES
    ('ACIT1630', '202610', 0),
    ('ACIT1420', '202610', 0),
    ('ACIT1630', '202630', 2),
    ('ACIT1420', '202630', 3),
    ('ACIT3910', '202630', 1);

INSERT INTO enrollment (student_id, course_id, term, grade) VALUES
    ('A12345678', 'ACIT1630', '202610', 48),
    ('A12345678', 'ACIT1630', '202630', NULL),
    ('A12345678', 'ACIT1420', '202610', 90),
    ('A23456789', 'ACIT1630', '202610', 91),
    ('A23456789', 'ACIT1420', '202610', 76),
    ('A34567890', 'ACIT1420', '202610', 84),
    ('A45678901', 'ACIT1630', '202610', 82),
    ('A45678901', 'ACIT1420', '202610', 88),
    ('A56789012', 'ACIT1630', '202610', 73),
    ('A56789012', 'ACIT1420', '202610', 81),
    ('A67890123', 'ACIT1420', '202610', 69),
    ('A67890123', 'ACIT1630', '202630', NULL);

COMMIT;
