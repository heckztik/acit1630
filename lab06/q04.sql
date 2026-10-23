-- q04: Calculate the combined total revenue from purchases and rentals.
-- Each library row earns either the rental price or the purchase price, never both.
SELECT SUM(
    CASE
        WHEN library.purchase_type = 'Rental' THEN game.rental_price
        ELSE game.purchase_price
    END
) AS "Total Revenue"
FROM library
JOIN game ON game.game_id = library.game_id;
