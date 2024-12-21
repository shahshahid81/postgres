# SQL Exercise: Produce a list of all members, along with their recommender

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

How can you output a list of all members, including the individual who recommended them (if any)? Ensure that results are ordered by (surname, firstname).

## Expected Output:

| memfname  | memsname          | recfname  | recsname |
| --------- | ----------------- | --------- | -------- |
| Florence  | Bader             | Ponder    | Stibbons |
| Anne      | Baker             | Ponder    | Stibbons |
| Timothy   | Baker             | Jemima    | Farrell  |
| Tim       | Boothe            | Tim       | Rownam   |
| Gerald    | Butters           | Darren    | Smith    |
| Joan      | Coplin            | Timothy   | Baker    |
| Erica     | Crumpet           | Tracy     | Smith    |
| Nancy     | Dare              | Janice    | Joplette |
| David     | Farrell           |           |          |
| Jemima    | Farrell           |           |          |
| GUEST     | GUEST             |           |          |
| Matthew   | Genting           | Gerald    | Butters  |
| John      | Hunt              | Millicent | Purview  |
| David     | Jones             | Janice    | Joplette |
| Douglas   | Jones             | David     | Jones    |
| Janice    | Joplette          | Darren    | Smith    |
| Anna      | Mackenzie         | Darren    | Smith    |
| Charles   | Owen              | Darren    | Smith    |
| David     | Pinker            | Jemima    | Farrell  |
| Millicent | Purview           | Tracy     | Smith    |
| Tim       | Rownam            |           |          |
| Henrietta | Rumney            | Matthew   | Genting  |
| Ramnaresh | Sarwin            | Florence  | Bader    |
| Darren    | Smith             |           |          |
| Darren    | Smith             |           |          |
| Jack      | Smith             | Darren    | Smith    |
| Tracy     | Smith             |           |          |
| Ponder    | Stibbons          | Burton    | Tracy    |
| Burton    | Tracy             |           |          |
| Hyacinth  | Tupperware        |           |          |
| Henry     | Worthington-Smyth | Tracy     | Smith    |

## Answer:

```sql
SELECT
  members.firstname as memfname,
  members.surname as memsname,
  recommenders.firstname as recfname,
  recommenders.surname as recsname
FROM
  cd.members members
  LEFT JOIN cd.members recommenders ON members.recommendedby = recommenders.memid
ORDER BY
  memsname,
  memfname;
```
