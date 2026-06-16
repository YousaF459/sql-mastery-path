/*
177. Nth Highest Salary
Medium
Topics
premium lock icon
Companies
SQL Schema
Pandas Schema
Table: Employee

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key (column with unique values) for this table.
Each row of this table contains information about the salary of an employee.
 

Write a solution to find the nth highest distinct salary from the Employee table. If there are less than n distinct salaries, return null.

The result format is in the following example.

 

Example 1:

Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
n = 2
Output: 
+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+
Example 2:

Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
+----+--------+
n = 2
Output: 
+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| null                   |
+------------------------+
*/

-- postgrerss query
CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY (
     WITH distinct_rows AS (
        SELECT DISTINCT e.salary
        FROM Employee e
    ),
    rank_rows AS (
        SELECT 
            d.salary,
            ROW_NUMBER() OVER(ORDER BY d.salary DESC) AS row_number
        FROM distinct_rows d
    )
    SELECT r.salary
    FROM rank_rows r
    WHERE r.row_number = N
  );
END;
$$ LANGUAGE plpgsql;


-- Execution Details
/*
- We are finding nth highest distinct salary so if n = 4 we need to get Slary number 4 row.
- First we Just Used Distinct on columns to get only Distinct rows no duplicate row is allowed so we made a CTE To Query it.
- After Getting Distinct Rows we have to give row number to each row so we used Window Function ROW_NUMBER().
- NOW we have filtered Disticnt table with Rows Number Now we can just use row Number = N 
*/