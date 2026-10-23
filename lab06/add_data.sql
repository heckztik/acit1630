PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS game_staging;
.import --csv random_games.csv game_staging

INSERT INTO game (title, genre, release_date, rating, rental_price, purchase_price)
SELECT title, genre, release_date, rating, rental_price, purchase_price
FROM game_staging;

DROP TABLE game_staging;

DROP TABLE IF EXISTS user_staging;
.import --csv random_users.csv user_staging

INSERT INTO user (username, email, subscription_type)
SELECT name, email, subscription_type
FROM user_staging;

INSERT INTO library (user_id, game_id, purchase_type, purchase_date, launch_date, expiry_date)
VALUES 
(2, 21, 'Purchase', '2026-03-14', '2026-03-14', NULL)
,(2, 83, 'Purchase', '2026-06-02', NULL, NULL)
,(6, 43, 'Purchase', '2026-04-20', '2026-04-21', NULL)
,(6, 6,  'Purchase', '2026-09-30', '2026-10-01', NULL)
,(13, 70, 'Purchase', '2026-08-15', '2026-08-16', NULL)
,(9, 60, 'Rental', '2026-10-10', '2026-10-11', '2026-11-09')
,(21, 54, 'Rental', '2026-10-15', NULL, '2026-11-14')
,(14, 22, 'Rental', '2026-07-01', '2026-07-05', '2026-07-31')
,(30, 86, 'Rental', '2026-08-01', '2026-09-12', '2026-08-31')
,(17, 9,  'Rental', '2026-09-01', '2026-09-03', '2026-10-01')
;

-- commas in front so it is easy to comment out for testing.