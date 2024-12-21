# SQL Exercise: Find the top three revenue generating facilities

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

Produce a list of the top three revenue generating facilities (including ties). Output facility name and rank, sorted by rank and facility name.

## Expected Output:

| Name           | Rank |
| -------------- | ---- |
| Massage Room 1 | 1    |
| Massage Room 2 | 2    |
| Tennis Court 2 | 3    |

## Answer:
* With separate sum and rank function (for ease of understanding)
```sql
WITH revenue_data as (
  SELECT
    fcs.name as name,
    SUM(
      bks.slots * (
        CASE
          WHEN bks.memid = 0 THEN fcs.guestcost
          ELSE fcs.membercost
        END
      )
    ) as revenue
  FROM
    cd.bookings bks
    INNER JOIN cd.facilities fcs ON fcs.facid = bks.facid
  GROUP BY
    fcs.name
),
ranked_facility as (
  SELECT
    name,
    rank() OVER (
      ORDER BY
        revenue DESC
    ) as rank
  FROM
    revenue_data
)
SELECT
  *
from
  ranked_facility
WHERE
  rank <= 3;
```

* With combined rank and sum function
```sql
SELECT
  *
from
  (
    SELECT
      fcs.name as name,
      rank() OVER (
        ORDER BY
          SUM(
            bks.slots * (
              CASE
                WHEN bks.memid = 0 THEN fcs.guestcost
                ELSE fcs.membercost
              END
            )
          ) DESC
      ) as rank
    FROM
      cd.bookings bks
      INNER JOIN cd.facilities fcs ON fcs.facid = bks.facid
    GROUP BY
      fcs.name
  ) data
WHERE
  rank <= 3;
```
