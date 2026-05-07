

SELECT email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;

/*
Execution flow:

1. FROM Person
   - Table is loaded with all rows.

2. GROUP BY email
   - Rows are grouped by email value.
   - All same emails are placed into one group.

3. COUNT(*)
   - For each group, SQL counts how many rows exist.

   Example:
   a@x.com → 3 rows
   b@x.com → 1 row
   c@x.com → 1 row

4. HAVING COUNT(*) > 1
   - Filters groups (not rows).
   - Keeps only groups where count > 1.

   Result:
   a@x.com (3 rows)

5. SELECT email
   - Returns only the email column from remaining groups.
*/