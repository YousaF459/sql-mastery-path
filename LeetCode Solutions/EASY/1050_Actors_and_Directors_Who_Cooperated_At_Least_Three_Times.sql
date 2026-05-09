
/*

1050. Actors and Directors Who Cooperated At Least Three Times

Table: ActorDirector

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| actor_id    | int     |
| director_id | int     |
| timestamp   | int     |
+-------------+---------+
timestamp is the primary key (column with unique values) for this table.
 

Write a solution to find all the pairs (actor_id, director_id) where the actor has cooperated with the director at least three times.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
ActorDirector table:
+-------------+-------------+-------------+
| actor_id    | director_id | timestamp   |
+-------------+-------------+-------------+
| 1           | 1           | 0           |
| 1           | 1           | 1           |
| 1           | 1           | 2           |
| 1           | 2           | 3           |
| 1           | 2           | 4           |
| 2           | 1           | 5           |
| 2           | 1           | 6           |
+-------------+-------------+-------------+
Output: 
+-------------+-------------+
| actor_id    | director_id |
+-------------+-------------+
| 1           | 1           |
+-------------+-------------+
Explanation: The only pair is (1, 1) where they cooperated exactly 3 times.
*/



-- PostgreSQL query

SELECT actor_id,director_id 
FROM ActorDirector 
GROUP BY actor_id,director_id 
HAVING COUNT(*) >= 3;


-- DETAILS
/*
we take all data of actor director table then we use group by on actorid and directorid columns
so now we have split table into groups . So Now rows are like this (MENTAL Model):
actor id    director id
1           1 (0,1,2)
1           2 (3,4)
2           1 (5,6)
After group by we use 'having' Condition to get rows count from every group like 1 group has count 3
Cause of (0,1,2)
*/

-- EXECUTION
/*
1-First we get all rows of ActorDirector Table Using 'FROM' Keyword.
2-GROUP BY Make Groups From Two Columns (actor_id,director_id )
3- WE use 'HAVING' ON these Groups to get count of rows in Groups
4- we get actor_id,director_id row which satisfy the condition HAVING COUNT(*) >= 3;
*/