# LeetCode SQL Notes

## 1729. Find Followers Count

we had follower table with columns user_id adn follower_id
we have to check each user had how many followers.


Pattern:
- GROUP BY + COUNT

Concepts:
- GROUP BY
- COUNT()
- ORDER BY

Learning:
- GROUP BY is required when using COUNT per group
- COUNT(column) counts non-null values

GROUP BY:
- splits rows into groups

COUNT:
- counts rows in each group

Flow:
1. GROUP BY creates groups
2. COUNT works inside each group

Reusable:
- Count orders per customer
- Count employees per department
- Any “count per entity” problem

---