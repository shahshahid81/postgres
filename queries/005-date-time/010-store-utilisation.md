# SQL Exercise: Work out the utilisation percentage for each facility by month

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

Work out the utilisation percentage for each facility by month, sorted by name and month, rounded to 1 decimal place. Opening time is 8am, closing time is 8.30pm. You can treat every month as a full month, regardless of if there were some dates the club was not open.

## Expected Output:

| Name            | Month               | Utilisation |
| --------------- | ------------------- | ----------- |
| Badminton Court | 2012-07-01 00:00:00 | 23.2        |
| Badminton Court | 2012-08-01 00:00:00 | 59.2        |
| Badminton Court | 2012-09-01 00:00:00 | 76.0        |
| Massage Room 1  | 2012-07-01 00:00:00 | 34.1        |
| Massage Room 1  | 2012-08-01 00:00:00 | 63.5        |
| Massage Room 1  | 2012-09-01 00:00:00 | 86.4        |
| Massage Room 2  | 2012-07-01 00:00:00 | 3.1         |
| Massage Room 2  | 2012-08-01 00:00:00 | 10.6        |
| Massage Room 2  | 2012-09-01 00:00:00 | 16.3        |
| Pool Table      | 2012-07-01 00:00:00 | 15.1        |
| Pool Table      | 2012-08-01 00:00:00 | 41.5        |
| Pool Table      | 2012-09-01 00:00:00 | 62.8        |
| Pool Table      | 2013-01-01 00:00:00 | 0.1         |
| Snooker Table   | 2012-07-01 00:00:00 | 20.1        |
| Snooker Table   | 2012-08-01 00:00:00 | 42.1        |
| Snooker Table   | 2012-09-01 00:00:00 | 56.8        |
| Squash Court    | 2012-07-01 00:00:00 | 21.2        |
| Squash Court    | 2012-08-01 00:00:00 | 51.6        |
| Squash Court    | 2012-09-01 00:00:00 | 72.0        |
| Table Tennis    | 2012-07-01 00:00:00 | 13.4        |
| Table Tennis    | 2012-08-01 00:00:00 | 39.2        |
| Table Tennis    | 2012-09-01 00:00:00 | 56.3        |
| Tennis Court 1  | 2012-07-01 00:00:00 | 34.8        |
| Tennis Court 1  | 2012-08-01 00:00:00 | 59.2        |
| Tennis Court 1  | 2012-09-01 00:00:00 | 78.8        |
| Tennis Court 2  | 2012-07-01 00:00:00 | 26.7        |
| Tennis Court 2  | 2012-08-01 00:00:00 | 62.3        |
| Tennis Court 2  | 2012-09-01 00:00:00 | 78.4        |

## Answer:

```sql
WITH data AS (
  SELECT
    fcs.name as name,
    date_trunc('month', bks.starttime) as month,
    SUM(slots) * 30 as total_slot_minutes
  from
    cd.bookings bks
    INNER JOIN cd.facilities fcs ON fcs.facid = bks.facid
  GROUP BY
    name,
    month
)
SELECT
  name,
  month,
  ROUND(
    total_slot_minutes * 100 / (
      EXTRACT(
        days
        FROM
          (month + interval '1 month') - month
      ) 
      -- Since store is open between 8 am to 8.30 pm, we will consider 25 slots of 30 minutes
      * 25 * 30
    ),
    1
  ) as utilisation
from
  data
ORDER BY
  name,
  month;
```
