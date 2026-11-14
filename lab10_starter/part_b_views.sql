DROP VIEW IF EXISTS enrollment_summary;

CREATE VIEW enrollment_summary AS
SELECT
    student.student_id AS student_id,
    student.first_name || ' ' || student.last_name AS full_name,
    program.program_name AS program_name,
    (program_term_fee.fee_cents / 100.0) AS program_fee,
    enrollment.course_id AS course_id,
    course.course_description AS course_description,
    enrollment.term AS term,
    enrollment.grade AS grade
FROM student
JOIN enrollment ON enrollment.student_id = student.student_id
JOIN program ON program.program_id = student.program_id
JOIN program_term_fee ON program_term_fee.program_id = program.program_id AND enrollment.term = program_term_fee.term
JOIN course on course.course_id = enrollment.course_id;