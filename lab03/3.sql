-- In `3.sql`, find the average per-pupil expenditure across all districts. Name the output column `Average District Per-Pupil Expenditure`. The `per_pupil_expenditure` column already contains each district's average expenditure, and each district should be weighted equally.
SELECT AVG("per_pupil_expenditure") AS 'Average District Per-Pupil Expenditure'
FROM "expenditures";
