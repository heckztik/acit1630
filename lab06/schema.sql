PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS library;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS game;

CREATE TABLE user (
    "user_id" INTEGER NOT NULL PRIMARY KEY,
    "username" TEXT NOT NULL,
    "email" TEXT NOT NULL UNIQUE,
    "subscription_type" TEXT NOT NULL CHECK ("subscription_type" IN ('Basic', 'Standard', 'Premium'))
);

CREATE TABLE game (
    "game_id" INTEGER NOT NULL PRIMARY KEY,
    "title" TEXT NOT NULL,
    "genre" TEXT NOT NULL,
    "release_date" TEXT NOT NULL,
    "rating" TEXT NOT NULL CHECK (rating IN ('Everyone', 'Teen', 'Mature')),
    "rental_price" REAL NOT NULL CHECK ("rental_price" >= 0),
    "purchase_price" REAL NOT NULL CHECK ("purchase_price" >= 0)
);

CREATE TABLE library (
    "library_id" INTEGER NOT NULL PRIMARY KEY,
    "user_id" INTEGER NOT NULL,
    "game_id" INTEGER NOT NULL,
    "purchase_type" TEXT NOT NULL CHECK ("purchase_type" in ('Purchase', 'Rental')),
    "purchase_date" TEXT NOT NULL,
    "launch_date" TEXT DEFAULT NULL,
    "expiry_date" TEXT, 
    FOREIGN KEY ("user_id") REFERENCES user ("user_id"),
    FOREIGN KEY ("game_id") REFERENCES game ("game_id"),
    CHECK (
        ("purchase_type" = 'Rental' AND "expiry_date" IS NOT NULL) OR 
        ("purchase_type" = 'Purchase' AND "expiry_date" IS NULL)
    )
);

