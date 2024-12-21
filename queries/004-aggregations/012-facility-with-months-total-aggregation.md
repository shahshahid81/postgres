# SQL Exercise: List the total slots booked per facility per month, part 2

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

Produce a list of the total number of slots booked per facility per month in the year of 2012. In this version, include output rows containing totals for all months per facility, and a total for all months for all facilities. The output table should consist of facility id, month and slots, sorted by the id and month. When calculating the aggregated values for all months and all facids, return null values in the month and facid columns.

## Expected Output:
| Facid | Month | Slots |
| ----- | ----- | ----- |
| 0     | 7     | 270   |
| 0     | 8     | 459   |
| 0     | 9     | 591   |
| 0     |       | 1320  |
| 1     | 7     | 207   |
| 1     | 8     | 483   |
| 1     | 9     | 588   |
| 1     |       | 1278  |
| 2     | 7     | 180   |
| 2     | 8     | 459   |
| 2     | 9     | 570   |
| 2     |       | 1209  |
| 3     | 7     | 104   |
| 3     | 8     | 304   |
| 3     | 9     | 422   |
| 3     |       | 830   |
| 4     | 7     | 264   |
| 4     | 8     | 492   |
| 4     | 9     | 648   |
| 4     |       | 1404  |
| 5     | 7     | 24    |
| 5     | 8     | 82    |
| 5     | 9     | 122   |
| 5     |       | 228   |
| 6     | 7     | 164   |
| 6     | 8     | 400   |
| 6     | 9     | 540   |
| 6     |       | 1104  |
| 7     | 7     | 156   |
| 7     | 8     | 326   |
| 7     | 9     | 426   |
| 7     |       | 908   |
| 8     | 7     | 117   |
| 8     | 8     | 322   |
| 8     | 9     | 471   |
| 8     |       | 910   |
|       |       | 9191  |


## Answer:

* With CTE
```sql
WITH data AS (
  SELECT
    facid,
    EXTRACT(
      month
      FROM
        starttime
    ) as month,
    SUM(slots) as slots
  FROM
    cd.bookings
  WHERE EXTRACT(
      year
      FROM
        starttime
    ) = '2012'
  GROUP BY
    1,
    2
)
SELECT
  *
from
  data
UNION
SELECT
  facid,
  null as month,
  SUM(slots)
FROM
  data
group by
  facid
UNION
SELECT
  null as facid,
  null as month,
  SUM(slots)
FROM
  data
ORDER BY
  facid,
  month;
```

* WITH Rollup
```sql
select
  facid,
  extract(
    month
    from
      starttime
  ) as month,
  sum(slots) as slots
from
  cd.bookings
where
  starttime >= '2012-01-01'
  and starttime < '2013-01-01'
group by
  -- ROLLUP(facid, month) outputs aggregations on (facid, month), (facid), and ()
  -- CUBE(facid, month) will produce (facid, month), (month), (facid), and ()
  rollup(facid, month)
order by
  facid,
  month;
```
