/*
1978. Employees Whose Manager Left the Company
Table: Employees

+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| employee_id | int      |
| name        | varchar  |
| manager_id  | int      |
| salary      | int      |
+-------------+----------+
In SQL, employee_id is the primary key for this table.
This table contains information about the employees, their salary, and the ID of their manager. Some employees do not have a manager (manager_id is null). 
 

Find the IDs of the employees whose salary is strictly less than $30000 and whose manager left the company. When a manager leaves the company, their information is deleted from the Employees table, but the reports still have their manager_id set to the manager that left.

Return the result table ordered by employee_id.

The result format is in the following example.

 

Example 1:

Input:  
Employees table:
+-------------+-----------+------------+--------+
| employee_id | name      | manager_id | salary |
+-------------+-----------+------------+--------+
| 3           | Mila      | 9          | 60301  |
| 12          | Antonella | null       | 31000  |
| 13          | Emery     | null       | 67084  |
| 1           | Kalel     | 11         | 21241  |
| 9           | Mikaela   | null       | 50937  |
| 11          | Joziah    | 6          | 28485  |
+-------------+-----------+------------+--------+
Output: 
+-------------+
| employee_id |
+-------------+
| 11          |
+-------------+

Explanation: 
The employees with a salary less than $30000 are 1 (Kalel) and 11 (Joziah).
Kalel's manager is employee 11, who is still in the company (Joziah).
Joziah's manager is employee 6, who left the company because there is no row for employee 6 as it was deleted.
*/

-- postgress query
SELECT e.employee_id
FROM Employees AS e 
LEFT JOIN Employees AS m
ON e.manager_id=m.employee_id
WHERE
e.manager_id IS NOT null
AND m.employee_id IS null
AND e.salary < 30000
ORDER BY e.employee_id;


-- Details
/*

- we have to find employee whose manager has left adn their salary is less than 30000.
- we do self join with table.
- First employee must ahve a manager so we can check his amnager ahs left whose manager employee id will be null.

*/

-- Execution Order
/*

1- Frist we do Left Join "ON e.manager_id=m.employee_id" so for each rows his manager row data will be showing on right if no manger then data row will be null for all columns
2- then we check if e.manager_id IS NOT null so there is a manger in left table
3- then m.employee_id IS null to check that employee has no data means he has left.
4- and salary is less than 30000

*/