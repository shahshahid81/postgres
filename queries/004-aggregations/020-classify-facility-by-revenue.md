# SQL Exercise: Classify facilities by value

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

Classify facilities into equally sized groups of high, average, and low based on their revenue. Order by classification and facility name.

## Expected Output:

| Name            | Revenue |
| --------------- | ------- |
| Massage Room 1  | High    |
| Massage Room 2  | High    |
| Tennis Court 2  | High    |
| Badminton Court | Average |
| Squash Court    | Average |
| Tennis Court 1  | Average |
| Pool Table      | Low     |
| Snooker Table   | Low     |
| Table Tennis    | Low     |

## Answer:

```sql
SELECT
  name,
  CASE
    WHEN classification = 1 then 'high'
    WHEN classification = 2 then 'average'
    WHEN classification = 3 then 'low'
  END as revenue
from
  (
    SELECT
      fcs.name as name,
      NTILE(3) OVER (
        ORDER BY
          SUM(
            bks.slots * (
              CASE
                WHEN bks.memid = 0 THEN fcs.guestcost
                ELSE fcs.membercost
              END
            )
          ) DESC
      ) as classification
    FROM
      cd.bookings bks
      INNER JOIN cd.facilities fcs ON fcs.facid = bks.facid
    GROUP BY
      fcs.name
  ) data
ORDER BY
  classification,
  name;
```
