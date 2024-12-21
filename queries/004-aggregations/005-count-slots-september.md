# SQL Exercise: List the total slots booked per facility in a given month

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

Produce a list of the total number of slots booked per facility in the month of September 2012. Produce an output table consisting of facility id and slots, sorted by the number of slots.

## Expected Output:

| facid | Total Slots |
| ----- | ----------- |
| 5     | 122         |
| 3     | 422         |
| 7     | 426         |
| 8     | 471         |
| 6     | 540         |
| 2     | 570         |
| 1     | 588         |
| 0     | 591         |
| 4     | 648         |


## Answer:

```sql
SELECT
  facid,
  sum(slots) as "Total Slots"
FROM
  cd.bookings
WHERE
  starttime >= '2012-09-01'
  and starttime < '2012-10-01'
GROUP BY
  facid
ORDER BY
  sum(slots);
```
