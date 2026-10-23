SELECT user_id, game_id, purchase_type, expiry_date
FROM library
WHERE (purchase_type = 'Rental') AND (expiry_date < DATE('now'));