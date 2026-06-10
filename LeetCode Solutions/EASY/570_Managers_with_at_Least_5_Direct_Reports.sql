/*
570. Managers with at Least 5 Direct Reports
Table: Employee

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| department  | varchar |
| managerId   | int     |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the name of an employee, their department, and the id of their manager.
If managerId is null, then the employee does not have a manager.
No employee will be the manager of themself.
 

Write a solution to find managers with at least five direct reports.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Employee table:
+-----+-------+------------+-----------+
| id  | name  | department | managerId |
+-----+-------+------------+-----------+
| 101 | John  | A          | null      |
| 102 | Dan   | A          | 101       |
| 103 | James | A          | 101       |
| 104 | Amy   | A          | 101       |
| 105 | Anne  | A          | 101       |
| 106 | Ron   | B          | 101       |
+-----+-------+------------+-----------+
Output: 
+------+
| name |
+------+
| John |
+------+
*/


-- postgress query


SELECT m.name 
FROM Employee AS m JOIN Employee AS e
ON m.id=e.managerId
GROUP BY m.id,m.name
HAVING COUNT(*) >= 5;

-- Details
/*
- First we have to do self join to get a temporary result table with cross join rows.
- now we check for each employee id = manger id in second table we get records of matched rows.
- after getting only matched record we do group by empoyee id and employee name 
- we use having filter to get final name.
*/


-- Execution Order
/*
1- First get a tempory result table with both table using join.
2- we get cross join rows
3- Using ON will filter the rows where id and managerid Match.
4- use group by on new rows.
5- having will filter adn give final name.
*/