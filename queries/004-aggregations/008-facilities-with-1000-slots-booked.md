# SQL Exercise: List facilities with more than 1000 slots booked

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

Produce a list of facilities with more than 1000 slots booked. Produce an output table consisting of facility id and slots, sorted by facility id.

## Expected Output:

| facid | Total Slots |
| ----- | ----------- |
| 0     | 1320        |
| 1     | 1278        |
| 2     | 1209        |
| 4     | 1404        |
| 6     | 1104        |

## Answer:

```sql
SELECT
  facid,
  sum(slots) as "Total Slots"
FROM
  cd.bookings
GROUP BY
  facid
HAVING
  sum(slots) >= 1000
ORDER BY
  facid;
```
