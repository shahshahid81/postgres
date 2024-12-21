# SQL Exercise: List the total slots booked per facility

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

Produce a list of the total number of slots booked per facility. For now, just produce an output table consisting of facility id and slots, sorted by facility id.

## Expected Output:

| facid | Total Slots |
| ----- | ----------- |
| 0     | 1320        |
| 1     | 1278        |
| 2     | 1209        |
| 3     | 830         |
| 4     | 1404        |
| 5     | 228         |
| 6     | 1104        |
| 7     | 908         |
| 8     | 911         |

## Answer:

```sql
SELECT
  facid,
  sum(slots) as "Total Slots"
FROM
  cd.bookings
GROUP BY
  facid
ORDER BY
  facid;
```
