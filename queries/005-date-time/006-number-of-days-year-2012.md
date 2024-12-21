# SQL Exercise: Work out the number of days in each month of 2012

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

For each month of the year in 2012, output the number of days in that month. Format the output as an integer column containing the month of the year, and a second column containing an interval data type.

## Expected Output:

| Month | Length  |
| ----- | ------- |
| 1     | 31 days |
| 2     | 29 days |
| 3     | 31 days |
| 4     | 30 days |
| 5     | 31 days |
| 6     | 30 days |
| 7     | 31 days |
| 8     | 31 days |
| 9     | 30 days |
| 10    | 31 days |
| 11    | 30 days |
| 12    | 31 days |

## Answer:

* Using window function (Complicated query but good example of lead window function)
```sql
WITH date_series as (
  SELECT
    generate_series(
      '2012-01-01' :: timestamp,
      '2013-01-01',
      '1 month' :: interval
    ) as date
),
date_difference as (
  SELECT
    extract(
      month
      from
        date
    ) as month,
    extract(
      year
      from
        date
    ) as year,
    lead(date) OVER (
      order by
        date
    ) - date as length
  from
    date_series
)
SELECT
  month,
  length
from
  date_difference
WHERE
  year = '2012';
```

* Without window function
```sql
WITH date_series as (
  SELECT
    generate_series(
      '2012-01-01' :: timestamp,
      '2012-12-01',
      '1 month' :: interval
    ) as date
)
SELECT
  extract(
    month
    from
      date
  ),
  (date + interval '1 month') - date as length
from
  date_series
order by
  date;
```