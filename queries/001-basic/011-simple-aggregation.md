# SQL Exercise: Simple aggregation

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

You'd like to get the signup date of your last member. How can you retrieve this information?

## Expected Output:

| latest              |
| ------------------- |
| 2012-09-26 18:08:45 |


## Answer:

```sql
select
  max(joindate) as latest
from
  cd.members;
```
