# SQL Exercise: Return a count of bookings for each month

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

Return a count of bookings for each month, sorted by month

## Expected Output:

| Month               | Count |
| ------------------- | ----- |
| 2012-07-01 00:00:00 | 658   |
| 2012-08-01 00:00:00 | 1472  |
| 2012-09-01 00:00:00 | 1913  |
| 2013-01-01 00:00:00 | 1     |

## Answer:

```sql
SELECT
  date_trunc('month', starttime) as month,
  count(*) as count
from
  cd.bookings bks
GROUP BY
  month
ORDER BY
  month;
```
