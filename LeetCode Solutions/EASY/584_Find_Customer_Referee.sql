
/*
584. Find Customer Referee
Table: Customer

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| referee_id  | int     |
+-------------+---------+
In SQL, id is the primary key column for this table.
Each row of this table indicates the id of a customer, their name, and the id of the customer who referred them.
 

Find the names of the customer that are either:

referred by any customer with id != 2.
not referred by any customer.
Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Customer table:
+----+------+------------+
| id | name | referee_id |
+----+------+------------+
| 1  | Will | null       |
| 2  | Jane | null       |
| 3  | Alex | 2          |
| 4  | Bill | null       |
| 5  | Zack | 1          |
| 6  | Mark | 2          |
+----+------+------------+
Output: 
+------+
| name |
+------+
| Will |
| Jane |
| Bill |
| Zack |
+------+

*/

-- POSTGRESS QUERY

SELECT name
FROM Customer
WHERE referee_id IS NULL
OR referee_id != 2;

-- Details
/*
WE HAVE two codnitions to check in refree_id it can be null means referred by  none or
refree_ids not equal to 2 means other than 2 everything is accepted.
*/

-- Query Execution
/*
1-First we get table data using "FROM CUSTOMER"
2- COndition "WHERE " applied on data so filtered rows remain only
3-show "name" column data from filtered rows data
*/