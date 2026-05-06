
# What are JOINS in SQL?

Joins are used to combine data from two or more tables based on a related column.


### 1. INNER JOIN
Returns only matching rows in both tables

SELECT users.name, orders.amount
FROM users
INNER JOIN orders
ON users.id = orders.user_id;

Only users who have orders

### 2. LEFT JOIN

Returns all rows from left table + matching from right

SELECT users.name, orders.amount
FROM users
LEFT JOIN orders
ON users.id = orders.user_id;

All users shown
If no order → NULL


### 3. RIGHT JOIN

Returns all rows from right table

SELECT users.name, orders.amount
FROM users
RIGHT JOIN orders
ON users.id = orders.user_id;

All orders shown
Missing users → NULL

### 4. FULL OUTER JOIN

Returns all rows from both tables

SELECT users.name, orders.amount
FROM users
FULL OUTER JOIN orders
ON users.id = orders.user_id;

Matches + unmatched from both sides


### 5.SELF JOIN in SQL

A SELF JOIN is when a table is joined with itself.
It is used when rows in the same table are related to each other.


SELECT a.column, b.column
FROM table a
JOIN table b
ON a.common_column = b.common_column;

SELECT e.name AS employee,
       m.name AS manager
FROM employees e
JOIN employees m
ON e.manager_id = m.id;


---

## USING clause in SQL

USING is a shortcut for JOINs when both tables have a column with the same name

Basic Syntax
SELECT columns
FROM table1
JOIN table2
USING (common_column);


Example (without USING)
SELECT users.name, orders.amount
FROM users
JOIN orders
ON users.id = orders.user_id;
 Same query using USING
SELECT name, amount
FROM users
JOIN orders
USING (id);