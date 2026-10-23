-- q10: List users who first launched a rented game after it expired.
SELECT user.username, game.title, library.launch_date, library.expiry_date
FROM user
JOIN library ON library.user_id = user.user_id
JOIN game ON game.game_id = library.game_id
WHERE (library.purchase_type = 'Rental') AND (library.launch_date > library.expiry_date);
