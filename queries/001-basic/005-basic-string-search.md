# SQL Exercise: Basic string searches

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

How can you produce a list of all facilities with the word 'Tennis' in their name?

## Expected Output:

| facid | name           | membercost | guestcost | initialoutlay | monthlymaintenance |
| ----- | -------------- | ---------- | --------- | ------------- | ------------------ |
| 0     | Tennis Court 1 | 5          | 25        | 10000         | 200                |
| 1     | Tennis Court 2 | 5          | 25        | 8000          | 200                |
| 3     | Table Tennis   | 0          | 5         | 320           | 10                 |

## Answer:

```sql
select
  *
from
  cd.facilities
where
  name LIKE '%Tennis%';
```
