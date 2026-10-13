PRAGMA foreign_keys = ON;

DELETE FROM registration
WHERE (member_id = 3) AND (offering_id = 2);

DELETE FROM registration
WHERE offering_id = 1;

DELETE FROM registration
WHERE offering_id = 5;
DELETE FROM offering
WHERE offering_id = 5;

DELETE FROM member
WHERE member_id = 5;

-- Deleting offering 5 failed because it was linked to the registrations.
-- DELETE FROM registration; will delete all entries in the table.