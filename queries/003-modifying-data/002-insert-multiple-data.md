# SQL Exercise: Insert multiple rows of data into a table

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

In the previous exercise, you learned how to add a facility. Now you're going to add multiple facilities in one command. Use the following values:

facid: 9, Name: 'Spa', membercost: 20, guestcost: 30, initialoutlay: 100000, monthlymaintenance: 800.
facid: 10, Name: 'Squash Court 2', membercost: 3.5, guestcost: 17.5, initialoutlay: 5000, monthlymaintenance: 80.

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
| 10    | Squash Court 2  | 3.5        | 17.5      | 5000          | 80                 |

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
  (9, 'Spa', 20, 30, 100000, 800),
  (10, 'Squash Court 2', 3.5, 17.5, 5000, 80);
```
