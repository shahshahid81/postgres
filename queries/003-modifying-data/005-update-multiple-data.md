# SQL Exercise: Update multiple rows and columns at the same time

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

We want to increase the price of the tennis courts for both members and guests. Update the costs to be 6 for members, and 30 for guests.

## Expected Output:

| facid | name            | membercost | guestcost | initialoutlay | monthlymaintenance |
| ----- | --------------- | ---------- | --------- | ------------- | ------------------ |
| 0     | Tennis Court 1  | 6          | 30        | 10000         | 200                |
| 1     | Tennis Court 2  | 6          | 30        | 8000          | 200                |
| 2     | Badminton Court | 0          | 15.5      | 4000          | 50                 |
| 3     | Table Tennis    | 0          | 5         | 320           | 10                 |
| 4     | Massage Room 1  | 35         | 80        | 4000          | 3000               |
| 5     | Massage Room 2  | 35         | 80        | 4000          | 3000               |
| 6     | Squash Court    | 3.5        | 17.5      | 5000          | 80                 |
| 7     | Snooker Table   | 0          | 5         | 450           | 15                 |
| 8     | Pool Table      | 0          | 5         | 400           | 15                 |

## Answer:

```sql
UPDATE
  cd.facilities
SET
  membercost = 6,
  guestcost = 30
where
  facid IN (0, 1);
```
