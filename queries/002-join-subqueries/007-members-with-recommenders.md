# SQL Exercise: Produce a list of all members, along with their recommender, using no joins.

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

How can you output a list of all members, including the individual who recommended them (if any), without using any joins? Ensure that there are no duplicates in the list, and that each firstname + surname pairing is formatted as a column and ordered.

## Expected Output:

| member                  | recommender       |
| ----------------------- | ----------------- |
| Anna Mackenzie          | Darren Smith      |
| Anne Baker              | Ponder Stibbons   |
| Burton Tracy            |                   |
| Charles Owen            | Darren Smith      |
| Darren Smith            |                   |
| David Farrell           |                   |
| David Jones             | Janice Joplette   |
| David Pinker            | Jemima Farrell    |
| Douglas Jones           | David Jones       |
| Erica Crumpet           | Tracy Smith       |
| Florence Bader          | Ponder Stibbons   |
| GUEST GUEST             |                   |
| Gerald Butters          | Darren Smith      |
| Henrietta Rumney        | Matthew Genting   |
| Henry Worthington-Smyth | Tracy Smith       |
| Hyacinth Tupperware     |                   |
| Jack Smith              | Darren Smith      |
| Janice Joplette         | Darren Smith      |
| Jemima Farrell          |                   |
| Joan Coplin             | Timothy Baker     |
| John Hunt               | Millicent Purview |
| Matthew Genting         | Gerald Butters    |
| Millicent Purview       | Tracy Smith       |
| Nancy Dare              | Janice Joplette   |
| Ponder Stibbons         | Burton Tracy      |
| Ramnaresh Sarwin        | Florence Bader    |
| Tim Boothe              | Tim Rownam        |
| Tim Rownam              |                   |
| Timothy Baker           | Jemima Farrell    |
| Tracy Smith             |                   |

## Answer:

```sql
SELECT
  DISTINCT CONCAT(members.firstname, ' ', members.surname) as member,
  CASE
    WHEN members.recommendedby is not null then (
      SELECT
        CONCAT(
          recommenders.firstname,
          ' ',
          recommenders.surname
        )
      FROM
        cd.members recommenders
      WHERE
        recommenders.memid = members.recommendedby
    )
    else null
  end as recommender
FROM
  cd.members members
ORDER BY
  member,
  recommender;
```
