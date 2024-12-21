# SQL Exercise: Matching against multiple possible values

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.

## Expected Output:

| facid | name           | membercost | guestcost | initialoutlay | monthlymaintenance |
| ----- | -------------- | ---------- | --------- | ------------- | ------------------ |
| 1     | Tennis Court 2 | 5          | 25        | 8000          | 200                |
| 5     | Massage Room 2 | 35         | 80        | 4000          | 3000               |

## Answer:

```sql
SELECT
  *
from
  cd.facilities
WHERE
  facid in (1, 5);
```
