-- In `6.sql`, find the names of all schools, public or charter, that reported a 100% graduation rate.
SELECT "name"
FROM "schools"
WHERE "id" in (
    SELECT "school_id"  
    FROM "graduation_rates"
    WHERE "graduated" = 100
)