# SQL Exercise: Rank members by (rounded) hours used

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

Produce a list of members (including guests), along with the number of hours they've booked in facilities, rounded to the nearest ten hours. Rank them by this rounded figure, producing output of first name, surname, rounded hours, rank. Sort by rank, surname, and first name.

## Expected Output:

| Firstname | Surname           | Hours | Rank |
| --------- | ----------------- | ----- | ---- |
| GUEST     | GUEST             | 1200  | 1    |
| Darren    | Smith             | 340   | 2    |
| Tim       | Rownam            | 330   | 3    |
| Tim       | Boothe            | 220   | 4    |
| Tracy     | Smith             | 220   | 4    |
| Gerald    | Butters           | 210   | 6    |
| Burton    | Tracy             | 180   | 7    |
| Charles   | Owen              | 170   | 8    |
| Janice    | Joplette          | 160   | 9    |
| Anne      | Baker             | 150   | 10   |
| Timothy   | Baker             | 150   | 10   |
| David     | Jones             | 150   | 10   |
| Nancy     | Dare              | 130   | 13   |
| Florence  | Bader             | 120   | 14   |
| Anna      | Mackenzie         | 120   | 14   |
| Ponder    | Stibbons          | 120   | 14   |
| Jack      | Smith             | 110   | 17   |
| Jemima    | Farrell           | 90    | 18   |
| David     | Pinker            | 80    | 19   |
| Ramnaresh | Sarwin            | 80    | 19   |
| Matthew   | Genting           | 70    | 21   |
| Joan      | Coplin            | 50    | 22   |
| David     | Farrell           | 30    | 23   |
| Henry     | Worthington-Smyth | 30    | 23   |
| John      | Hunt              | 20    | 25   |
| Douglas   | Jones             | 20    | 25   |
| Millicent | Purview           | 20    | 25   |
| Henrietta | Rumney            | 20    | 25   |
| Erica     | Crumpet           | 10    | 29   |
| Hyacinth  | Tupperware        | 10    | 29   |

## Answer:

```sql
SELECT
  firstname,
  surname,
  hours,
  rank() OVER (
    ORDER BY
      hours DESC
  ) as rank
FROM
  cd.members
  INNER JOIN (
    SELECT
      mems.memid as memid,
      -- Here, we are adding 10 to avoid rounding value to 0 and dividing by 20 since slot is half hour so dividing by 2 is going to return hours and dividing by 10 will then allow us to round the number by removing fraction and then multiply it by 10 to round it. 
      -- ((sum(bks.slots) + 10) / 20) * 10 as hours,
      ROUND((SUM(slots) / 2), -1) as hours
    FROM
      cd.members mems
      INNER JOIN cd.bookings bks ON mems.memid = bks.memid
    GROUP BY
      mems.memid
  ) data ON cd.members.memid = data.memid
ORDER BY
  rank,
  surname,
  firstname;
```
