# Lab 3 DESE

## Introduction

The Massachusetts Department of Elementary and Secondary Education (DESE) is responsible for public school services in the Commonwealth, from pre-kindergarten through high school. The database contains information about Massachusetts schools, school districts, expenditures, graduation rates, and staff evaluations.

In the database [dese.db](dese.db), use SQL to answer questions about Massachusetts schools and school districts.

## Lab Instructions

### Preparation

1. Download [dese.db](dese.db).
2. Use `.schema` to inspect the tables and columns.
3. Create an empty text file for each question: `1.sql`, `2.sql`, through `12.sql`. If you are using DB Browser for SQLite, you can write the queries directly in the Execute SQL tab instead.

For each question, write one SQL query that produces the requested result. Do not assume that a particular row has a particular ID. The queries should remain correct if the IDs change. Return only the columns and rows needed to answer the question.

## Questions

1. In `1.sql`, find the names and cities of all traditional public schools in Massachusetts. Do not include charter schools. The `type` column in the `schools` table distinguishes public schools from charter schools.

2. In `2.sql`, find the names of school districts that are no longer operational. A non-operational district has `(non-op)` at the end of its name.

3. In `3.sql`, find the average per-pupil expenditure across all districts. Name the output column `Average District Per-Pupil Expenditure`. The `per_pupil_expenditure` column already contains each district's average expenditure, and each district should be weighted equally.

4. In `4.sql`, find the 10 cities with the most traditional public schools. Return the city and number of public schools, ordered by school count from greatest to least. Break ties alphabetically by city.

5. In `5.sql`, find cities with three or fewer traditional public schools. Return the city and number of public schools, ordered by school count from greatest to least. Break ties alphabetically by city.

6. In `6.sql`, find the names of all schools, public or charter, that reported a 100% graduation rate.

7. In `7.sql`, find the names of all schools, public or charter, in the school district named `Cambridge`. The city of Cambridge contains several districts, so match the district name rather than assuming a district ID.

8. In `8.sql`, display the name of every school district and the number of pupils enrolled in each district. Order the results by district name in ascending order.

9. In `9.sql`, find the name or names of the school district or districts with the smallest number of pupils. Return only the district name or names.

10. In `10.sql`, find the 10 public school districts with the highest per-pupil expenditures. Return each district name and its per-pupil expenditure.

11. In `11.sql`, display each school name, its per-pupil expenditure, and its graduation rate. Assume that a school spends the same amount per pupil as its district. Order the results by per-pupil expenditure from greatest to least, then by school name.

12. In `12.sql`, find public school districts with both above-average per-pupil expenditures and an above-average percentage of teachers rated exemplary. Return the district name, per-pupil expenditure, and exemplary percentage. Order first by exemplary percentage from greatest to least, then by per-pupil expenditure from greatest to least.

## Submissions

1. Put all 12 `.sql` files in a folder named `l03_yourname`.
2. Compress the folder in ZIP format.
3. Name the ZIP file `lab3_firstname.zip`, replacing `firstname` with your own first name. For example, `lab3_john.zip`.
4. Submit the ZIP file to the Learning Hub.

## Grading Rubric

| Criteria                     | Points | Description |
|------------------------------|:------:|-------------|
| Correctness of SQL queries   | 6      | All 12 queries are correct and produce the required results. Partial credit is awarded for mostly correct queries with minor errors or incomplete results. |
| SQL best practices           | 2      | Queries are clear, efficient, well-formatted, and use appropriate SQL features. |
| File organization and naming | 1      | All files are named correctly and included in a properly named ZIP file. |
| Query output relevance       | 1      | Queries return only the data needed to answer each question. |

**Attribution:** The questions are adapted from the [CS50 SQL course](https://cs50.harvard.edu/sql/2024/psets/0/cyberchase/).
