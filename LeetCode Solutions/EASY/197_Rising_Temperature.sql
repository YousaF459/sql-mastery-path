/*
197. Rising Temperature
Table: Weather

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id is the column with unique values for this table.
There are no different rows with the same recordDate.
This table contains information about the temperature on a certain day.
 

Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday).

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Weather table:
+----+------------+-------------+
| id | recordDate | temperature |
+----+------------+-------------+
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |
+----+------------+-------------+
Output: 
+----+
| id |
+----+
| 2  |
| 4  |
+----+
Explanation: 
In 2015-01-02, the temperature was higher than the previous day (10 -> 25).
In 2015-01-04, the temperature was higher than the previous day (20 -> 30).
*/


-- postgress query
SELECT w1.id
FROM Weather AS w1
JOIN Weather AS w2
On DATEDIFF(w1.recordDate,w2.recordDate)=1
WHERE w1.temperature > w2.temperature;

-- Details
/*
- we need to compare two dates temperatures.
- we do Self join to get all the cartesian products.
- Then using ON we check which date in table 2 is one date previous
- then we check if our rows temperature is greeater than previuos row data we get that

*/


-- Execution Order
/*
1- First we do Join and get a final table.
2- Cross join is done so for each row it is check against each row in table 2 (CONCEPTUALLY).
3- ON condition is executed and we get rows with previos date for current row in table 1.
4- all data is returned with row in table 1 with previous date from table 2.
5- then we apply where condition.
*/