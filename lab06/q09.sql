-- q09: List users who have purchased at least two different games, with their game counts.
SELECT user.username, COUNT(DISTINCT library.game_id)
FROM user
JOIN library ON library.user_id = user.user_id
WHERE library.purchase_type = 'Purchase'
GROUP BY user.user_id
HAVING COUNT(DISTINCT library.game_id) >= 2;
