-- In `1.sql`, find the names and cities of all traditional public schools in Massachusetts. Do not include charter schools. The `type` column in the `schools` table distinguishes public schools from charter schools.
SELECT "name", "city"
FROM "schools"
WHERE "type" = 'Public School';
