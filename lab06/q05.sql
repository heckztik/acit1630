SELECT user.username, user.user_id, (
    SELECT COUNT(DISTINCT library.game_id)
    FROM library
    WHERE (library.purchase_type = 'Purchase') AND (library.user_id = user.user_id)
) AS games_owned
FROM user
JOIN library ON library.user_id = user.user_id
GROUP BY user.user_id 


HAVING COUNT(library.game_id) = (
    SELECT MAX(
        (
        SELECT COUNT(DISTINCT library.game_id)
        FROM library
        WHERE (library.purchase_type = 'Purchase') AND (library.user_id = user.user_id))
        )
    FROM user

);
