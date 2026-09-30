-- In `9.sql`, find the name or names of the school district or districts with the smallest number of pupils. Return only the district name or names.
SELECT "districts"."name"
FROM "districts"
JOIN "expenditures"
    ON "districts"."id" = "expenditures"."district_id"
WHERE "expenditures"."pupils" = (
    SELECT MIN("expenditures"."pupils")
    FROM "expenditures"
);