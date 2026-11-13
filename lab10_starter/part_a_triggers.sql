CREATE TRIGGER IF NOT EXISTS reduce_available_seats
AFTER INSERT ON course_registration
BEGIN
    UPDATE course_offering
    SET available_seats = available_seats - 1
    WHERE course_id = NEW.course_id AND term = NEW.term;
END;

CREATE TRIGGER IF NOT EXISTS prevent_full_enrollment
BEFORE INSERT ON course_registration
WHEN OLD.available_seats <= 0
BEGIN
    RAISE(ABORT, 'Cannot register for a full course');
END;

