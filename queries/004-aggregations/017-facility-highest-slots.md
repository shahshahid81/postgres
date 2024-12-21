# SQL Exercise: Output the facility id that has the highest number of slots booked, again

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

Output the facility id that has the highest number of slots booked. Ensure that in the event of a tie, all tieing results get output.

## Expected Output:

| facid | total |
|-------|-------|
| 4     | 1404  |

## Answer:

```sql
SELECT
  facid,
  totalslots
FROM
  (
    select
      facid,
      sum(slots) as totalslots,
      RANK() OVER (
        ORDER BY
          sum(slots) DESC
      ) as rank
    FROM
      cd.bookings
    GROUP BY
      1
  ) data
where
  rank = 1;
```
