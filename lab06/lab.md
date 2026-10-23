# Project 1: Online Game Platform Database

## Objective

Design, create, populate, and query a SQLite database for an online game platform.

## Scenario

You are a database consultant for an online game platform similar to Steam or Epic Games. Users can browse games, rent them for 30 days, or purchase them permanently.

## Instructions

Use VS Code to edit your files and the SQLite command-line shell (`sqlite3`) in a terminal to run your setup and import scripts.

### Step 0: Create the Project Folder

Create a folder named `p01_lastname_firstname` for all project files.

### Step 1: Design the Database

Design a schema with the following tables and columns. Use `NOT NULL` for required values and `CHECK` constraints for the listed choices and price limits.

#### user

- `user_id`: INTEGER PRIMARY KEY
- `name`: TEXT, required
- `email`: TEXT, required and unique
- `subscription_type`: TEXT, required; “Basic”, “Standard”, or “Premium”

#### game

- `game_id`: INTEGER PRIMARY KEY
- `title`: TEXT, required
- `genre`: TEXT, required
- `release_date`: TEXT, required; use `YYYY-MM-DD`
- `rating`: TEXT, required; “Everyone”, “Teen”, or “Mature”
- `rental_price`: REAL, required and greater than or equal to zero
- `purchase_price`: REAL, required and greater than or equal to zero

A price of zero represents a free game.

Some games have multiple genres separated by semicolons, such as “Action; FPS”. Keep these values as provided and account for them in genre searches.

#### library

Each row records one purchase or rental.

- `library_id`: INTEGER PRIMARY KEY
- `user_id`: INTEGER, required; foreign key referencing `user.user_id`
- `game_id`: INTEGER, required; foreign key referencing `game.game_id`
- `purchase_type`: TEXT, required; “Purchase” or “Rental”
- `purchase_date`: TEXT, required; the purchase or rental date
- `launch_date`: TEXT; the first launch date, or NULL if not yet launched
- `expiry_date`: TEXT; required for rentals and NULL for purchases

Use `YYYY-MM-DD` for all dates. For rentals, manually set `expiry_date` to 30 days after `purchase_date`; automatic calculation is not required. A rental is active from its rental date up to, but not including, its expiry date.

### Step 2: Create the ER Diagram

Draw an ER diagram on paper using Crow’s Foot notation. Include table names, columns, data types, constraints, and relationship cardinalities.

Photograph or scan it and save it as `erd.png`, `erd.jpeg`, or `erd.pdf`.

### Step 3: Create the Database

Write `schema.sql` to create the tables and constraints. Start with `PRAGMA foreign_keys = ON;`, followed by `DROP TABLE IF EXISTS` statements. Drop `library` before `user` and `game` so you can rerun the script without foreign key conflicts. Rerunning this script deletes existing table data.

### Step 4: Populate the Database

1.  Copy [`random_users.csv`](random_users.csv) and [`random_games.csv`](random_games.csv) into your project folder.
2.  Record the entire data-loading process in `add_data.sql`, in this order:
    - Enable foreign key enforcement with `PRAGMA foreign_keys = ON;`.
    - Create a staging table for each CSV, matching its column names and order.
    - Import each CSV into its staging table
    - Use `INSERT INTO ... SELECT` with explicit destination column lists
    - Drop both staging tables.
    - Insert 10 library records using existing user and game IDs. Include purchases, active rentals, expired rentals, and at least one rental whose first launch date is after its expiry date. Give at least one user two different purchased games and leave at least two `launch_date` values NULL. Review Step 5 so your data supports the queries.
3.  From your project folder, open `game_platform.db` in the SQLite command-line shell and run `.read add_data.sql`.

*Note*: The CSV files have no ID columns, so they cannot be imported directly into `user` and `game` using `.import`. The staging tables let you load the CSV data before SQLite assigns primary keys in the destination tables.

Keep all data-loading SQL statements and `.import` commands in `add_data.sql`; do not use a separate library insertion file.

To repeat the full data load, first run `.read schema.sql` to reset the tables.

### Step 5: Write SQL Queries

