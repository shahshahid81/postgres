# SQL Exercise: Pad zip codes with leading zeroes

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

The zip codes in our example dataset have had leading zeroes removed from them by virtue of being stored as a numeric type. Retrieve all zip codes from the members table, padding any zip codes less than 5 characters long with leading zeroes. Order by the new zip code.

## Expected Output:

| zip   |
| ----- |
| 00000 |
| 00234 |
| 00234 |
| 04321 |
| 04321 |
| 10383 |
| 11986 |
| 23423 |
| 28563 |
| 33862 |
| 34232 |
| 43532 |
| 43533 |
| 45678 |
| 52365 |
| 54333 |
| 56754 |
| 57392 |
| 58393 |
| 64577 |
| 65332 |
| 65464 |
| 66796 |
| 68666 |
| 69302 |
| 75655 |
| 78533 |
| 80743 |
| 84923 |
| 87630 |
| 97676 |

## Answer:

```sql
select
    LPAD(zipcode :: varchar, 5, '0') as zip
from
    cd.members
ORDER BY
    zip;
```