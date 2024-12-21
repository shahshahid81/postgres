# SQL Exercise: List the total hours booked per named facility

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

Produce a list of the total number of hours booked per facility, remembering that a slot lasts half an hour. The output table should consist of the facility id, name, and hours booked, sorted by facility id. Try formatting the hours to two decimal places.

## Expected Output:

| Facid | Name            | Total Hours |
| ----- | --------------- | ----------- |
| 0     | Tennis Court 1  | 660.00      |
| 1     | Tennis Court 2  | 639.00      |
| 2     | Badminton Court | 604.50      |
| 3     | Table Tennis    | 415.00      |
| 4     | Massage Room 1  | 702.00      |
| 5     | Massage Room 2  | 114.00      |
| 6     | Squash Court    | 552.00      |
| 7     | Snooker Table   | 454.00      |
| 8     | Pool Table      | 455.50      |

## Answer:
* Using ROUND method
```sql
SELECT
  cd.facilities.facid as facid,
  cd.facilities.name as name,
  ROUND(SUM(slots) / 2.0, 2) as revenue
FROM
  cd.bookings
  INNER JOIN cd.facilities ON cd.facilities.facid = cd.bookings.facid
GROUP BY
  cd.facilities.facid,
  cd.facilities.name
ORDER BY
  cd.facilities.facid;
```

* Using to_char for exact precision
```sql
select
  facs.facid,
  facs.name,
  trim(
    to_char(sum(bks.slots) / 2.0, '9999999999999999D99')
  ) as "Total Hours"
from
  cd.bookings bks
  inner join cd.facilities facs on facs.facid = bks.facid
group by
  facs.facid,
  facs.name
order by
  facs.facid;
```
