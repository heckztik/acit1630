SELECT (
    SELECT COUNT(DISTINCT library.game_id)
    FROM library
    WHERE (library.purchase_type = 'Purchase') AND (library.user_id = user.user_id)
) AS games_owned
FROM user
ORDER BY games_owned DESC
LIMIT 1;
