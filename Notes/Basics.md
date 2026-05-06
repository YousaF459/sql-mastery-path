
# ✅ Difference between ' ' and " " in SQL

- ' ' → used for string values
- " " → used for column or table names (identifiers)

## 1- Single Quotes ''  is used for actual data values

Example:
SELECT * FROM Users
WHERE name ='saad';

## 2- Double Quotes are used for identifiers like column name or table names
especially when:
name has spaces
name is case-sensitive
name is a reserved keyword

Example :- 
SELECT "first name","LasT name"
FROM "USERS";

---

#  Column renaming OR TABLE renaming ALIAS
We can used ALIAS USING ( AS ) for Column Names or Table Names

SELECT name AS "Full Name" 
FROM "USERS Tables" AS "USERS" ;

WE USE TABLE ALIAS AS Especially when using Joins.

## Table Alias

Table alias is a short name for a table.

Example:
SELECT u.name
FROM users u;

Used in joins:
SELECT u.name, o.amount
FROM users u
JOIN orders o
ON u.id = o.user_id;

--- 


# ✅ CONCAT Function CONCAT()
Concat function is used to combine values from two columns with a separator(optional)

CONCAT(column1,' ',column2)

SELECT CONCAT('Hello', ' ', 'World');
Hello World

We can also name the ouput coulmn using AS
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM users;


Example:
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM users;

Note:
- In PostgreSQL, use || instead of CONCAT

---

# DIFFERENE BETWEEN SCALAR ADN AGGREGATE FUNCTIONS

## 🔹 1. Scalar Functions
work on each row individually
return one putput per row

## EXAMPLES
SELECT UPPER(name),LENGTH(name)
FROM USERS;

UPPER(name) → converts each row’s name to uppercase
LENGTH(name) → length of each name

✔ Output has same number of rows


## 🔹 2. AGGREGATES FUNCTIONS
WORK ON MULTIPLE ROWS (a group)
RETURN ONE OUTPUT FOR GROUP

## EXAMPLES
SELECT COUNT(*),AVG(SALARy)
FROM EMPLOYEES;

COUNT(*) -> this counts total rows value
AVG(SALARY) -> this return one avg values

✔ Output = single row (summary)

---

# COMMENTS IN SQL

## SINGLE LINE COMMENTS

-- TWO DASHED TO COMMENT A LINE

-- This is a comment
SELECT * FROM users;


## MULTIPLE LINE COMMENTS
Use /* ... */

/*
This is a multi-line comment
Used to explain complex queries
*/
SELECT * FROM users;

Used to explain queries and improve readability.

---

# ✅ AND vs OR in SQL

### 🔹 1. AND → all conditions must be true
SELECT *
FROM employees
WHERE salary > 50000 AND department = 'IT';

Returns rows where:

salary > 50000
AND
department is IT

✔ Both must be true

### 🔹 2. OR → at least one condition must be true
SELECT *
FROM employees
WHERE salary > 50000 OR department = 'IT';

Returns rows where:

salary > 50000
OR
department is IT

✔ Even one true → row included


--- 

# NOT KEYWORD
Not is used to negate a condition 

SELECT *
FROM table_name
WHERE NOT condition;

### Example 1
SELECT *
FROM employees
WHERE NOT department = 'IT';

👉 Means:

Show employees NOT in IT department

### Simple way to remember
NOT = opposite condition
Think: “exclude this”


---

# Difference: Logical vs Comparison Operators

### Logical operators 
are used to combine multiple conditions

They work on:

TRUE / FALSE results of conditions

combine true adn false results

### Comparison operators
used to compare two values

they return false or true
work on Compare values and single condition.

---
# SQL Operator Precedence (Simple Order)

👉 Highest to lowest:

Brackets ()
DMAS
Comparisn operators > = < 
NOT
AND
OR
