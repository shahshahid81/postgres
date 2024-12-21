# SQL Exercise: Classify results into buckets

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

How can you produce a list of facilities, with each labelled as 'cheap' or 'expensive' depending on if their monthly maintenance cost is more than $100? Return the name and monthly maintenance of the facilities in question.

## Expected Output:

| name            | cost      |
| --------------- | --------- |
| Tennis Court 1  | expensive |
| Tennis Court 2  | expensive |
| Badminton Court | cheap     |
| Table Tennis    | cheap     |
| Massage Room 1  | expensive |
| Massage Room 2  | expensive |
| Squash Court    | cheap     |
| Snooker Table   | cheap     |
| Pool Table      | cheap     |


## Answer:

```sql
SELECT
  name,
  CASE
    WHEN monthlymaintenance > 100 THEN 'expensive'
    ELSE 'cheap'
  END as cost
FROM
  cd.facilities;
```
