# SQL Exercise: Update a row based on the contents of another row

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

We want to alter the price of the second tennis court so that it costs 10% more than the first one. Try to do this without using constant values for the prices, so that we can reuse the statement if we want to.

## Expected Output:

| facid | name            | membercost | guestcost | initialoutlay | monthlymaintenance |
| ----- | --------------- | ---------- | --------- | ------------- | ------------------ |
| 0     | Tennis Court 1  | 5          | 25        | 10000         | 200                |
| 1     | Tennis Court 2  | 5.5        | 27.5      | 8000          | 200                |
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
  membercost = (
    select
      membercost * 1.1
    from
      cd.facilities
    where
      facid = 0
  ),
  guestcost = (
    select
      guestcost * 1.1
    from
      cd.facilities
    where
      facid = 0
  )
where
  facid = 1;
```
