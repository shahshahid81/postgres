# SQL Exercise: Count the number of facilities

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

For our first foray into aggregates, we're going to stick to something simple. We want to know how many facilities exist - simply produce a total count.


## Expected Output:

| count |
| ----- |
| 9     |

## Answer:

```sql
select count(*) from cd.facilities;
```
