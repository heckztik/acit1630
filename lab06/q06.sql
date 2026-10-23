-- q06: List all games owned by users with a "Premium" subscription.
-- Count purchases only.
SELECT user.username, game.title
FROM user
JOIN library ON library.user_id = user.user_id
JOIN game ON game.game_id = library.game_id
WHERE user.subscription_type = 'Premium'
  AND library.purchase_type = 'Purchase';
