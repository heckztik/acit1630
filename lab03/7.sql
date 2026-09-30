-- In `7.sql`, find the names of all schools, public or charter, in the school district named `Cambridge`. The city of Cambridge contains several districts, so match the district name rather than assuming a district ID.
SELECT "name"
FROM "schools"
WHERE "district_id" = (
    SELECT "id"
    FROM "districts"
    WHERE "name" = 'Cambridge'
)