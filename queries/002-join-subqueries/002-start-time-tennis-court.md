# SQL Exercise: Work out the start times of bookings for tennis courts

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'? Return a list of start time and facility name pairings, ordered by the time.

## Expected Output:

| start               | name           |
| ------------------- | -------------- |
| 2012-09-21 08:00:00 | Tennis Court 1 |
| 2012-09-21 08:00:00 | Tennis Court 2 |
| 2012-09-21 09:30:00 | Tennis Court 1 |
| 2012-09-21 10:00:00 | Tennis Court 2 |
| 2012-09-21 11:30:00 | Tennis Court 2 |
| 2012-09-21 12:00:00 | Tennis Court 1 |
| 2012-09-21 13:30:00 | Tennis Court 1 |
| 2012-09-21 14:00:00 | Tennis Court 2 |
| 2012-09-21 15:30:00 | Tennis Court 1 |
| 2012-09-21 16:00:00 | Tennis Court 2 |
| 2012-09-21 17:00:00 | Tennis Court 1 |
| 2012-09-21 18:00:00 | Tennis Court 2 |

## Answer:

```sql
select
  cd.bookings.starttime as start,
  cd.facilities.name as name
from
  cd.facilities
  INNER JOIN cd.bookings ON cd.facilities.facid = cd.bookings.facid
where
  cd.bookings.starttime >= '2012-09-21'
  and cd.bookings.starttime < '2012-09-22'
  AND cd.facilities.name ILIKE '%tennis court%'
ORDER BY
  start;
```
