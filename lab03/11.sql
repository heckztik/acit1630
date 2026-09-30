-- In `11.sql`, display each school name, its per-pupil expenditure, and its graduation rate. 
-- Assume that a school spends the same amount per pupil as its district. 
-- Order the results by per-pupil expenditure from greatest to least, then by school name.
SELECT "schools"."name", "expenditures"."per_pupil_expenditure", "graduation_rates"."graduated"
FROM "schools"
JOIN "expenditures"
    ON "expenditures"."district_id" = "schools"."district_id"
JOIN "graduation_rates"
    ON "graduation_rates"."school_id" = "schools"."id"
ORDER BY "expenditures"."per_pupil_expenditure" DESC, "schools"."name";