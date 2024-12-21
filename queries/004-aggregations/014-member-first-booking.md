# SQL Exercise: List each member's first booking after September 1st 2012

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

Produce a list of each member name, id, and their first booking after September 1st 2012. Order by member ID.

## Expected Output:

| Surname           | Firstname | Memid | Starttime           |
| ----------------- | --------- | ----- | ------------------- |
| GUEST             | GUEST     | 0     | 2012-09-01 08:00:00 |
| Smith             | Darren    | 1     | 2012-09-01 09:00:00 |
| Smith             | Tracy     | 2     | 2012-09-01 11:30:00 |
| Rownam            | Tim       | 3     | 2012-09-01 16:00:00 |
| Joplette          | Janice    | 4     | 2012-09-01 15:00:00 |
| Butters           | Gerald    | 5     | 2012-09-02 12:30:00 |
| Tracy             | Burton    | 6     | 2012-09-01 15:00:00 |
| Dare              | Nancy     | 7     | 2012-09-01 12:30:00 |
| Boothe            | Tim       | 8     | 2012-09-01 08:30:00 |
| Stibbons          | Ponder    | 9     | 2012-09-01 11:00:00 |
| Owen              | Charles   | 10    | 2012-09-01 11:00:00 |
| Jones             | David     | 11    | 2012-09-01 09:30:00 |
| Baker             | Anne      | 12    | 2012-09-01 14:30:00 |
| Farrell           | Jemima    | 13    | 2012-09-01 09:30:00 |
| Smith             | Jack      | 14    | 2012-09-01 11:00:00 |
| Bader             | Florence  | 15    | 2012-09-01 10:30:00 |
| Baker             | Timothy   | 16    | 2012-09-01 15:00:00 |
| Pinker            | David     | 17    | 2012-09-01 08:30:00 |
| Genting           | Matthew   | 20    | 2012-09-01 18:00:00 |
| Mackenzie         | Anna      | 21    | 2012-09-01 08:30:00 |
| Coplin            | Joan      | 22    | 2012-09-02 11:30:00 |
| Sarwin            | Ramnaresh | 24    | 2012-09-04 11:00:00 |
| Jones             | Douglas   | 26    | 2012-09-08 13:00:00 |
| Rumney            | Henrietta | 27    | 2012-09-16 13:30:00 |
| Farrell           | David     | 28    | 2012-09-18 09:00:00 |
| Worthington-Smyth | Henry     | 29    | 2012-09-19 09:30:00 |
| Purview           | Millicent | 30    | 2012-09-19 11:30:00 |
| Tupperware        | Hyacinth  | 33    | 2012-09-20 08:00:00 |
| Hunt              | John      | 35    | 2012-09-23 14:00:00 |
| Crumpet           | Erica     | 36    | 2012-09-27 11:30:00 |

## Answer:

```sql
SELECT
  mem.surname as surname,
  mem.firstname as firstname,
  mem.memid as memid,
  MIN(starttime) as starttime
FROM
  cd.bookings bks
  INNER JOIN cd.members mem on bks.memid = mem.memid
WHERE
  bks.starttime > '2012-09-01'
GROUP BY
  1,
  2,
  3
ORDER BY
  memid;
```
