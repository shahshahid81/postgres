# SQL Exercise: Delete all bookings

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

As part of a clearout of our database, we want to delete all bookings from the cd.bookings table. How can we accomplish this?


## Expected Output:

| bookid | facid | memid | starttime | slots |
| ------ | ----- | ----- | --------- | ----- |

## Answer:

```sql
delete from
  cd.bookings;
```
