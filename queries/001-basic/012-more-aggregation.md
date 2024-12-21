# SQL Exercise: More aggregation

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

You'd like to get the first and last name of the last member(s) who signed up - not just the date. How can you do that?

## Expected Output:

| firstname | surname | joindate            |
| --------- | ------- | ------------------- |
| Darren    | Smith   | 2012-09-26 18:08:45 |

## Answer:

```sql
SELECT
  firstname,
  surname,
  joindate
FROM
  cd.members
where
  joindate = (
    SELECT
      max(joindate)
    from
      cd.members
  );
```
