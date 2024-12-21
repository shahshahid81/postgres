# SQL Exercise: Count the number of expensive facilities

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

Produce a count of the number of facilities that have a cost to guests of 10 or more.

## Expected Output:

| count |
| ----- |
| 6     |

## Answer:

```sql
select
  count(*)
from
  cd.facilities
WHERE
  guestcost >= 10;
```
