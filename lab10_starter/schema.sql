PRAGMA foreign_keys = ON;

CREATE TABLE program (
    program_id TEXT NOT NULL PRIMARY KEY,
    program_name TEXT NOT NULL,
    program_description TEXT NOT NULL
);

CREATE TABLE term (
    term_code TEXT NOT NULL PRIMARY KEY CHECK (
        length(term_code) = 6 AND term_code NOT GLOB '*[^0-9]*'
        AND substr(term_code, 5, 2) IN ('10', '30')
    ),
    start_date TEXT NOT NULL CHECK (
        date(start_date) IS NOT NULL AND date(start_date) = start_date
    ),
    end_date TEXT NOT NULL CHECK (
        date(end_date) IS NOT NULL AND date(end_date) = end_date
    ),
    CHECK (end_date > start_date)
);

CREATE TABLE program_term_fee (
    program_id TEXT NOT NULL,
    term TEXT NOT NULL,
    fee_cents INTEGER NOT NULL CHECK (
        typeof(fee_cents) = 'integer' AND fee_cents >= 0
    ),
    PRIMARY KEY (program_id, term),
    FOREIGN KEY (program_id) REFERENCES program(program_id),
    FOREIGN KEY (term) REFERENCES term(term_code)
);

CREATE TABLE student (
    student_id TEXT NOT NULL PRIMARY KEY CHECK (
        length(student_id) = 9 AND substr(student_id, 1, 1) = 'A'
        AND substr(student_id, 2) NOT GLOB '*[^0-9]*'
    ),
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    program_id TEXT NOT NULL,
    FOREIGN KEY (program_id) REFERENCES program(program_id)
);

CREATE TABLE course (
    course_id TEXT NOT NULL PRIMARY KEY CHECK (instr(course_id, ' ') = 0),
    course_description TEXT NOT NULL,
    level INTEGER NOT NULL CHECK (typeof(level) = 'integer' AND level > 0)
);

CREATE TABLE course_prerequisite (
    course_id TEXT NOT NULL,
    prerequisite_course_id TEXT NOT NULL,
    PRIMARY KEY (course_id, prerequisite_course_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (prerequisite_course_id) REFERENCES course(course_id),
    CHECK (course_id <> prerequisite_course_id)
);

CREATE TABLE course_offering (
    course_id TEXT NOT NULL,
    term TEXT NOT NULL,
    available_seats INTEGER NOT NULL CHECK (
        typeof(available_seats) = 'integer' AND available_seats >= 0
    ),
    PRIMARY KEY (course_id, term),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (term) REFERENCES term(term_code)
);

-- The key enforces one attempt per student, course, and term.
-- This starter does not enforce the total-attempt or prerequisite rules.
CREATE TABLE enrollment (
    student_id TEXT NOT NULL,
    course_id TEXT NOT NULL,
    term TEXT NOT NULL,
    grade REAL CHECK (
        grade IS NULL OR (
            typeof(grade) IN ('integer', 'real') AND grade BETWEEN 0 AND 100
        )
    ),
    PRIMARY KEY (student_id, course_id, term),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_id, term) REFERENCES course_offering(course_id, term)
);
