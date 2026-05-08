
/*
183. Customers Who Never Order

Table: Customers

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the ID and name of a customer.
 

Table: Orders

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| customerId  | int  |
+-------------+------+
id is the primary key (column with unique values) for this table.
customerId is a foreign key (reference columns) of the ID from the Customers table.
Each row of this table indicates the ID of an order and the ID of the customer who ordered it.
 

Write a solution to find all customers who never order anything.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Customers table:
+----+-------+
| id | name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+
Orders table:
+----+------------+
| id | customerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+
Output: 
+-----------+
| Customers |
+-----------+
| Henry     |
| Max       |
+-----------+
*/


-- POSTGREES QUERY

SELECT c.name as Customers
FROM Customers AS c
LEFT JOIN Orders AS o
ON c.id=o.customerId
WHERE o.customerId IS NULL;

-- DETAILS
/*
SO FIRST we have to get the data from which we can filter
so first we get Customer table adn Order Table
Now we want name of cusotmer whose id is not in Order Table
so we do left join to get name of customer for which we have id in order table and also customer for 
which we dont have id in Order table
after taht we have both table combined and have order table columns null for which there was no id
now we can just filter where customerid IS NULL;
*/

-- Query Execution
/*
1- First we get rows from customer
2- Then we check for matching rows in Order base on c.id=0.customerID
3-we add both mathching and non matching rows of Customer table where order columns are null and not null
4- we filter rows where customer id IS NULL. 

*/
