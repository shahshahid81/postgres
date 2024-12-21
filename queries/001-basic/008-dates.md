# SQL Exercise: Working with dates

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

How can you produce a list of facilities, with each labelled as 'cheap' or 'expensive' depending on if their monthly maintenance cost is more than $100? Return the name and monthly maintenance of the facilities in question.

## Expected Output:

| memid | surname           | firstname | joindate            |
| ----- | ----------------- | --------- | ------------------- |
| 24    | Sarwin            | Ramnaresh | 2012-09-01 08:44:42 |
| 26    | Jones             | Douglas   | 2012-09-02 18:43:05 |
| 27    | Rumney            | Henrietta | 2012-09-05 08:42:35 |
| 28    | Farrell           | David     | 2012-09-15 08:22:05 |
| 29    | Worthington-Smyth | Henry     | 2012-09-17 12:27:15 |
| 30    | Purview           | Millicent | 2012-09-18 19:04:01 |
| 33    | Tupperware        | Hyacinth  | 2012-09-18 19:32:05 |
| 35    | Hunt              | John      | 2012-09-19 11:32:45 |
| 36    | Crumpet           | Erica     | 2012-09-22 08:36:38 |
| 37    | Smith             | Darren    | 2012-09-26 18:08:45 |

## Answer:

```sql
SELECT
  memid,
  surname,
  firstname,
  joindate
FROM
  cd.members
WHERE
  joindate >= '2012-09-01';
```
