/*
196. Delete Duplicate Emails

Table: Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table contains an email. The emails will not contain uppercase letters.
 

Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.

For SQL users, please note that you are supposed to write a DELETE statement and not a SELECT one.

For Pandas users, please note that you are supposed to modify Person in place.

After running your script, the answer shown is the Person table. The driver will first compile and run your piece of code and then show the Person table. The final order of the Person table does not matter.

The result format is in the following example.

 

Example 1:

Input: 
Person table:
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
Output: 
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
+----+------------------+
Explanation: john@example.com is repeated two times. We keep the row with the smallest Id = 1.
*/


-- Postgreess query
DELETE FROM Person p1
JOIN Person p2
ON p1.email=p2.email AND p1.id > p2.id;

-- Detail
/*
- we have to delete duplicate emails
- use Self Join to make two sperate table so we can compare
- now when there are two tables after using SELF JOIN.
- from table p1 we check for every record if same email and p1.id > p2.id means there exsit a record in p1 in upper rows
- delete the lower rows.
*/

-- Execution Order
/*
1- We have to make two separete tables to comparte so use Self Join .
2- now we have to check somehow for every record if same duplciate exist in upper rows.
3- so after joining on email  now we have two separete tables.
4- so for every record in p1 we cehck in p2 if duplicate exist in ujpper rows using id.
5- at end we just delete it usinf DELETE FROM PERSON.
*/