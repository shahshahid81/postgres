# SQL Exercise: Produce a timestamp for 1 a.m. on the 31st of August 2012

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

Produce a timestamp for 1 a.m. on the 31st of August 2012.

## Expected Output:

| Timestamp           |
| ------------------- |
| 2012-08-31 01:00:00 |

## Answer:

```sql
SELECT
  '2012-08-31 01:00:00'::timestamp;
```
