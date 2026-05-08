/*
Table: Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| personId    | int     |
| lastName    | varchar |
| firstName   | varchar |
+-------------+---------+
personId is the primary key (column with unique values) for this table.
This table contains information about the ID of some persons and their first and last names.
 

Table: Address

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| addressId   | int     |
| personId    | int     |
| city        | varchar |
| state       | varchar |
+-------------+---------+
addressId is the primary key (column with unique values) for this table.
Each row of this table contains information about the city and state of one person with ID = PersonId.
 

Write a solution to report the first name, last name, city, and state of each person in the Person table. If the address of a personId is not present in the Address table, report null instead.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Person table:
+----------+----------+-----------+
| personId | lastName | firstName |
+----------+----------+-----------+
| 1        | Wang     | Allen     |
| 2        | Alice    | Bob       |
+----------+----------+-----------+
Address table:
+-----------+----------+---------------+------------+
| addressId | personId | city          | state      |
+-----------+----------+---------------+------------+
| 1         | 2        | New York City | New York   |
| 2         | 3        | Leetcode      | California |
+-----------+----------+---------------+------------+
Output: 
+-----------+----------+---------------+----------+
| firstName | lastName | city          | state    |
+-----------+----------+---------------+----------+
| Allen     | Wang     | Null          | Null     |
| Bob       | Alice    | New York City | New York |
+-----------+----------+---------------+----------+
Explanation: 
There is no address in the address table for the personId = 1 so we return null in their city and state.
addressId = 1 contains information about the address of personId = 2.
*/

-- Postgress Query


SELECT p.firstName,p.lastName,a.city,a.state
FROM Person AS p
LEFT JOIN Address AS a ON p.personId=a.personId;


--Details
/*
1. We have two tables: Person and Address.

2. personId is the common column that connects both tables.

3. LEFT JOIN returns:
   - all rows from the left table (Person)
   - matching rows from the right table (Address)

4. ON p.personId = a.personId checks which rows are related.

5. If a person does not have an address:
   - the person's data still appears
   - city and state become NULL

6. Table aliases:
   - p = Person
   - a = Address

7. Selected columns:
   - firstName and lastName from Person
   - city and state from Address
*/


-- Execution 
/*
1-First SQL starts with left table 
2- Left  Join check each row of Person table
with Address table using :
column personId a.personId=p.personId
3-if a matching row is found in adress
-combine data from both table
4-if no matching row is found :
-still return person row
-make null in city adn state
5-Finally select return only requested column
*/