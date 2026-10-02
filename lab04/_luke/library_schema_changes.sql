ALTER TABLE members 
ADD COLUMN email TEXT NOT NULL;

-- NO DATA IN TABLE
ALTER TABLE books 
DROP COLUMN price;

ALTER TABLE books 
ADD COLUMN price REAL NOT NULL
CHECK (price >= 5);

-- DATA IN TABLE
CREATE TABLE books_new (
    book_id INTEGER,
    title TEXT NOT NULL,
    author_id INTEGER,
    published_year INTEGER,
    price REAL NOT NULL,
    PRIMARY KEY (book_id),
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    CHECK (published_year BETWEEN 1900 AND 2025),
    CHECK (price >= 5)
);

INSERT INTO books_new (
    book_id, title, author_id, published_year, price
)
SELECT book_id, title, author_id, published_year, price
FROM books;

DROP TABLE books;

ALTER TABLE books_new
RENAME TO books;

