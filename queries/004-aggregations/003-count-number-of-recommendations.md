# SQL Exercise: Count the number of recommendations each member makes.

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

Produce a count of the number of recommendations each member has made. Order by member ID.

## Expected Output:

| recommendedby | count |
| ------------- | ----- |
| 1             | 5     |
| 2             | 3     |
| 3             | 1     |
| 4             | 2     |
| 5             | 1     |
| 6             | 1     |
| 9             | 2     |
| 11            | 1     |
| 13            | 2     |
| 15            | 1     |
| 16            | 1     |
| 20            | 1     |
| 30            | 1     |

## Answer:

```sql
SELECT
  recommendedby,
  count(*) as count
FROM
  cd.members
WHERE
  recommendedby IS NOT NULL
GROUP BY
  recommendedby
ORDER BY
  recommendedby;
```
