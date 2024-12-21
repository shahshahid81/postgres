# SQL Exercise: Produce a list of all members who have used a tennis court

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

How can you produce a list of all members who have used a tennis court? Include in your output the name of the court, and the name of the member formatted as a single column. Ensure no duplicate data, and order by the member name followed by the facility name.

## Expected Output:

| member            | facility       |
| ----------------- | -------------- |
| Anne Baker        | Tennis Court 1 |
| Anne Baker        | Tennis Court 2 |
| Burton Tracy      | Tennis Court 1 |
| Burton Tracy      | Tennis Court 2 |
| Charles Owen      | Tennis Court 1 |
| Charles Owen      | Tennis Court 2 |
| Darren Smith      | Tennis Court 2 |
| David Farrell     | Tennis Court 1 |
| David Farrell     | Tennis Court 2 |
| David Jones       | Tennis Court 1 |
| David Jones       | Tennis Court 2 |
| David Pinker      | Tennis Court 1 |
| Douglas Jones     | Tennis Court 1 |
| Erica Crumpet     | Tennis Court 1 |
| Florence Bader    | Tennis Court 1 |
| Florence Bader    | Tennis Court 2 |
| GUEST GUEST       | Tennis Court 1 |
| GUEST GUEST       | Tennis Court 2 |
| Gerald Butters    | Tennis Court 1 |
| Gerald Butters    | Tennis Court 2 |
| Henrietta Rumney  | Tennis Court 2 |
| Jack Smith        | Tennis Court 1 |
| Jack Smith        | Tennis Court 2 |
| Janice Joplette   | Tennis Court 1 |
| Janice Joplette   | Tennis Court 2 |
| Jemima Farrell    | Tennis Court 1 |
| Jemima Farrell    | Tennis Court 2 |
| Joan Coplin       | Tennis Court 1 |
| John Hunt         | Tennis Court 1 |
| John Hunt         | Tennis Court 2 |
| Matthew Genting   | Tennis Court 1 |
| Millicent Purview | Tennis Court 2 |
| Nancy Dare        | Tennis Court 1 |
| Nancy Dare        | Tennis Court 2 |
| Ponder Stibbons   | Tennis Court 1 |
| Ponder Stibbons   | Tennis Court 2 |
| Ramnaresh Sarwin  | Tennis Court 1 |
| Ramnaresh Sarwin  | Tennis Court 2 |
| Tim Boothe        | Tennis Court 1 |
| Tim Boothe        | Tennis Court 2 |
| Tim Rownam        | Tennis Court 1 |
| Tim Rownam        | Tennis Court 2 |
| Timothy Baker     | Tennis Court 1 |
| Timothy Baker     | Tennis Court 2 |
| Tracy Smith       | Tennis Court 1 |
| Tracy Smith       | Tennis Court 2 |

## Answer:

```sql
SELECT
  DISTINCT CONCAT (members.firstname, ' ', members.surname) as member,
  facilities.name as facility
FROM
  cd.members members
  INNER JOIN cd.bookings bookings ON members.memid = bookings.memid
  INNER JOIN cd.facilities facilities ON facilities.facid = bookings.facid
WHERE
  facilities.name ILIKE '%tennis court%'
ORDER BY
  member,
  facility;
```
