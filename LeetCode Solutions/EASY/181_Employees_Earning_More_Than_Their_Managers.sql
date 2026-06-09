/*
181. Employees Earning More Than Their Managers
Table: Employee

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| salary      | int     |
| managerId   | int     |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the ID of an employee, their name, salary, and the ID of their manager.
 

Write a solution to find the employees who earn more than their managers.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Employee table:
+----+-------+--------+-----------+
| id | name  | salary | managerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | Null      |
| 4  | Max   | 90000  | Null      |
+----+-------+--------+-----------+
Output: 
+----------+
| Employee |
+----------+
| Joe      |
+----------+
Explanation: Joe is the only employee who earns more than his manager.
*/


-- Postgress Query

    SELECT name 
    FROM Employee e1
    SELF JOIN Employee e2 ON e1.id=e2.managerId
    WHERE e1.salary > e2.salary;

-- Details
/*
- we need to get name of employees whose Salary is greater than their manager.
- we need to have two tables one with employee details and one with manager details.
- In Order to get two tables to do comparison we can do self join.
- after doing self join we have now two tables one with employee details and one with their manager details
*/


-- Execution Order
/*
1- First we get Employee Table using "FROM EMPLOYEE e1"
2- we get manager details using self Join "SELF JOIN EMPLOYEE e2 on e1.id=e2.managerId"
3- now we have two tables one with employee details and one with manager details
4- we use where to do the comparison Using COMParison Operator.
*/
