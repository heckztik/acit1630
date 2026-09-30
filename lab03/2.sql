-- In `2.sql`, find the names of school districts that are no longer operational. A non-operational district has `(non-op)` at the end of its name.
SELECT "name"
FROM "districts"
WHERE "name" LIKE '%(non-op)';