# SQL Exercise: Produce a list of all members who have recommended another member

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

How can you output a list of all members who have recommended another member? Ensure that there are no duplicates in the list, and that results are ordered by (surname, firstname).

## Expected Output:

| firstname | surname  |
| --------- | -------- |
| Florence  | Bader    |
| Timothy   | Baker    |
| Gerald    | Butters  |
| Jemima    | Farrell  |
| Matthew   | Genting  |
| David     | Jones    |
| Janice    | Joplette |
| Millicent | Purview  |
| Tim       | Rownam   |
| Darren    | Smith    |
| Tracy     | Smith    |
| Ponder    | Stibbons |
| Burton    | Tracy    |

## Answer:

### Using subquery
```sql
SELECT
  DISTINCT firstname,
  surname
FROM
  cd.members
WHERE
  memid in (
    SELECT
      recommendedby
    from
      cd.members
  )
ORDER BY
  surname,
  firstname;
```

### Using inner join
```sql
SELECT
  DISTINCT recommenders.firstname as firstname,
  recommenders.surname as surname
FROM
  cd.members members
  INNER JOIN cd.members recommenders ON members.recommendedby = recommenders.memid
ORDER BY
  surname,
  firstname;
```