Write and execute one query for each question. Save them as `q01.sql` through `q10.sql`, matching the order below. Use the current date to identify active and expired rentals. Run these queries before the maintenance tasks in Step 6. For revenue, use the game’s rental or purchase price as appropriate; assume prices have not changed.

1.  List all users and their subscription types.
2.  Find the titles of all games whose genres include “Action”.
3.  Retrieve all active rentals.
4.  Calculate the combined total revenue from purchases and rentals.
5.  Display the names of users who own the most games, including ties. Count purchases only.
6.  List all games owned by users with a “Premium” subscription. Count purchases only.
7.  Display all games released after 2020, sorted by release date, newest first.
8.  Calculate the average rental price and average purchase price of games whose genres include “Horror”.
9.  List users who have purchased at least two different games, with their game counts. Use `GROUP BY` and `HAVING`.
10. List users who first launched a rented game after it expired.

### Step 6: Maintain and Validate the Data

#### Update and Delete Records

Write `maintenance.sql`. Start with `PRAGMA foreign_keys = ON;` and include these tasks in order:

1.  List library records with no first launch date.
2.  Upgrade one “Basic” or “Standard” user to “Premium”.
3.  Set the first launch date for one unlaunched game. Choose a purchase or an active rental and use a date on or after its purchase date. For a rental, the launch date must also be before its expiry date.
4.  Insert a fictional test user with a unique `@example.com` email address, then insert one library record referencing that user and an existing game.
5.  Delete the test user’s library record and delete the test user.

Use clauses in every `UPDATE` and `DELETE` so only the intended rows change.

Include `SELECT` statements to show the affected rows before and after each change. Leave the original 10 library records intact.

Run `.read maintenance.sql`. At the end of the file, use SQL comments (`--`) to explain why the test user’s library record must be deleted before the user.

Include row-count queries to confirm that the database still contains 50 users, 100 games, and 10 library records.

#### Test Constraints

Create `constraint_tests.sql`, starting with `PRAGMA foreign_keys = ON;`. Write one `INSERT` statement for each test:

1.  Add a user with an email address that already exists.
2.  Add a user with a subscription type outside the allowed choices.
3.  Add a library record referencing a user ID that does not exist.

Supply valid values for all other columns so each test isolates the intended constraint. Run each statement individually and record the actual error message as a SQL comment above it. Then comment out the failing statement so the file can be run without errors. None of these tests should add data.

### Step 7: Record a Reflection

Record and submit an approximately two-minute screen recording showing your database. Explain or Answer:

- Your approach to designing the schema.
- Two problems you overcame and how you solved them.
- The “coolest” thing you learned.
- What difficulty does storing multiple genres in one column create when searching? How could it be improved?

Speak naturally in your own words. Don’t read from a generated script.

Upload the video to the video assignment.

## Submission Checklist

Include these files in `p01_lastname_firstname`:

- `game_platform.db`
- `schema.sql`
- `add_data.sql`
- `maintenance.sql` and `constraint_tests.sql`
- `random_users.csv` and `random_games.csv`
- All ten query files: `q01.sql` through `q10.sql`
- `erd.png`, `erd.jpeg`, or `erd.pdf`

Close the database connection, compress the folder as `p01_lastname_firstname.zip`, and upload it to the assignment submission folder.

## Grading Rubric (15 Points)

| Criterion        | Weight | Requirements                                                                  |
|------------------|--------|-------------------------------------------------------------------------------|
| Database design  | 3      | Correct schema, demonstrated constraint checks, and genre design explanation. |
| ER diagram       | 3      | Crow’s Foot relationships, columns, data types, and constraints.              |
| Data population  | 1      | Complete, realistic data that supports the queries.                           |
| SQL queries      | 5      | Correct queries, targeted updates and deletes, and verification results.      |
| Reflection video | 3      | Clear, personal explanation of the approach, challenges, and learning.        |

All components are graded on a 5 point Scale:

| Point | Description                                                                   |
|-------|-------------------------------------------------------------------------------|
| 5     | Demonstrates mastery answer is near perfect.                                  |
| 4     | Demonstrates Understanding, answer has small execution error                  |
| 3     | Demonstrates partial understanding, answer has logical or understanding error |
| 1     | Has a hint of understanding, but the answer is wrong                          |
| 0     | No answer or incomprehensible                                                 |