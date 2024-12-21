# SQL Exercise: Find the total revenue of each facility

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

Produce a list of facilities along with their total revenue. The output table should consist of facility name and revenue, sorted by revenue. Remember that there's a different cost for guests and members!

## Expected Output:

| Name            | Revenue |
| --------------- | ------- |
| Table Tennis    | 180     |
| Snooker Table   | 240     |
| Pool Table      | 270     |
| Badminton Court | 1906.5  |
| Squash Court    | 13468.0 |
| Tennis Court 1  | 13860   |
| Tennis Court 2  | 14310   |
| Massage Room 2  | 15810   |
| Massage Room 1  | 72540   |

## Answer:

```sql
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
ORDER BY
  revenue;
```
