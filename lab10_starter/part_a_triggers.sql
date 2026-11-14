DROP TRIGGER IF EXISTS reduce_available_seats;
DROP TRIGGER IF EXISTS prevent_full_enrollment;

CREATE TRIGGER IF NOT EXISTS reduce_available_seats
AFTER INSERT ON enrollment
BEGIN
    UPDATE course_offering
    SET available_seats = available_seats - 1
    WHERE course_id = NEW.course_id AND term = NEW.term;
END;

CREATE TRIGGER IF NOT EXISTS prevent_full_enrollment
BEFORE INSERT ON enrollment
WHEN (SELECT available_seats FROM course_offering WHERE NEW.course_id = course_id AND NEW.term = term) <= 0
BEGIN
    SELECT RAISE(ABORT, 'No seats available');
END;
