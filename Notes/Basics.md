
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

Highest to lowest:

Brackets ()
NOT
AND
OR

---

# NULL IN SQL
in sql null means "missing/unknown value"
we can use = or != with NULL.

COMMON MISTAKE :-
SELECT * FROM USERS
WHERE salary=null;

NULL = NULL → not TRUE
NULL != NULL → also not TRUE

null = unknow value
we cannot check unknow with anything

### CORRECT WAY
🔹 Check for NULL
SELECT *
FROM employees
WHERE salary IS NULL;
🔹 Check for NOT NULL
SELECT *
FROM employees
WHERE salary IS NOT NULL;

### NULL Checking

Use:
- IS NULL
- IS NOT NULL

Never use:
- = NULL
- != NULL

Reason:
NULL means unknown value, so it cannot be compared.

---
# BETWEEN
WE CAN use between to check if soemthing lies in a range.

### EXAMPLE
SELECT *
FROM table_name
WHERE column BETWEEN value1 AND value2;

### Example (dates)
SELECT *
FROM orders
WHERE order_date BETWEEN '2025-01-01' AND '2025-12-31';

---

# IN Keyword in SQL

IF we have to check a value exist in  a list of multiple values

### EXAMPLE 1
SELECT * FROM USERS
WHERE column  IN (10,20,30);

### Example 2 
SELECT *
FROM employees
WHERE department IN ('IT', 'HR', 'Finance');

### EXAMPLE 3
NOT IN
SELECT *
FROM employees
WHERE department NOT IN ('IT', 'HR');


--- 

# LIKE KEYWORD
LIKE is used to search patterns in a string
It’s important for filtering names, emails 

### EXAMPLE
SELECT *
FROM table_name
WHERE column LIKE pattern;

% → any number of characters
SELECT *
FROM employees
WHERE name LIKE 'A%';
Starts with A


_ → single character
WHERE name LIKE 'A__';

Matches:
Ali  (A + 2 letters)

NOT LIKE
SELECT *
FROM employees
WHERE name NOT LIKE 'A%';

### Using ILIKE (case-insensitive)
SELECT *
FROM employees
WHERE name ILIKE 'a%';

Matches:
Ali 
ali 
AHMAD 

---

# DISTINCT
it is used to filter duplciates
DISTINCT = “only unique values”

SELECT DISTINCT column_name
FROM table_name;

Used to remove duplicate values from query results.

Example:
SELECT DISTINCT city
FROM employees;

With multiple columns:
SELECT DISTINCT department, city
FROM employees;

---