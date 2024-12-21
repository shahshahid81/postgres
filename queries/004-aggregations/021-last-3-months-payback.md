# SQL Exercise: Calculate the payback time for each facility

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

Based on the 3 complete months of data so far, calculate the amount of time each facility will take to repay its cost of ownership. Remember to take into account ongoing monthly maintenance. Output facility name and payback time in months, order by facility name. Don't worry about differences in month lengths, we're only looking for a rough value here!

Note that to solve the problem, formula is initaloutlay divided by monthly revenue - monthly maintenance.

## Expected Output:

| Name            | Months |
| --------------- | ------ |
| Badminton Court | 6.83   |
| Massage Room 1  | 0.19   |
| Massage Room 2  | 1.76   |
| Pool Table      | 5.33   |
| Snooker Table   | 6.92   |
| Squash Court    | 1.13   |
| Table Tennis    | 6.40   |
| Tennis Court 1  | 2.26   |
| Tennis Court 2  | 1.75   |

## Answer:

```sql
WITH data as (
  SELECT
    fcs.facid AS facid,
    sum(
      CASE
        WHEN bks.memid = 0 THEN bks.slots * fcs.guestcost
        ELSE bks.slots * fcs.membercost
      END
    ) AS revenue,
    1 + (
      extract(
        YEAR
        FROM
          max(starttime)
      ) * 12 + extract(
        MONTH
        FROM
          max(starttime)
      )
    ) - (
      extract(
        YEAR
        FROM
          min(starttime)
      ) * 12 + extract(
        MONTH
        FROM
          min(starttime)
      )
    ) AS duration
  FROM
    cd.facilities fcs
    INNER JOIN cd.bookings bks ON fcs.facid = bks.facid
  WHERE
    starttime >= '2012-07-01'
    AND starttime < '2012-10-01'
  GROUP BY
    1
)
SELECT
  fcs.name as name,
  initialoutlay / ((revenue / duration) - monthlymaintenance) as repay_time
FROM
  cd.facilities fcs
  INNER JOIN data on fcs.facid = data.facid
ORDER BY
  name;
```
