# SQL Exercise: Find the count of members who have made at least one booking

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

Find the total number of members (including guests) who have made at least one booking.

## Expected Output:

| Count |
| ----- |
| 30    |

## Answer:

```sql
SELECT
  count(DISTINCT memid) as count
FROM
  cd.bookings;
```
