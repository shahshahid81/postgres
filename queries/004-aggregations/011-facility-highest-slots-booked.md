# SQL Exercise: Output the facility id that has the highest number of slots booked

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

Output the facility id that has the highest number of slots booked. For bonus points, try a version without a LIMIT clause. This version will probably look messy!

## Expected Output:

| Facid | Total Slots |
| ----- | ----------- |
| 4     | 1404        |

## Answer:

* WITH LIMIT, note that it will only send one row even when multiple rows are available.
```sql
SELECT
  cd.bookings.facid as facid,
  SUM(slots) as totalslots
FROM
  cd.bookings
GROUP BY
  cd.bookings.facid
ORDER BY
  2 DESC
LIMIT
  1;
```

* WITHOUT USING CTE

```sql
SELECT
  facid,
  sum(slots) as totalslots
FROM
  cd.bookings
GROUP BY
  cd.bookings.facid
HAVING
  sum(slots) = (
    SELECT
      max(totalslots)
    FROM
      (
        SELECT
          cd.bookings.facid as facid,
          SUM(slots) as totalslots
        FROM
          cd.bookings
        GROUP BY
          cd.bookings.facid
      ) inner_data
  );
```

* WITH CTE

```sql
WITH data as (
  SELECT
    cd.bookings.facid as facid,
    SUM(slots) as totalslots
  FROM
    cd.bookings
  GROUP BY
    cd.bookings.facid
)
SELECT
  facid,
  totalslots
FROM
  data
where
  totalslots = (
    SELECT
      max(totalslots)
    from
      data
  );
```