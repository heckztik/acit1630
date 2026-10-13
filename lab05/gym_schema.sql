PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS registration;
DROP TABLE IF EXISTS offering;
DROP TABLE IF EXISTS member;
DROP TABLE IF EXISTS class;
DROP TABLE IF EXISTS room;

CREATE TABLE room (
    room_num INTEGER PRIMARY KEY,
    capacity INTEGER NOT NULL CHECK (capacity > 0),
    description TEXT NOT NULL
);

CREATE TABLE class (
    class_id INTEGER PRIMARY KEY,
    class_name TEXT NOT NULL,
    class_category TEXT NOT NULL
        CHECK (class_category IN ('Yoga', 'Spin', 'Cardio', 'Dance', 'HIIT', 'Kick Boxing')),
    intensity INTEGER NOT NULL CHECK (intensity BETWEEN 1 AND 5),
    duration INTEGER NOT NULL CHECK (duration > 0)
);

CREATE TABLE offering (
    offering_id INTEGER PRIMARY KEY,
    class_id INTEGER NOT NULL,
    offering_datetime DATETIME NOT NULL,
    room_num INTEGER NOT NULL,
    FOREIGN KEY (class_id) REFERENCES class (class_id),
    FOREIGN KEY (room_num) REFERENCES room (room_num)
);

CREATE TABLE member (
    member_id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE
);

CREATE TABLE registration (
    member_id INTEGER NOT NULL,
    offering_id INTEGER NOT NULL,
    PRIMARY KEY (member_id, offering_id),
    FOREIGN KEY (member_id) REFERENCES member (member_id),
    FOREIGN KEY (offering_id) REFERENCES offering (offering_id)
);