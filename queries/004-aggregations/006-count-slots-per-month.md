# SQL Exercise: List the total slots booked per facility per month

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

Produce a list of the total number of slots booked per facility per month in the year of 2012. Produce an output table consisting of facility id and slots, sorted by the id and month.

## Expected Output:

| facid | month | Total Slots |
| ----- | ----- | ----------- |
| 0     | 7     | 270         |
| 0     | 8     | 459         |
| 0     | 9     | 591         |
| 1     | 7     | 207         |
| 1     | 8     | 483         |
| 1     | 9     | 588         |
| 2     | 7     | 180         |
| 2     | 8     | 459         |
| 2     | 9     | 570         |
| 3     | 7     | 104         |
| 3     | 8     | 304         |
| 3     | 9     | 422         |
| 4     | 7     | 264         |
| 4     | 8     | 492         |
| 4     | 9     | 648         |
| 5     | 7     | 24          |
| 5     | 8     | 82          |
| 5     | 9     | 122         |
| 6     | 7     | 164         |
| 6     | 8     | 400         |
| 6     | 9     | 540         |
| 7     | 7     | 156         |
| 7     | 8     | 326         |
| 7     | 9     | 426         |
| 8     | 7     | 117         |
| 8     | 8     | 322         |
| 8     | 9     | 471         |

## Answer:

```sql
SELECT
  facid,
  EXTRACT( month from starttime ) as month,
  sum(slots) as "Total Slots"
FROM
  cd.bookings
WHERE
  EXTRACT( year from starttime ) = '2012'
GROUP BY
  facid,
  month
ORDER BY
  facid,
  month;
```
