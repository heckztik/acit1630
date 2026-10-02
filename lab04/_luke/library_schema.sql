PRAGMA foreign_keys = ON;

CREATE TABLE authors (
    author_id INTEGER,
    name TEXT NOT NULL UNIQUE,
    birth_year INTEGER CHECK (birth_year <= 2023),
    PRIMARY KEY (author_id)
);

CREATE TABLE books (
    book_id INTEGER,
    title TEXT NOT NULL,
    author_id INTEGER,
    published_year INTEGER,
    price REAL NOT NULL CHECK (price > 0),
    PRIMARY KEY (book_id),
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    CHECK (published_year BETWEEN 1900 AND 2025)  
);

CREATE TABLE members (
    member_id INTEGER,
    name TEXT NOT NULL,
    join_date TEXT DEFAULT CURRENT_DATE,
    membership_status TEXT NOT NULL CHECK (membership_status in ('Active', 'Inactive')),
    PRIMARY KEY (member_id)
);

