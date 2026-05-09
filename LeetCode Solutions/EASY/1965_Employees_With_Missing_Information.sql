
/*
1965. Employees With Missing Information
Table: Employees

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| employee_id | int     |
| name        | varchar |
+-------------+---------+
employee_id is the column with unique values for this table.
Each row of this table indicates the name of the employee whose ID is employee_id.
 

Table: Salaries

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| employee_id | int     |
| salary      | int     |
+-------------+---------+
employee_id is the column with unique values for this table.
Each row of this table indicates the salary of the employee whose ID is employee_id.
 

Write a solution to report the IDs of all the employees with missing information. The information of an employee is missing if:

The employee's name is missing, or
The employee's salary is missing.
Return the result table ordered by employee_id in ascending order.

The result format is in the following example.

 

Example 1:

Input: 
Employees table:
+-------------+----------+
| employee_id | name     |
+-------------+----------+
| 2           | Crew     |
| 4           | Haven    |
| 5           | Kristian |
+-------------+----------+
Salaries table:
+-------------+--------+
| employee_id | salary |
+-------------+--------+
| 5           | 76071  |
| 1           | 22517  |
| 4           | 63539  |
+-------------+--------+
Output: 
+-------------+
| employee_id |
+-------------+
| 1           |
| 2           |
+-------------+
Explanation: 
Employees 1, 2, 4, and 5 are working at this company.
The name of employee 1 is missing.
The salary of employee 2 is missing.
*/


-- Postgress Query


SELECT employee_id 
FROM Employees AS e
FULL OUTER JOIN Salaries AS s USING(employee_id)
WHERE name IS NULL OR salary IS NULL
ORDER BY employee_id ASC;


/*

SELECT employee_id
FROM (
SELECT employee_id FROM Employees
UNION ALL
SELECT employee_id FROM Salaries
)
GROUP BY employee_id
HAVING COUNT(*) = 1
ORDER BY employee_id
*/


-- DETAILS
/*
WE want to get employee_id which are not in both table.
We can do it using UNION ALL on Employee_id in both table we get the column with all ids using union all on column employee id.
then we group by using employee_id after that we check the count which count is 1 has appeared in only one column
*/

-- EXECUTION
/*
1- FIRST GET ALL ROWS USING 'FROM'.
2- GET ALL ROWS IN TABLE EMPLOYEE AND SALARY TABLE DATA OF COLUMN EMPLOYEE_ID
3- THEN WE USE GROUP BY EMPLYEE_ID COLUMN SO NOW DATA IS SPLIT INTO GROUPS.
4- WE COUNT ROWS ITEMS COUNT IN GROUPS
5- HAVING FILTER GROUP WITH ROWS COUNT =1
*/