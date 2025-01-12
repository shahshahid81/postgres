# SQL Exercise: Find facilities by a name prefix

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

Find all facilities whose name begins with 'Tennis'. Retrieve all columns.

## Expected Output:

| facid  | name            | membercost | guestcost | initialoutlay | monthlymaintenance |
|--------|-----------------|------------|-----------|---------------|--------------------|
| 0      | Tennis Court 1  | 5          | 25        | 10000         | 200                |
| 1      | Tennis Court 2  | 5          | 25        | 8000          | 200                |

## Answer:

```sql
SELECT
    *
FROM
    cd.facilities
WHERE
    name LIKE 'Tennis%';
```