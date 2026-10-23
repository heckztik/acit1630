-- q01
-- SELECT username, subscription_type
-- FROM user;

-- q02
-- SELECT title
-- FROM game
-- WHERE genre LIKE '%Action%';

-- q03
-- SELECT user_id, game_id, purchase_type, expiry_date
-- FROM library
-- WHERE (purchase_type = 'Rental') AND (purchase_date > DATE('now'));

-- q04
-- SELECT SUM(rental_price) + SUM(purchase_price) AS 'Total Revenue'
-- FROM game
-- JOIN library
--     ON library.game_id = game.game_id
--     WHERE library.purchase_type IN ('Purchase', 'Rental');

-- q05
-- SELECT user.username, COUNT(library.purchase_type)
-- FROM user
-- JOIN library ON library.user_id = user.user_id
-- WHERE library.purchase_type = 'Purchase'
-- ORDER BY COUNT(library.purchase_type);

-- q06
-- SELECT user.username, game.title
-- FROM user
-- JOIN library ON library.user_id = user.user_id
-- JOIN game ON game.game_id = library.game_id
-- WHERE (user.subscription_type = 'Premium') AND (library.purchase_type = 'Purchase');

-- q07
-- SELECT title, release_date
-- FROM game
-- WHERE release_date > '2019-12-31'
-- ORDER BY release_date DESC;

-- q08
-- SELECT AVG(rental_price), AVG(purchase_price)
-- FROM game
-- WHERE genre LIKE '%Horror%';

-- q09
-- SELECT user.username, COUNT(library.purchase_type)
-- FROM user
-- JOIN library ON library.user_id = user.user_id
-- GROUP BY library.user_id HAVING (COUNT(library.purchase_type) > 1);

-- q10
-- SELECT user.username, game.title, library.launch_date, library.expiry_date
-- FROM user
-- JOIN library ON library.user_id = user.user_id
-- JOIN game ON game.game_id = library.game_id
-- WHERE launch_date > expiry_date;