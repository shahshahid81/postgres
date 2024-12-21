# SQL Exercise: Control which rows are retrieved

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

How can you produce a list of facilities that charge a fee to members?

## Expected Output:

| facid | name           | membercost | guestcost | initialoutlay | monthlymaintenance |
| ----- | -------------- | ---------- | --------- | ------------- | ------------------ |
| 0     | Tennis Court 1 | 5          | 25        | 10000         | 200                |
| 1     | Tennis Court 2 | 5          | 25        | 8000          | 200                |
| 4     | Massage Room 1 | 35         | 80        | 4000          | 3000               |
| 5     | Massage Room 2 | 35         | 80        | 4000          | 3000               |
| 6     | Squash Court   | 3.5        | 17.5      | 5000          | 80                 |

## Answer:

```sql
SELECT
  *
from
  cd.facilities
WHERE
  membercost > 0;
```
