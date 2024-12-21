# SQL Exercise: Retrieve specific columns from a table

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

You want to print out a list of all of the facilities and their cost to members. How would you retrieve a list of only facility names and costs?

## Expected Output:

| name            | membercost |
| --------------- | ---------- |
| Tennis Court 1  | 5          |
| Tennis Court 2  | 5          |
| Badminton Court | 0          |
| Table Tennis    | 0          |
| Massage Room 1  | 35         |
| Massage Room 2  | 35         |
| Squash Court    | 3.5        |
| Snooker Table   | 0          |
| Pool Table      | 0          |

## Answer:

```sql
SELECT
  name,
  membercost
from
  cd.facilities;
```
