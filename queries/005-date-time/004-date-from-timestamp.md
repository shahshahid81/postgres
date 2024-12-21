# SQL Exercise: Get the day of the month from a timestamp

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

Get the day of the month from the timestamp '2012-08-31' as an integer.

## Expected Output:

| Date Part |
| --------- |
| 31        |

## Answer:

```sql
SELECT EXTRACT(day from '2012-08-31'::timestamp) as date_part;
```
