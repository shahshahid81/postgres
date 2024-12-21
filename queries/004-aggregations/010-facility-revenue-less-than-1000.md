# SQL Exercise: Find facilities with a total revenue less than 1000

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

Produce a list of facilities with a total revenue less than 1000. Produce an output table consisting of facility name and revenue, sorted by revenue. Remember that there's a different cost for guests and members!

## Expected Output:

| Name          | Revenue |
| ------------- | ------- |
| Table Tennis  | 180     |
| Snooker Table | 240     |
| Pool Table    | 270     |

## Answer:

```sql
SELECT
  *
FROM
  (
    SELECT
      cd.facilities.name as name,
      SUM(
        slots * CASE
          WHEN memid = 0 THEN guestcost
          ELSE membercost
        END
      ) as revenue
    FROM
      cd.bookings
      INNER JOIN cd.facilities ON cd.facilities.facid = cd.bookings.facid
    GROUP BY
      cd.facilities.name
  ) data
WHERE
  revenue < 1000
ORDER BY
  revenue;
```
