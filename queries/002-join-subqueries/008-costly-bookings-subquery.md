# SQL Exercise: Produce a list of costly bookings, using a subquery

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

The [Produce a list of costly bookings](006-costly-bookings.md) exercise contained some messy logic: we had to calculate the booking cost in both the WHERE clause and the CASE statement. Try to simplify this calculation using subqueries. For reference, the question was:
How can you produce a list of bookings on the day of 2012-09-14 which will cost the member (or guest) more than $30? Remember that guests have different costs to members (the listed costs are per half-hour 'slot'), and the guest user is always ID 0. Include in your output the name of the facility, the name of the member formatted as a single column, and the cost. Order by descending cost.

## Expected Output:

| member          | facility       | cost |
| --------------- | -------------- | ---- |
| GUEST GUEST     | Massage Room 2 | 320  |
| GUEST GUEST     | Massage Room 1 | 160  |
| GUEST GUEST     | Massage Room 1 | 160  |
| GUEST GUEST     | Massage Room 1 | 160  |
| GUEST GUEST     | Tennis Court 2 | 150  |
| Jemima Farrell  | Massage Room 1 | 140  |
| GUEST GUEST     | Tennis Court 1 | 75   |
| GUEST GUEST     | Tennis Court 2 | 75   |
| GUEST GUEST     | Tennis Court 1 | 75   |
| Matthew Genting | Massage Room 1 | 70   |
| Florence Bader  | Massage Room 2 | 70   |
| GUEST GUEST     | Squash Court   | 70   |
| Jemima Farrell  | Massage Room 1 | 70   |
| Ponder Stibbons | Massage Room 1 | 70   |
| Burton Tracy    | Massage Room 1 | 70   |
| Jack Smith      | Massage Room 1 | 70   |
| GUEST GUEST     | Squash Court   | 35   |
| GUEST GUEST     | Squash Court   | 35   |

## Answer:

```sql
SELECT
  member,
  facility,
  cost
FROM
  (
    SELECT
      CONCAT (members.firstname, ' ', members.surname) as member,
      facilities.name as facility,
      (
        CASE
          WHEN members.memid = 0 THEN facilities.guestcost
          ELSE facilities.membercost
        END
      ) * bookings.slots as cost
    FROM
      cd.bookings bookings
      INNER JOIN cd.members members ON members.memid = bookings.memid
      INNER JOIN cd.facilities facilities ON facilities.facid = bookings.facid
    WHERE
      bookings.starttime >= '2012-09-14'
      AND bookings.starttime < '2012-09-15'
  ) bookings
WHERE
  cost > 30
ORDER BY
  cost desc;
```
