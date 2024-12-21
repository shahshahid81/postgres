# SQL Exercise: Control which rows are retrieved - part 2

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

How can you produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost? Return the facid, facility name, member cost, and monthly maintenance of the facilities in question.

## Expected Output:

| facid | name           | membercost | monthlymaintenance |
| ----- | -------------- | ---------- | ------------------ |
| 4     | Massage Room 1 | 35         | 3000               |
| 5     | Massage Room 2 | 35         | 3000               |

## Answer:

```sql
SELECT
  facid,
  name,
  membercost,
  monthlymaintenance
from
  cd.facilities
WHERE
  membercost > 0
  AND membercost < (monthlymaintenance / 50.00);
```
