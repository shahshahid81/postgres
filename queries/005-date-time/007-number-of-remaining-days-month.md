# SQL Exercise: Work out the number of days remaining in the month

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

For any given timestamp, work out the number of days remaining in the month. The current day should count as a whole day, regardless of the time. Use '2012-02-11 01:00:00' as an example timestamp for the purposes of making the answer. Format the output as a single interval value.

## Expected Output:

| Remaining |
| --------- |
| 19 days   |

## Answer:

```sql
SELECT
  date_trunc(
    'month',
    date_value + Interval '1 month'
  ) - date_trunc('day', date_value) as remaining
FROM
  (
    select
      '2012-02-11 01:00:00'::timestamp as date_value
  ) data;
```
