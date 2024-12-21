# SQL Exercise: Work out the end time of bookings

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

Return a list of the start and end time of the last 10 bookings (ordered by the time at which they end, followed by the time at which they start) in the system.

## Expected Output:

| Start Time          | End Time            |
| ------------------- | ------------------- |
| 2013-01-01 15:30:00 | 2013-01-01 16:00:00 |
| 2012-09-30 19:30:00 | 2012-09-30 20:30:00 |
| 2012-09-30 19:00:00 | 2012-09-30 20:30:00 |
| 2012-09-30 19:30:00 | 2012-09-30 20:00:00 |
| 2012-09-30 19:00:00 | 2012-09-30 20:00:00 |
| 2012-09-30 19:00:00 | 2012-09-30 20:00:00 |
| 2012-09-30 18:30:00 | 2012-09-30 20:00:00 |
| 2012-09-30 18:30:00 | 2012-09-30 20:00:00 |
| 2012-09-30 19:00:00 | 2012-09-30 19:30:00 |
| 2012-09-30 18:30:00 | 2012-09-30 19:30:00 |

## Answer:

```sql
SELECT
  starttime,
  starttime + (slots * 30 || ' minutes')::interval as endtime
from
  cd.bookings bks
ORDER BY
  endtime desc,
  starttime desc
limit
  10;
```
