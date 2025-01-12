# SQL Exercise: Perform a case-insensitive search

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

Perform a case-insensitive search to find all facilities whose name begins with 'tennis'. Retrieve all columns.

## Expected Output:

| facid | name           | membercost | guestcost | initialoutlay | monthlymaintenance |
| ----- | -------------- | ---------- | --------- | ------------- | ------------------ |
| 0     | Tennis Court 1 | 5          | 25        | 10000         | 200                |
| 1     | Tennis Court 2 | 5          | 25        | 8000          | 200                |

## Answer:

### Below is the standard sql query
```sql
SELECT
    *
FROM
    cd.facilities
WHERE
    lower(name) LIKE 'tennis%';
```

### ILIKE is not a SQL standard but can be used in postgres since it supports it
```sql
SELECT
    *
FROM
    cd.facilities
WHERE
    name ILIKE 'tennis%';
```