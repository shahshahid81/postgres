# SQL Exercise: Subtract timestamps from each other

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

Find the result of subtracting the timestamp '2012-07-30 01:00:00' from the timestamp '2012-08-31 01:00:00'

## Expected Output:

| Interval |
| -------- |
| 32 days  |

## Answer:

```sql
SELECT
  '2012-08-31 01:00:00'::timestamp - '2012-07-30 01:00:00'::timestamp as interval;
```
