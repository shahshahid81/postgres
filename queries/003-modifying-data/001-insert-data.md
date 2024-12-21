# SQL Exercise: Insert some data into a table

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

The club is adding a new facility - a spa. We need to add it into the facilities table. Use the following values:

facid: 9, Name: 'Spa', membercost: 20, guestcost: 30, initialoutlay: 100000, monthlymaintenance: 800.

## Expected Output:

| facid | name            | membercost | guestcost | initialoutlay | monthlymaintenance |
| ----- | --------------- | ---------- | --------- | ------------- | ------------------ |
| 0     | Tennis Court 1  | 5          | 25        | 10000         | 200                |
| 1     | Tennis Court 2  | 5          | 25        | 8000          | 200                |
| 2     | Badminton Court | 0          | 15.5      | 4000          | 50                 |
| 3     | Table Tennis    | 0          | 5         | 320           | 10                 |
| 4     | Massage Room 1  | 35         | 80        | 4000          | 3000               |
| 5     | Massage Room 2  | 35         | 80        | 4000          | 3000               |
| 6     | Squash Court    | 3.5        | 17.5      | 5000          | 80                 |
| 7     | Snooker Table   | 0          | 5         | 450           | 15                 |
| 8     | Pool Table      | 0          | 5         | 400           | 15                 |
| 9     | Spa             | 20         | 30        | 100000        | 800                |

## Answer:

```sql
INSERT INTO
  cd.facilities (
    facid,
    name,
    membercost,
    guestcost,
    initialoutlay,
    monthlymaintenance
  )
VALUES
  (9, 'Spa', 20, 30, 100000, 800);
```
