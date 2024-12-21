# SQL Exercise: Work out the number of seconds between timestamps

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

Work out the number of seconds between the timestamps '2012-08-31 01:00:00' and '2012-09-02 00:00:00'

## Expected Output:

| Date Part |
| --------- |
| 169200    |

## Answer:

```sql
SELECT
  ROUND(
    EXTRACT(
      epoch
      from
        '2012-09-02'::timestamp - '2012-08-31 01:00:00'::timestamp
    )
  ) as date_part;
```
