# SQL Exercise: Produce a list of member names, with each row containing the total member count

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

Produce a list of member names, with each row containing the total member count. Order by join date, and include guest members.

## Expected Output:

| Count | Firstname | Surname           |
| ----- | --------- | ----------------- |
| 31    | GUEST     | GUEST             |
| 31    | Darren    | Smith             |
| 31    | Tracy     | Smith             |
| 31    | Tim       | Rownam            |
| 31    | Janice    | Joplette          |
| 31    | Gerald    | Butters           |
| 31    | Burton    | Tracy             |
| 31    | Nancy     | Dare              |
| 31    | Tim       | Boothe            |
| 31    | Ponder    | Stibbons          |
| 31    | Charles   | Owen              |
| 31    | David     | Jones             |
| 31    | Anne      | Baker             |
| 31    | Jemima    | Farrell           |
| 31    | Jack      | Smith             |
| 31    | Florence  | Bader             |
| 31    | Timothy   | Baker             |
| 31    | David     | Pinker            |
| 31    | Matthew   | Genting           |
| 31    | Anna      | Mackenzie         |
| 31    | Joan      | Coplin            |
| 31    | Ramnaresh | Sarwin            |
| 31    | Douglas   | Jones             |
| 31    | Henrietta | Rumney            |
| 31    | David     | Farrell           |
| 31    | Henry     | Worthington-Smyth |
| 31    | Millicent | Purview           |
| 31    | Hyacinth  | Tupperware        |
| 31    | John      | Hunt              |
| 31    | Erica     | Crumpet           |
| 31    | Darren    | Smith             |

## Answer:

```sql
select
  count(*) over () as count,
  firstname,
  surname
FROM
  cd.members
ORDER BY
  joindate;
```
