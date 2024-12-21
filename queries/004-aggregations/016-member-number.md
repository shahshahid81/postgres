# SQL Exercise: Produce a numbered list of members

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

Produce a monotonically increasing numbered list of members (including guests), ordered by their date of joining. Remember that member IDs are not guaranteed to be sequential.

## Expected Output:

| row_number | firstname | surname           |
| ---------- | --------- | ----------------- |
| 1          | GUEST     | GUEST             |
| 2          | Darren    | Smith             |
| 3          | Tracy     | Smith             |
| 4          | Tim       | Rownam            |
| 5          | Janice    | Joplette          |
| 6          | Gerald    | Butters           |
| 7          | Burton    | Tracy             |
| 8          | Nancy     | Dare              |
| 9          | Tim       | Boothe            |
| 10         | Ponder    | Stibbons          |
| 11         | Charles   | Owen              |
| 12         | David     | Jones             |
| 13         | Anne      | Baker             |
| 14         | Jemima    | Farrell           |
| 15         | Jack      | Smith             |
| 16         | Florence  | Bader             |
| 17         | Timothy   | Baker             |
| 18         | David     | Pinker            |
| 19         | Matthew   | Genting           |
| 20         | Anna      | Mackenzie         |
| 21         | Joan      | Coplin            |
| 22         | Ramnaresh | Sarwin            |
| 23         | Douglas   | Jones             |
| 24         | Henrietta | Rumney            |
| 25         | David     | Farrell           |
| 26         | Henry     | Worthington-Smyth |
| 27         | Millicent | Purview           |
| 28         | Hyacinth  | Tupperware        |
| 29         | John      | Hunt              |
| 30         | Erica     | Crumpet           |
| 31         | Darren    | Smith             |

## Answer:

```sql
select
  row_number() over (
  -- In this query, we don't define a partition, meaning that the partition is the entire dataset. Since we define an order for the window function, for any given row the window is: start of the dataset -> current row.
  ORDER BY
    joindate
) as count,
  firstname,
  surname
FROM
  cd.members
ORDER BY
  joindate;
```
