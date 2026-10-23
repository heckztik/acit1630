-- q02: Find the titles of all games whose genres include "Action".
SELECT title
FROM game
WHERE genre LIKE '%Action%';
