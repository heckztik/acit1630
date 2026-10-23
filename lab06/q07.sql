-- q07: Display all games released after 2020, sorted by release date, newest first.
SELECT title, release_date
FROM game
WHERE release_date > '2020-12-31'
ORDER BY release_date DESC;
