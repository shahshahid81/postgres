# SQL Exercise: Removing duplicates, and ordering results

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

How can you produce an ordered list of the first 10 surnames in the members table? The list must not contain duplicates.

## Expected Output:

| surname |
| ------- |
| Bader   |
| Baker   |
| Boothe  |
| Butters |
| Coplin  |
| Crumpet |
| Dare    |
| Farrell |
| GUEST   |
| Genting |

## Answer:

```sql
SELECT
  DISTINCT surname
from
  cd.members
ORDER BY
  surname
LIMIT
  10;
```
